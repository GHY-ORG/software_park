using System;
using System.Data.SqlClient;

public partial class articleDetail : System.Web.UI.Page
{
    public string ArticleID, ArticleTitle, ArticleAuthor, ArticleUploadTime, ArticleBrowseTimes, ArticleContent;
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
        ArticleTitle = ArticleReader["Title"].ToString();
        ArticleAuthor = ArticleReader["Author"].ToString();
        ArticleContent = ArticleReader["ArticleContent"].ToString();
        ArticleBrowseTimes = ArticleReader["BrowseTimes"].ToString();
        ArticleUploadTime = Convert.ToDateTime(ArticleReader["UploadTime"]).ToString("MM/dd/yyyy");
    }
}