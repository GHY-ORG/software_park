using System;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataListBind();
        }
    }
    protected void DataListBind()
    {
        string strSQL = "SELECT TOP 6 * FROM Banner WHERE State='1' ORDER BY ID Desc";
        BannerRepeater.DataSource = DAL.SQLHelper.GetReader(strSQL);
        BannerRepeater.DataBind();
    }
}