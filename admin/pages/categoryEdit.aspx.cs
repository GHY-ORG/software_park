using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class admin_pages_categoryEdit : System.Web.UI.Page
{
    static string selVal = "";

    string ClassID, ClassName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Role"] == null)
        {
            Response.Redirect("noRight.html");
        }
        else
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    ClassID = Request.QueryString["id"];
                    string strSQL = "SELECT ClassName FROM Class WHERE ID = @ClassID";
                    SqlParameter[] paras = new SqlParameter[]{
                        new SqlParameter("@ClassID", ClassID)
                    };
                    this.ClassNameTextBox.Text = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
                }
                selVal = "WHERE ID IN (SELECT ArticleID FROM ClassMap WHERE ClassID='" + ClassID + "')";
                DataListBind();
                selVal = null;
            }
        }
    }
    //用于绑定DataList控件
    public void DataListBind()
    {
        Pager.SQLCondition = selVal;
        ArticleRepeater.DataSource = Pager.CreatSource();
        ArticleRepeater.DataBind();
    }

    protected void Pager_OnPageIndexChanged(object sender, EventArgs e)
    {
        DataListBind();
    }

    public string ReturnClass(int Class)
    {
        string str;
        switch (Class)
        {
            case 0:
                str = "文章";
                break;
            case 1:
                str = "软件";
                break;
            case 2:
                str = "专题";
                break;
            default:
                str = "无效的分类";
                break;
        }
        return str;
    }

    public string ReturnState(int State)
    {
        string str;
        switch (State)
        {
            case 0:
                str = "待审核";
                break;
            case 1:
                str = "发布";
                break;
            default:
                str = "无效的状态";
                break;
        }
        return str;
    }

    protected void ArticleRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater TagsRepeater = (Repeater)e.Item.FindControl("TagsRepeater");
            DataRowView rowv = (DataRowView)e.Item.DataItem;//提取分类ID 
            int ArticleID = Convert.ToInt32(rowv["ID"]);
            string strSQL = "SELECT * FROM Tag WHERE ID IN (SELECT TagID FROM TagMap WHERE ArticleID = @ArticleID)";
            SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@ArticleID", ArticleID)
            };
            TagsRepeater.DataSource = DAL.SQLHelper.GetReader(strSQL, paras);
            TagsRepeater.DataBind();
        }
    }

    protected void ClassSubmitBtn_Click(object sender, EventArgs e)
    {
        ClassName = this.ClassNameTextBox.Text;
        string strSQL;
        int flag;
        if (Request.QueryString["id"] != null)
        {
            ClassID = Request.QueryString["id"];
        }
        try
        {
            if (string.IsNullOrEmpty(ClassID))
            {
                strSQL = "INSERT INTO Class (ClassName) VALUES(@ClassName)";
                SqlParameter[] paras = new SqlParameter[]{
                        new SqlParameter("@ClassName", ClassName),
                    };
                flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            }
            else
            {
                strSQL = "UPDATE  Class SET ClassName=@ClassName WHERE ID=@ClassID";
                SqlParameter[] paras = new SqlParameter[]{
                        new SqlParameter("@ClassName", ClassName),
                        new SqlParameter("@ClassID", ClassID)
                    };
                flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            }

            if (flag != 0)
            {
                Response.Redirect("categoryList.aspx");
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