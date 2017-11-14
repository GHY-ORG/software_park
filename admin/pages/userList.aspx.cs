using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_pages_userList : System.Web.UI.Page
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
        DataList1.DataSource = Pager.CreatSource();
        DataList1.DataBind();
    }

    //设置用户的管理员权限
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "setRole")
        {
            string ID = e.CommandArgument.ToString();
            string roleText = ((Button)e.Item.FindControl("SetRoleBtn")).Text;
            int Role = (roleText == "取消管理员权限" ? 0 : 1);
            string strSQL = "UPDATE Admin SET Role= @Role WHERE ID= @ID";
            SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@Role", Role),
                new SqlParameter("@ID", ID)
            };
            int reValue = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            if (reValue == 0)
                Response.Write("<script>alert('管理员设置失败！');</script>");
            DataListBind();
        }
    }

    //删除该条记录
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        string strSQL = "DELETE FROM Admin WHERE ID= @ID";
        SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@ID", ID)
            };
        int reValue = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
        if (reValue == 0)
            Response.Write("<script>alert('删除失败！');</script>");
        DataListBind();
    }
    protected void Delete_LoadBtn(object sender, EventArgs e)
    {
        ((Button)sender).Attributes["onclick"] = "javascript:return confirm('你确认要删除该条记录吗？')";
    }

    //搜索
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        string SearchContent = this.SearchTextBox.Text.ToString().Trim();
        if (SearchContent != null && SearchContent !="")
        {
            selVal = "where RealName= '" + SearchContent + "' OR UserName like'%"  + SearchContent + "%'";
            Pager.CurrentPage = 0;
        }
        else
        {
            selVal = "";
        }
    }
}