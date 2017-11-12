using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_pages_softwareEdit : System.Web.UI.Page
{
    string SoftwareID, SoftwareName, SoftwareEdition, SoftwareOfficialWebsite, SoftwareDownloadWebsite, SoftwareLanguage, SoftwareAuthorizationWay, SoftwareRunningEnvironment, SoftwareSize, SoftwareState;
    public string SoftwareIcon = "None", SoftwareScreenShots = "None";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            IconImageGalleryDataListBind();
            ScreenShotsImageGalleryDataListBind();
            if (Request.QueryString["softwareid"] != null)
            {
                SoftwareID = Request.QueryString["softwareid"];
                GetSoftware(SoftwareID);
            }
        }
    }
    protected void GetSoftware(string id)
    {
        string strSQL = "SELECT * FROM Software WHERE ID = @SoftwareID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@SoftwareID", id)
        };
        SqlDataReader dr = DAL.SQLHelper.GetReader(strSQL, paras);
        dr.Read();
        if (dr.HasRows)
        {
            SoftwareName = dr.GetValue(1).ToString();
            SoftwareIcon = dr.GetValue(2).ToString();
            SoftwareEdition = dr.GetValue(3).ToString();
            SoftwareLanguage = dr.GetValue(4).ToString();
            SoftwareRunningEnvironment = dr.GetValue(5).ToString();
            SoftwareAuthorizationWay = dr.GetValue(6).ToString();
            SoftwareSize = dr.GetValue(7).ToString();
            SoftwareScreenShots = dr.GetValue(8).ToString();
            SoftwareOfficialWebsite = dr.GetValue(9).ToString();
            SoftwareDownloadWebsite = dr.GetValue(10).ToString();
            SoftwareState = dr.GetValue(11).ToString();

            this.SoftwareNameTextBox.Text = SoftwareName;
            this.SoftwareEditionTextBox.Text = SoftwareEdition;
            this.SoftwareOfficialWebsiteTextBox.Text = SoftwareOfficialWebsite;
            this.SoftwareDownloadWebsiteTextBox.Text = SoftwareDownloadWebsite;
            for (int i = 0; i < this.SoftwareLanguageDropDownList.Items.Count; i++)
            {
                if (SoftwareLanguage.Equals(this.SoftwareLanguageDropDownList.Items[i].Value))
                {
                    this.SoftwareLanguageDropDownList.Items[i].Selected = true;
                }
            }
            SetChecked(this.SoftwareRunningEnvironmentCheckBoxList, SoftwareRunningEnvironment, ",");
            for (int i = 0; i < this.SoftwareAuthorizationWayDropDownList.Items.Count; i++)
            {
                if (SoftwareAuthorizationWay.Equals(this.SoftwareAuthorizationWayDropDownList.Items[i].Value))
                {
                    this.SoftwareAuthorizationWayDropDownList.Items[i].Selected = true;
                }
            }
            this.SoftwareSizeTextBox.Text = SoftwareSize;
            for (int i = 0; i < this.SoftwareStateRadioButtonList.Items.Count; i++)
            {
                if (this.SoftwareState.Equals(this.SoftwareStateRadioButtonList.Items[i].Value))
                {
                    this.SoftwareStateRadioButtonList.Items[i].Selected = true;
                }
            }
        }
    }

    public string URLConvertor(string absoluteURL)
    {
        string tmpRootDir = Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath.ToString());//获取程序根目录
        string relativeURL = "/" + absoluteURL.Replace(tmpRootDir, "").Replace("\\", "/"); //拼接成相对路径
        return relativeURL;
    }

    private void IconImageGalleryDataListBind()
    {
        string path = Server.MapPath("~/upload/icon/");
        System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(path);
        IconImageGallaryRepeater.DataSource = di.GetFiles();//获取文件夹下所有的文件 
        IconImageGallaryRepeater.DataBind();
    }

    private void ScreenShotsImageGalleryDataListBind()
    {
        string path = Server.MapPath("~/upload/screenshots/");
        System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(path);
        ScreenShotsImageGallaryRepeater.DataSource = di.GetFiles();//获取文件夹下所有的文件 
        ScreenShotsImageGallaryRepeater.DataBind();
    }

    private void SetChecked(CheckBoxList checkList, string selval, string separator)
    {
        selval = separator + selval + separator;        //例如："0,1,1,2,1"->",0,1,1,2,1,"
        for (int i = 0; i < checkList.Items.Count; i++)
        {
            checkList.Items[i].Selected = false;
            string val = separator + checkList.Items[i].Value + separator;
            if (selval.IndexOf(val) != -1)
            {
                checkList.Items[i].Selected = true;
                selval = selval.Replace(val, separator);        //然后从原来的值串中删除已经选中了的
                if (selval == separator)        //selval的最后一项也被选中的话，此时经过Replace后，只会剩下一个分隔符
                {
                    selval += separator;        //添加一个分隔符
                }
            }
        }
    }

    private string GetChecked(CheckBoxList checkList, string separator)
    {
        string selval = "";
        for (int i = 0; i < checkList.Items.Count; i++)
        {
            if (checkList.Items[i].Selected)
            {
                selval += checkList.Items[i].Value + separator;
            }
        }
        return selval;
    }

    protected void RefreshIconImageGalleryBtn_Click(object sender, EventArgs e)
    {
        IconImageGalleryDataListBind();
    }

    protected void RefreshScreenShotsImageGallary_Click(object sender, EventArgs e)
    {
        ScreenShotsImageGalleryDataListBind();
    }

    protected void SoftwareSubmitBtn_Click(object sender, EventArgs e)
    {
        SoftwareName = this.SoftwareNameTextBox.Text;
        if (!string.IsNullOrEmpty(Request.Params["hidden1"]))
        {
            SoftwareIcon = Request.Params["hidden1"];
        }
        else
        {
            SoftwareIcon = "";
        }
        SoftwareEdition = this.SoftwareEditionTextBox.Text;
        SoftwareOfficialWebsite = this.SoftwareOfficialWebsiteTextBox.Text;
        SoftwareDownloadWebsite = this.SoftwareDownloadWebsiteTextBox.Text;
        SoftwareLanguage = this.SoftwareLanguageDropDownList.SelectedValue;
        SoftwareRunningEnvironment = "";
        SoftwareRunningEnvironment = GetChecked(this.SoftwareRunningEnvironmentCheckBoxList, ",");
        SoftwareAuthorizationWay = this.SoftwareAuthorizationWayDropDownList.SelectedValue;
        SoftwareSize = this.SoftwareSizeTextBox.Text;
        if (!string.IsNullOrEmpty(Request.Params["hidden2"]))
        {
            SoftwareScreenShots = Request.Params["hidden2"];
        }
        else
        {
            SoftwareScreenShots = "";
        }
        SoftwareState = SoftwareStateRadioButtonList.SelectedValue;
        if (Request.QueryString["softwareid"] != null)
        {
            SoftwareID = Request.QueryString["softwareid"];
        }
        string strSQL;
        int flag;
        try
        {
            if (string.IsNullOrEmpty(SoftwareID))
            {
                strSQL = "INSERT INTO Software(Name,Icon,Edition,Language,RunningEnvironment,AuthorizationWay,Size,ScreenShots,OfficialWebsite,DownloadWebsite,State) VALUES(@SoftwareName,@SoftwareIcon,@SoftwareEdition,@SoftwareLanguage,@SoftwareRunningEnvironment,@SoftwareAuthorizationWay,@SoftwareSize,@SoftwareScreenShots,@SoftwareOfficialWebsite,@SoftwareDownloadWebsite,@SoftwareState)";
                SqlParameter[] paras = new SqlParameter[]{
                    new SqlParameter("@SoftwareName", SoftwareName),
                    new SqlParameter("@SoftwareIcon", SoftwareIcon),
                    new SqlParameter("@SoftwareEdition", SoftwareEdition),
                    new SqlParameter("@SoftwareLanguage", SoftwareLanguage),
                    new SqlParameter("@SoftwareRunningEnvironment", SoftwareRunningEnvironment),
                    new SqlParameter("@SoftwareAuthorizationWay", SoftwareAuthorizationWay),
                    new SqlParameter("@SoftwareSize", SoftwareSize),
                    new SqlParameter("@SoftwareScreenShots", SoftwareScreenShots),
                    new SqlParameter("@SoftwareOfficialWebsite", SoftwareOfficialWebsite),
                    new SqlParameter("@SoftwareDownloadWebsite", SoftwareDownloadWebsite),
                    new SqlParameter("@SoftwareState", SoftwareState),
                };
                flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            }
            else
            {
                strSQL = "UPDATE Software SET Name = @SoftwareName, Icon=@SoftwareIcon, Edition=@SoftwareEdition, Language=@SoftwareLanguage, RunningEnvironment=@SoftwareRunningEnvironment, AuthorizationWay=@SoftwareAuthorizationWay, Size=@SoftwareSize, ScreenShots=@SoftwareScreenShots, OfficialWebsite= @SoftwareOfficialWebsite, DownloadWebsite=@SoftwareDownloadWebsite, State=@SoftwareState WHERE ID= @SoftwareID";
                SqlParameter[] paras = new SqlParameter[]{
                    new SqlParameter("@SoftwareName", SoftwareName),
                    new SqlParameter("@SoftwareIcon", SoftwareIcon),
                    new SqlParameter("@SoftwareEdition", SoftwareEdition),
                    new SqlParameter("@SoftwareLanguage", SoftwareLanguage),
                    new SqlParameter("@SoftwareRunningEnvironment", SoftwareRunningEnvironment),
                    new SqlParameter("@SoftwareAuthorizationWay", SoftwareAuthorizationWay),
                    new SqlParameter("@SoftwareSize", SoftwareSize),
                    new SqlParameter("@SoftwareScreenShots", SoftwareScreenShots),
                    new SqlParameter("@SoftwareOfficialWebsite", SoftwareOfficialWebsite),
                    new SqlParameter("@SoftwareDownloadWebsite", SoftwareDownloadWebsite),
                    new SqlParameter("@SoftwareState", SoftwareState),
                    new SqlParameter("@SoftwareID", SoftwareID),
                };
                flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            }
            if (flag != 0)
            {
                Response.Redirect("softwareList.aspx");
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
}