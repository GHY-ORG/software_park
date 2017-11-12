using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    int reValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt16(Session["Role"]) == 0)
        {
            Response.Redirect("noRight.html");
        }
    }
    public int CheckName()
    {
        string strSQL = "SELECT COUNT(*) FROM Admin WHERE UserName=@UserName";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@UserName", UserName)
        };
        try
        {
            DataTable dt = DAL.SQLHelper.GetTable(strSQL, paras);
            if (dt.Rows[0][0].ToString() != "0")
            {
                return -1;//该用户名已经存在
            }
            else
            {
                return 2;//该用户名尚未注册
            }
        }
        catch
        {
            return 0;
        }
    }

    public void Clear()
    {
        this.UserName.Text = "";
        this.Password.Text = "";
        this.rePassword.Text = "";
        this.RealName.Text = "";
    }

    protected void RegisterBtn_Click(object sender, EventArgs e)
    {
        reValue = CheckName();
        if (reValue == -1)
        {
            Response.Write("<script>alert('用户名存在！');</script>");
        }
        else
        {
            string UserName = this.UserName.Text.Trim();
            string Password = DAL.SQLHelper.GetMD5(this.Password.Text.Trim());//MD5加密
            string RealName = this.RealName.Text.Trim();
            int Role = 0;
            string strSQL = "INSERT INTO Admin(UserName,Password,RealName,Role) VALUES(@UserName,@Password,@RealName,@Role)";
            SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@UserName", UserName),
                new SqlParameter("@Password", Password),
                new SqlParameter("@RealName", RealName),
                new SqlParameter("@Role", Role)
            };
            try
            {
                int flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
                if (flag != 0)
                {
                    Response.Write("<script>alert('注册成功！');</script>");
                }
                else
                {
                    Response.Write("<script>alert('注册失败！');</script>");
                }
                Clear();
            }
            catch
            {
                Response.Write("<script>alert('注册失败！');</script>");
            }
        }
    }
}