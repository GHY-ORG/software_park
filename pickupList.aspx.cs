using System;
using System.Data.SqlClient;
using System.Web;

public partial class pickupList : System.Web.UI.Page
{
    string CommendItem, CommendContent, ContactInfo, IPAddress;
    public string GetIPAddress()
    {
        string userIP;
        HttpRequest Request = HttpContext.Current.Request; // ForumContext.Current.Context.Request;  
                                                           // 如果使用代理，获取真实IP  
        if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != "")
            userIP = Request.ServerVariables["REMOTE_ADDR"];
        else
            userIP = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (userIP == null || userIP == "")
            userIP = Request.UserHostAddress;
        return userIP;
    }

    protected void CommendItemSubmitBtn_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["PickupState"] != null && Request.Cookies["PickupState"].Value == "true")
        {
            Response.Write("<script>alert('请一分钟后再次提交！');</script>");
        }
        else
        {
            CommendItem = this.CommendItemTextBox.Text;
            CommendContent = this.CommendContentTextBox.Text;
            ContactInfo = this.ContactInfoTextBox.Text;
            IPAddress = GetIPAddress();
            string strSQL;
            int flag;
            try
            {
                strSQL = "INSERT INTO Pickup(CommendItem,CommendContent,IPAddress,ContactInfo) VALUES (@CommendItem,@CommendContent,@IPAddress,@ContactInfo)";
                SqlParameter[] paras = new SqlParameter[]{
                        new SqlParameter("@CommendItem", CommendItem),
                        new SqlParameter("@CommendContent", CommendContent),
                        new SqlParameter("@IPAddress", IPAddress),
                        new SqlParameter("@ContactInfo", ContactInfo)
                    };
                flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
                if (flag == 0)
                {
                    Response.Write("<script>alert('发布失败！');</script>");
                }
                else
                {
                    this.CommendContentTextBox.Text = "";
                    this.CommendItemTextBox.Text = "";
                    this.ContactInfoTextBox.Text = "";
                    Response.Write("<script>alert('发布成功！');</script>");
                }
            }
            catch
            {
                Response.Write("<script>alert('发布失败！');</script>");
            }
        }
        HttpCookie PickupState = new HttpCookie("PickupState");
        PickupState.Value = "true";
        PickupState.Expires = DateTime.Now.AddMinutes(1);
        Response.Cookies.Add(PickupState);
    }
}