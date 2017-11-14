using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_pages_categoryList : System.Web.UI.Page
{
    static string selVal = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null)
        {
            Response.Redirect("noRight.html");
        }
        if (!IsPostBack)
        {
            selVal = "";
        }
    }
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        DataListBind();
    }
    //用于绑定DataList控件
    public void DataListBind()
    {
        Pager.SQLCondition = selVal;
        ClassRepeater.DataSource = Pager.CreatSource();
        ClassRepeater.DataBind();
    }

    //删除该条记录
    protected void DeleteLinkBtn_Click(object sender, EventArgs e)
    {
        string ID = (sender as LinkButton).CommandArgument;
        string strSQL = "DELETE FROM Class WHERE ID= @ID;DELETE FROM ClassMap WHERE ArticleID = @ArticleID";
        SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@ID", ID),
                new SqlParameter("@ArticleID", ID)
            };
        int reValue = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
        if (reValue == 0)
            Response.Write("<script>alert('删除失败！');</script>");
        DataListBind();
    }
    protected void Delete_LoadBtn(object sender, EventArgs e)
    {
        ((LinkButton)sender).Attributes["onclick"] = "javascript:return confirm('你确认要删除该条记录吗？')";
    }

    public string GetArticleNum(string ClassID)
    {
        string strSQL, ArticleNum;
        strSQL = "SELECT COUNT(*) FROM ClassMap WHERE ClassID = @ClassID";
        SqlParameter[] paras = new SqlParameter[] {
            new SqlParameter("@ClassID",ClassID)
        };
        ArticleNum = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        return ArticleNum;
    }
    
    //搜索
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        string SearchContent = this.SearchTextBox.Text.ToString().Trim();
        if (SearchContent != null && SearchContent != "")
        {
            selVal = "WHERE ClassName like '%" + SearchContent + "%'";
            Pager.CurrentPage = 0;
        }
        else
        {
            selVal = "";
        }
    }
}