using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pickupDetail : System.Web.UI.Page
{
    public string PickupID, PickupCommendItem, PickupCommendItemIcon, PickupCommendContent, PickupUpvoteNum, PickupUploadTime;
    object PrevPickupID, NextPickupID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            PickupID = Request.QueryString["id"];
            GetPickup(PickupID);
        }
    }
    private void GetPickup(string PickupID)
    {
        string strSQL = "SELECT * FROM Pickup WHERE State='1' AND ID=@PickupID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@PickupID", PickupID)
        };
        SqlDataReader PickupReader = DAL.SQLHelper.GetReader(strSQL, paras);
        PickupReader.Read();
        PickupCommendItem = PickupReader["CommendItem"].ToString();
        PickupCommendItemIcon = PickupReader["CommendItemIcon"].ToString().Replace(",", "");
        PickupCommendContent = PickupReader["CommendContent"].ToString();
        PickupUpvoteNum = PickupReader["UpvoteNum"].ToString();
        PickupUploadTime = Convert.ToDateTime(PickupReader["UploadTime"]).ToString("MM/dd/yyyy");
        strSQL = "SELECT TOP 1 ID FROM Pickup WHERE State='1' AND ID < @PickupID ORDER BY ID DESC";
        PrevPickupID = DAL.SQLHelper.GetObject(strSQL, paras);
        if (PrevPickupID == null)
        {
            this.PrevLinkBtn.CssClass += " disabled";
        }
        strSQL = "SELECT TOP 1 ID FROM Pickup WHERE State='1' AND ID > @PickupID ORDER BY ID ASC";
        NextPickupID = DAL.SQLHelper.GetObject(strSQL, paras);
        if (NextPickupID == null)
        {
            this.NextLinkBtn.CssClass += " disabled";
        }
    }

    protected void UpvoteLinkBtn_Click(object sender, EventArgs e)
    {
        string PickupUpvoteState = "PickupUpvoteState" + PickupID;
        if (Request.Cookies[PickupUpvoteState] != null && Request.Cookies[PickupUpvoteState].Value == "true")
        {
            Response.Write("<script>alert('请勿重复点赞！');</script>");
        }
        else
        {
            string strSQL = "UPDATE Pickup SET UpvoteNum += 1 WHERE ID=@PickupID";
            SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@PickupID", PickupID)
            };
            DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            Response.Write("<script>document.location=document.location</script>");
        }
        HttpCookie t = new HttpCookie(PickupUpvoteState);
        t.Value = "true";
        t.Expires = DateTime.Now.AddDays(1);
        Response.Cookies.Add(t);
    }

    protected void PrevLinkBtn_Click(object sender, EventArgs e)
    {
        if (PrevPickupID != null)
        {
            Response.Redirect("pickupDetail.aspx?id=" + PrevPickupID.ToString());
        }
    }

    protected void NextLinkBtn_Click(object sender, EventArgs e)
    {
        if (NextPickupID != null)
        {
            Response.Redirect("pickupDetail.aspx?id=" + NextPickupID.ToString());
        }
    }
}