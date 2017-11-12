using System;
using System.Data.SqlClient;

public partial class UserEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void Clear()
    {
        this.OldPassword.Text = "";
        this.NewPassword.Text = "";
        this.rePassword.Text = "";
    }

    protected void UserEditBtn_Click(object sender, EventArgs e)
    {
        string ID;
        if (Request.QueryString["userid"] != null)
        {
             ID = Request.QueryString["userid"];
        }
        else
        {
            ID = Session["UserID"].ToString();

        }
        string OldPassword = DAL.SQLHelper.GetMD5(this.OldPassword.Text.ToString());
        string NewPassword = DAL.SQLHelper.GetMD5(this.NewPassword.Text.ToString());//MD5加密
        string strSQL = "SELECT * FROM Admin WHERE ID = @ID AND Password = @OldPassword";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@ID", ID),
            new SqlParameter("@OldPassword", OldPassword),
        };
        SqlDataReader reader = DAL.SQLHelper.GetReader(strSQL,paras);
        reader.Read();
        if (reader.HasRows)
        {
            strSQL = "UPDATE Admin SET Password = @NewPassword WHERE ID = @ID";
            paras = new SqlParameter[]{
                new SqlParameter("@ID", ID),
                new SqlParameter("@NewPassword", NewPassword),
            };
            try
            {
                int flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
                if (flag == 0)
                {
                    Response.Write("<script>alert('修改失败！');</script>");
                }
                else
                {
                    Response.Write("<script>alert('修改成功！');</script>");
                }
                Clear();
            }
            catch
            {
                Response.Write("<script>alert('修改失败！');</script>");
            }
        }
        else
        {
            Response.Write("<script language =javascript>alert('原密码错误')</script>");
        }
    }
}