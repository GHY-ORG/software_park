using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class pages_softwareList : System.Web.UI.Page
{
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        DataListBind();
    }

    protected void ClassRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater ArticleRepeater = (Repeater)e.Item.FindControl("ArticleRepeater");
            DataRowView rowv = (DataRowView)e.Item.DataItem;//提取分类ID 
            int ClassID = Convert.ToInt32(rowv["ID"]);
            string strSQL = "SELECT * FROM Article WHERE ID IN (SELECT ArticleID FROM ClassMap WHERE ClassID = @ClassID) AND State='1' AND Class='1'";
            SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@ClassID", ClassID)
            };
            ArticleRepeater.DataSource = DAL.SQLHelper.GetReader(strSQL, paras);
            ArticleRepeater.DataBind();
        }
    }

    public string GetSoftwareIcon(string ArticleID)
    {
        string SoftwareIcon, SoftwareID;
        string strSQL = "SELECT ExtraContent FROM Article WHERE ID=@ArticleID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID)
        };
        SoftwareID = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        strSQL = "SELECT Icon FROM Software WHERE ID=@SoftwareID";
        paras = new SqlParameter[]{
            new SqlParameter("@SoftwareID", SoftwareID)
        };
        SoftwareIcon = DAL.SQLHelper.GetObject(strSQL, paras).ToString().Replace(",", "");
        return SoftwareIcon;
    }

    public string GetSoftwareNameAndEdition(string ArticleID)
    {
        string SoftwareName, SoftwareID, SoftwareEdition;
        string strSQL = "SELECT ExtraContent FROM Article WHERE ID=@ArticleID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID)
        };
        SoftwareID = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        strSQL = "SELECT Name FROM Software WHERE ID=@SoftwareID";
        paras = new SqlParameter[]{
            new SqlParameter("@SoftwareID", SoftwareID)
        };
        SoftwareName = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        strSQL = "SELECT Edition FROM Software WHERE ID=@SoftwareID";
        SoftwareEdition = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        return SoftwareName + '&' + SoftwareEdition;
    }

    public void DataListBind()
    {
        ClassRepeater.DataSource = Pager.CreatSource();
        ClassRepeater.DataBind();
    }

    protected void Pager_OnPageIndexChanged(object sender, EventArgs e)
    {
        DataListBind();
    }
}