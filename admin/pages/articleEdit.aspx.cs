using System;
using System.Data.SqlClient;

public partial class admin_pages_articleEdit : System.Web.UI.Page
{
    string ArticleTitle,ArticleContent, ArticleExtraContent, ArticleClass, ArticleState, BannerURL,ArticleID;
    string[] ArticleTags;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ImageGalleryDataListBind();
            string strSQL = "SELECT * FROM Class";
            SqlDataReader ClassReader = DAL.SQLHelper.GetReader(strSQL);
            this.ClassCheckBoxList.DataSource = ClassReader;
            this.ClassCheckBoxList.DataTextField = "ClassName";
            this.ClassCheckBoxList.DataValueField = "ID";
            this.ClassCheckBoxList.DataBind();
            if (Request.QueryString["articleid"] != null)
            {
                ArticleID = Request.QueryString["articleid"];
                GetArticle(ArticleID);
            }
        }
    }

    protected void GetArticle(string ArticleID)
    {
        string strSQL = "SELECT * FROM Article WHERE ID = @ArticleID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID)
        };
        SqlDataReader dr = DAL.SQLHelper.GetReader(strSQL,paras);
        dr.Read();
        if (dr.HasRows)
        {
            ArticleTitle = dr.GetValue(1).ToString();
            ArticleContent = dr.GetValue(5).ToString();
            ArticleClass = dr.GetValue(6).ToString();
            ArticleState = dr.GetValue(7).ToString();
            ArticleExtraContent = dr.GetValue(8).ToString();
            BannerURL = dr.GetValue(9).ToString();

            this.ArticleTitleTextBox.Text = ArticleTitle;
            this.ArticleContentTextBox.Text = ArticleContent;
            this.ArticleLinkTextBox.Text = ArticleExtraContent;
            this.ShowBanner.ImageUrl = BannerURL;
            for (int i = 0; i < this.ArticleClassRadioButtonList.Items.Count; i++)
            {
                if (this.ArticleClass.Equals(ArticleClassRadioButtonList.Items[i].Value))
                {
                    this.ArticleClassRadioButtonList.Items[i].Selected = true;
                }
            }
            for (int i = 0; i < this.ArticleStateRadioButtonList.Items.Count; i++)
            {
                if (this.ArticleClass.Equals(ArticleStateRadioButtonList.Items[i].Value))
                {
                    this.ArticleStateRadioButtonList.Items[i].Selected = true;
                }
            }

        }
        strSQL = "SELECT TagName FROM Tag WHERE ID IN (SELECT TagID FROM TagMap WHERE ArticleID = @ArticleID)";
        paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID)
        };
        SqlDataReader TagReader = DAL.SQLHelper.GetReader(strSQL, paras);
        string str = "";
        while (TagReader.Read())
        {
            str += TagReader["TagName"].ToString() + ',';
        }
        if (str.Length > 0)
        {
            str = str.Substring(0, str.LastIndexOf(","));
        }
        this.ArticleTagsTextBox.Text = str;
        strSQL = "SELECT * FROM ClassMap WHERE ArticleID = @ArticleID";
        paras = new SqlParameter[]
        {
            new SqlParameter("@ArticleID",ArticleID)
        };
        SqlDataReader ClassReader = DAL.SQLHelper.GetReader(strSQL, paras);
        while (ClassReader.Read())
        {
            for (int i = 0; i < this.ClassCheckBoxList.Items.Count; i++)
            {
                if (ClassReader["ClassID"].ToString().Equals(this.ClassCheckBoxList.Items[i].Value))
                {
                    this.ClassCheckBoxList.Items[i].Selected = true;
                }
            }
        }
    }

    protected void RefreshImageGalleryBtn_Click(object sender, EventArgs e)
    {
        ImageGalleryDataListBind();
    }

    protected void SetAsBannerBtn_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.Params["hidden1"]))
        {
            Session["BannerURL"] = Request.Params["hidden1"].ToString();
            this.ShowBanner.ImageUrl = Session["BannerURL"].ToString();
        }
    }

    public string URLConvertor(string absoluteURL)
    {
        string tmpRootDir = Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath.ToString());//获取程序根目录
        string relativeURL = "/" + absoluteURL.Replace(tmpRootDir, "").Replace("\\", "/"); //拼接成相对路径
        return relativeURL;
    }

    private void ImageGalleryDataListBind()
    {
        string path = Server.MapPath("~/upload/banner/");
        System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(path);
        ImageGallaryRepeater.DataSource = di.GetFiles();//获取文件夹下所有的文件 
        ImageGallaryRepeater.DataBind();
    }

    protected void AppendTag(string tag)
    {
        string strSQL = "SELECT * FROM Tag WHERE TagName = @tag";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@tag", tag)
        };
        if (DAL.SQLHelper.ExcuteScalarSQL(strSQL,paras) == 0)
        {
            strSQL = "INSERT INTO Tag (TagName) VALUES (@tag)";
            DAL.SQLHelper.ExcuteSQL(strSQL, paras);
        }

        strSQL = "SELECT * FROM TagMap WHERE TagID=(SELECT ID FROM Tag WHERE TagName = @tag) AND ArticleID=@ArticleID";
        paras = new SqlParameter[]{
            new SqlParameter("@tag", tag),
            new SqlParameter("@ArticleID", ArticleID)
        };
        if (DAL.SQLHelper.ExcuteScalarSQL(strSQL,paras) == 0)
        {
            strSQL = "INSERT INTO TagMap(TagID) SELECT ID FROM Tag WHERE TagName = @tag;SELECT SCOPE_IDENTITY()";
            paras = new SqlParameter[]{
                new SqlParameter("@tag", tag)
            };
            string TagMapID = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
            strSQL = "UPDATE TagMap SET ArticleID = @ArticleID WHERE ID = @TagMapID";
            paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID),
            new SqlParameter("@TagMapID", TagMapID)
        };
            DAL.SQLHelper.ExcuteSQL(strSQL, paras);
        }
        
    }

    protected void AppendClass(string ArticleID) {
        for (int i = 0; i < this.ClassCheckBoxList.Items.Count; i++)
        {
            if (this.ClassCheckBoxList.Items[i].Selected)
            {
                string strSQL = "SELECT * FROM ClassMap WHERE ClassID = @ClassID AND ArticleID = @ArticleID";
                SqlParameter[] paras = new SqlParameter[] {
                    new SqlParameter("@ClassID",this.ClassCheckBoxList.Items[i].Value),
                    new SqlParameter("@ArticleID",ArticleID)
                };
                strSQL = "INSERT INTO ClassMap(ClassID,ArticleID) VALUES(@ClassID,@ArticleID)";
                DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            }
        }
    }

    protected void ArticleSubmitBtn_Click(object sender, EventArgs e)
    {
        ArticleTitle = this.ArticleTitleTextBox.Text;
        ArticleContent = this.ArticleContentTextBox.Text;
        ArticleExtraContent = this.ArticleLinkTextBox.Text;
        ArticleTags = this.ArticleTagsTextBox.Text.Split(',');
        ArticleClass = this.ArticleClassRadioButtonList.SelectedValue;
        ArticleState = this.ArticleStateRadioButtonList.SelectedValue;
        if (Session["BannerURL"] != null)
        {
            BannerURL = Session["BannerURL"].ToString();
        }
        else
        {
            BannerURL = "";
        }
        if (Request.QueryString["articleid"] != null)
        {
            ArticleID = Request.QueryString["articleid"];
        }
        if (!string.IsNullOrEmpty(ArticleTitle))
        {
            string strSQL;
            int flag;
            try
            {
                if (string.IsNullOrEmpty(ArticleID))
                {
                    strSQL = "INSERT INTO Article(Title,Author,ArticleContent,Class,State,ExtraContent,BannerURL) VALUES (@ArticleTitle,@UserName,@ArticleContent,@ArticleClass,@ArticleState,@ArticleExtraContent,@BannerURL);SELECT SCOPE_IDENTITY()";
                    SqlParameter[] paras = new SqlParameter[]{
                        new SqlParameter("@ArticleTitle", ArticleTitle),
                        new SqlParameter("@UserName", Session["UserName"].ToString()),
                        new SqlParameter("@ArticleContent", ArticleContent),
                        new SqlParameter("@ArticleClass", ArticleClass),
                        new SqlParameter("@ArticleState", ArticleState),
                        new SqlParameter("@ArticleExtraContent", ArticleExtraContent),
                        new SqlParameter("@BannerURL", BannerURL)
                    };
                    ArticleID = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
                    if (ArticleID == null)
                    {
                        flag = 0;
                    }
                    else
                    {
                        flag = 1;
                    }
                }
                else
                {
                    strSQL = "UPDATE  Article SET Title=@ArticleTitle, ArticleContent=@ArticleContent, Class=@ArticleClass, State=@ArticleState, ExtraContent=@ArticleExtraContent, BannerURL=@BannerURL WHERE ID=@ArticleID";
                    SqlParameter[] paras = new SqlParameter[]{
                        new SqlParameter("@ArticleTitle", ArticleTitle),
                        new SqlParameter("@ArticleContent", ArticleContent),
                        new SqlParameter("@ArticleClass", ArticleClass),
                        new SqlParameter("@ArticleState", ArticleState),
                        new SqlParameter("@ArticleExtraContent", ArticleExtraContent),
                        new SqlParameter("@BannerURL", BannerURL),
                        new SqlParameter("@ArticleID", ArticleID),
                    };
                    flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
                }

                if (flag != 0)
                {
                    for (int i = 0; i < ArticleTags.Length; i++)
                    {
                        AppendTag(ArticleTags[i]);
                    }
                    AppendClass(ArticleID);
                    Response.Redirect("articleList.aspx");
                }
                else
                {
                    Response.Write("<script>alert('发布失败！');</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('发布失败！');</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('标题不能为空！');</script>");
        }

    }
}