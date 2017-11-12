using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_pages_pickupList : System.Web.UI.Page
{
    string selVal = "";
    int PageSize, RecordCount, PageCount, CurrentPage;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null)
        {
            Response.Redirect("noRight.html");
        }
        else
        {
            PageSize = 20;
            if (!IsPostBack)
            {
                DataListBind();
            }
        }

    }
    //用于绑定DataList控件
    public void DataListBind()
    {
        DataList1.DataSource = CreateSource();
        DataList1.DataBind();
        PageState();

    }

    //删除该条记录
    protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string ID = e.CommandArgument.ToString();
        string strSQL = "DELETE FROM Pickup WHERE ID= @ID";
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

    //计算总共有多少条记录
    public int CalculateRecord()
    {
        string strSQL = "SELECT COUNT(*) FROM Pickup " + selVal;
        DataTable dt = DAL.SQLHelper.GetTable(strSQL);
        return Int32.Parse(dt.Rows[0][0].ToString());
    }

    ICollection CreateSource()
    {
        int StartIndex;
        //设定导入的起终地址
        StartIndex = CurrentPage * PageSize;
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"].ToString());
        string strSQL = "SELECT * FROM Pickup " + selVal;
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(strSQL, conn);
        sda.Fill(ds, StartIndex, PageSize, "DataList1");
        return ds.Tables["DataList1"].DefaultView;
    }

    public void Page_OnClick(Object sender, CommandEventArgs e)
    {
        CurrentPage = (int)ViewState["PageIndex"];
        PageCount = (int)ViewState["PageCount"];
        string cmd = e.CommandName;
        //判断cmd，以判定翻页方向
        switch (cmd)
        {
            case "next":
                if (CurrentPage < (PageCount - 1)) CurrentPage++;
                break;
            case "prev":
                if (CurrentPage > 0) CurrentPage--;
                break;
        }
        ViewState["PageIndex"] = CurrentPage;
        DataListBind();
    }
    private void PageState()
    {
        LinkBtnNextPage.Enabled = true;
        LinkBtnPrevPage.Enabled = true;
        if (CurrentPage == (PageCount - 1))
        {
            LinkBtnNextPage.Enabled = false;
        }
        if (CurrentPage == 0)
        {
            LinkBtnPrevPage.Enabled = false;
        }
        LableCurrentPage.Text = (CurrentPage + 1).ToString();
        CurrentPage = 0;
        ViewState["PageIndex"] = 0;
        RecordCount = CalculateRecord();//计算总共有多少记录
        LableRecordCount.Text = RecordCount.ToString();
        PageCount = Convert.ToInt32(Math.Ceiling(Convert.ToDouble(RecordCount) / PageSize));//计算总共有多少页
        LablePageCount.Text = PageCount.ToString();
        ViewState["PageCount"] = PageCount;
    }

    //搜索
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        string SearchContent = this.SearchTextBox.Text.ToString().Trim();
        if (SearchContent != null && SearchContent != "")
        {
            selVal = "WHERE CommendItem like '%" + SearchContent + "%'";
        }
        else
        {
            selVal = "";
        }
        DataListBind();
    }
}