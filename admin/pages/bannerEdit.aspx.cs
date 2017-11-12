using System;
using System.Data.SqlClient;

public partial class admin_pages_bannerEdit : System.Web.UI.Page
{
    string BannerID, BannerDescription, BannerLink, BannerState;
    public string BannerImageSrc = "None";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BannerImageGalleryDataListBind();
            if (Request.QueryString["id"] != null)
            {
                BannerID = Request.QueryString["id"];
                GetBanner(BannerID);
            }
        }
    }

    public void GetBanner(string BannerID)
    {
        string strSQL = "SELECT * FROM Banner WHERE ID = @BannerID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@BannerID", BannerID)
        };
        SqlDataReader dr = DAL.SQLHelper.GetReader(strSQL, paras);
        dr.Read();
        if (dr.HasRows)
        {
            BannerImageSrc = dr["ImageSrc"].ToString();
            BannerDescription = dr["Description"].ToString();
            BannerLink = dr["Link"].ToString();
            BannerState = dr["State"].ToString();

            this.BannerDescriptionTextBox.Text = BannerDescription;
            this.BannerLinkTextBox.Text = BannerLink;
            for (int i = 0; i < this.BannerStateRadioButtonList.Items.Count; i++)
            {
                if (this.BannerState.Equals(this.BannerStateRadioButtonList.Items[i].Value))
                {
                    this.BannerStateRadioButtonList.Items[i].Selected = true;
                }
            }
        }
    }

    private void BannerImageGalleryDataListBind()
    {
        string path = Server.MapPath("~/upload/banner/");
        System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(path);
        BannerImageGallaryRepeater.DataSource = di.GetFiles();//获取文件夹下所有的文件 
        BannerImageGallaryRepeater.DataBind();
    }

    public string URLConvertor(string absoluteURL)
    {
        string tmpRootDir = Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath.ToString());//获取程序根目录
        string relativeURL = "/" + absoluteURL.Replace(tmpRootDir, "").Replace("\\", "/"); //拼接成相对路径
        return relativeURL;
    }

    protected void BannerSubmitBtn_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            BannerID = Request.QueryString["id"];
        }
        if (!string.IsNullOrEmpty(Request.Params["hidden1"]))
        {
            BannerImageSrc = Request.Params["hidden1"];
        }
        BannerDescription = this.BannerDescriptionTextBox.Text;
        BannerLink = this.BannerLinkTextBox.Text;
        BannerState = this.BannerStateRadioButtonList.SelectedValue;
        string strSQL;
        SqlParameter[] paras;
        int flag;
        try
        {
            if (string.IsNullOrEmpty(BannerID))
            {
                strSQL = "INSERT INTO Banner(ImageSrc,Description,Link,State) VALUES (@BannerImageSrc,@BannerDescription,@BannerLink,@BannerState)";
                paras = new SqlParameter[]{
                        new SqlParameter("@BannerImageSrc", BannerImageSrc),
                        new SqlParameter("@BannerDescription", BannerDescription),
                        new SqlParameter("@BannerLink", BannerLink),
                        new SqlParameter("@BannerState", BannerState)
                    };
            }
            else
            {
                strSQL = "UPDATE  Banner SET ImageSrc=@BannerImageSrc, Description=@BannerDescription, Link=@BannerLink, State=@BannerState WHERE ID=@BannerID";
                paras = new SqlParameter[]{
                        new SqlParameter("@BannerImageSrc", BannerImageSrc),
                        new SqlParameter("@BannerDescription", BannerDescription),
                        new SqlParameter("@BannerLink", BannerLink),
                        new SqlParameter("@BannerState", BannerState),
                        new SqlParameter("@BannerID", BannerID)
                    };
            }
            flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            if (flag != 0)
            {
                Response.Redirect("bannerList.aspx");
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

    protected void RefreshBannerImageGalleryBtn_Click(object sender, EventArgs e)
    {
        BannerImageGalleryDataListBind();
    }
}