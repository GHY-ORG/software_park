using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        string UserName = this.UserName.Text.Trim();
        string Password = DAL.SQLHelper.GetMD5(this.Password.Text.Trim());//对密码进行加密处理
        string strSQL = "SELECT * FROM Admin WHERE UserName = @UserName AND Password = @Password";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@UserName", UserName),
            new SqlParameter("@Password", Password)
        };
        SqlDataReader reader = DAL.SQLHelper.GetReader(strSQL,paras);
        reader.Read();
        if (reader.HasRows)
        {
            Session["UserID"] = reader.GetValue(0);
            Session["UserName"] = reader.GetValue(1);
            Session["Role"] = reader.GetValue(5);
            this.Password.Text = "";
            Response.Redirect("index.aspx");
        }
        else
        {
            this.Password.Text = "";
            Response.Write("<script>alert('登录失败！');</script>");
        }
    }
}