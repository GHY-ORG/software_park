using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class softwareDetail : System.Web.UI.Page
{
    public string ArticleID, ArticleUploadTime, ArticleContent,TagsID,TagsName;
    public string SoftwareID, SoftwareName, SoftwareEdition, SoftwareIcon, SoftwareLanguage, SoftwareRunningEnvironment, SoftwareAuthorizationWay, SoftwareSize, SoftwareScreenShots, SoftwareOfficialWebsite, SoftwareDownloadWebsite, SoftwareDownloadNum;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            ArticleID = Request.QueryString["id"];
            GetArticle(ArticleID);
            if (!IsPostBack)
            {
                string strSQL = "UPDATE Article SET BrowseTimes += 1 WHERE ID=@ArticleID";
                SqlParameter[] paras = new SqlParameter[]{
                    new SqlParameter("@ArticleID", ArticleID)
                };
                DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            }
        }
    }
    private void GetArticle(string ArticleID)
    {
        string strSQL = "SELECT * FROM Article WHERE State='1' AND ID=@ArticleID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID)
        };
        SqlDataReader ArticleReader = DAL.SQLHelper.GetReader(strSQL, paras);
        ArticleReader.Read();
        ArticleContent = ArticleReader["ArticleContent"].ToString();
        ArticleUploadTime = Convert.ToDateTime(ArticleReader["UploadTime"]).ToString("MM/dd/yyyy");
        SoftwareID = ArticleReader["ExtraContent"].ToString();
        GetSoftware(SoftwareID);
    }
    private void GetSoftware(string SoftwareID)
    {
        string strSQL = "SELECT * FROM Software WHERE State = '1' AND ID=@SoftwareID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@SoftwareID", SoftwareID)
        };
        SqlDataReader SoftwareReader = DAL.SQLHelper.GetReader(strSQL, paras);
        SoftwareReader.Read();
        SoftwareName = SoftwareReader["Name"].ToString();
        SoftwareEdition = SoftwareReader["Edition"].ToString();
        SoftwareIcon = SoftwareReader["Icon"].ToString().Replace(",","");
        switch (Convert.ToChar(SoftwareReader["Language"].ToString()))
        {
            case '0':
                SoftwareLanguage = "简体中文";
                break;
            case '1':
                SoftwareLanguage = "繁体中文";
                break;
            case '2':
                SoftwareLanguage = "英文";
                break;
            case '3':
                SoftwareLanguage = "其他";
                break;
            default:
                break;
        }
        SoftwareRunningEnvironment = SoftwareReader["RunningEnvironment"].ToString().Substring(0, SoftwareReader["RunningEnvironment"].ToString().LastIndexOf(","));
        switch (Convert.ToChar(SoftwareReader["AuthorizationWay"].ToString()))
        {
            case '0':
                SoftwareAuthorizationWay = "正版软件";
                break;
            case '1':
                SoftwareAuthorizationWay = "免费软件";
                break;
            case '2':
                SoftwareAuthorizationWay = "授权软件";
                break;
            default:
                break;
        }
        SoftwareSize = SoftwareReader["Size"].ToString();
        SoftwareScreenShots = SoftwareReader["ScreenShots"].ToString();
        SoftwareOfficialWebsite = SoftwareReader["OfficialWebsite"].ToString();
        SoftwareDownloadWebsite = "";
        string str = SoftwareReader["DownloadWebsite"].ToString();
        string[] instancestr =new string[4] { ":","/","?","&"};
        for (int i = 0; i < str.Length; i++)
        {
            int flag = 0;
            for (int j = 0; j < 4; j++)
            {
                if (Convert.ToString(str[i]) == instancestr[j])
                {
                    flag = 1;
                }
                else if (str[i].ToString()==" ")
                {
                    flag = 2;
                }
            }
            if (flag==1)
            {
                SoftwareDownloadWebsite += str[i];
            }
            else if (flag == 2)
            {
                SoftwareDownloadWebsite += "%20";
            }
            else
            {
                SoftwareDownloadWebsite += HttpUtility.UrlEncode(str[i].ToString(), System.Text.Encoding.GetEncoding("GB2312"));
            }
        }
        strSQL = "SELECT TOP 3 * FROM Tag WHERE ID IN (SELECT TagID FROM TagMap WHERE ArticleID = @ArticleID)";
        paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID)
        };
        SqlDataReader TagsReader = DAL.SQLHelper.GetReader(strSQL, paras);
        TagsID = "";
        TagsName = "";
        while (TagsReader.Read())
        {
            TagsName += TagsReader["TagName"] + ",";
            TagsID += TagsReader["ID"] + ",";
        }

    }

    protected void SoftwareDownloadLinkBtn_Click(object sender, EventArgs e)
    {
        string strSQL = "UPDATE Software SET DownloadNum += 1 WHERE ID=@SoftwareID";
        SqlParameter[] paras = new SqlParameter[]{
                    new SqlParameter("@SoftwareID", SoftwareID)
                };
        DAL.SQLHelper.ExcuteSQL(strSQL, paras);
        Response.Redirect(SoftwareDownloadWebsite);
    }
}