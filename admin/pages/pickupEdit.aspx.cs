using System;
using System.Data.SqlClient;
using System.Web;

public partial class admin_pages_pickupEdit : System.Web.UI.Page
{
    string CommendItem, CommendContent, ContactInfo, IPAddress, CommendItemID, CommendItemState;
    public string CommendItemIcon = "None";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            IconImageGalleryDataListBind();
            if (Request.QueryString["commenditemid"] != null)
            {
                CommendItemID = Request.QueryString["commenditemid"];
                GetCommendItem(CommendItemID);
            }
        }
    }
    protected void GetCommendItem(string id)
    {
        string strSQL = "SELECT * FROM Pickup WHERE ID = @CommendItemID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@CommendItemID", id)
        };
        SqlDataReader dr = DAL.SQLHelper.GetReader(strSQL, paras);
        dr.Read();
        if (dr.HasRows)
        {
            CommendItem = dr["CommendItem"].ToString();
            CommendItemIcon = dr["CommendItemIcon"].ToString();
            CommendContent = dr["CommendContent"].ToString();
            ContactInfo = dr["ContactInfo"].ToString();
            CommendItemState = dr["State"].ToString();


            this.CommendItemTextBox.Text = CommendItem;
            this.CommendContentTextBox.Text = CommendContent;
            this.ContactInfoTextBox.Text = ContactInfo;
            for (int i = 0; i < this.CommendItemStateRadioButtonList.Items.Count; i++)
            {
                if (this.CommendItemState.Equals(this.CommendItemStateRadioButtonList.Items[i].Value))
                {
                    this.CommendItemStateRadioButtonList.Items[i].Selected = true;
                }
            }
        }
    }
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

    public string URLConvertor(string absoluteURL)
    {
        string tmpRootDir = Server.MapPath(System.Web.HttpContext.Current.Request.ApplicationPath.ToString());//获取程序根目录
        string relativeURL = "/" + absoluteURL.Replace(tmpRootDir, "").Replace("\\", "/"); //拼接成相对路径
        return relativeURL;
    }

    private void IconImageGalleryDataListBind()
    {
        string path = Server.MapPath("~/upload/icon/");
        System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(path);
        IconImageGallaryRepeater.DataSource = di.GetFiles();//获取文件夹下所有的文件 
        IconImageGallaryRepeater.DataBind();
    }

    protected void RefreshIconImageGalleryBtn_Click(object sender, EventArgs e)
    {
        IconImageGalleryDataListBind();
    }

    protected void PickupSubmitBtn_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["commenditemid"] != null)
        {
            CommendItemID = Request.QueryString["commenditemid"];
        }
        CommendItem = this.CommendItemTextBox.Text;
        if (!string.IsNullOrEmpty(Request.Params["hidden1"]))
        {
            CommendItemIcon = Request.Params["hidden1"];
        }
        CommendContent = this.CommendContentTextBox.Text;
        ContactInfo = this.ContactInfoTextBox.Text;
        IPAddress = GetIPAddress();
        CommendItemState = this.CommendItemStateRadioButtonList.SelectedValue;
        string strSQL;
        int flag;
        try
        {
            if (string.IsNullOrEmpty(CommendItemID))
            {
                strSQL = "INSERT INTO Pickup(CommendItem,CommendItemIcon,CommendContent,IPAddress,ContactInfo,State) VALUES (@CommendItem,@CommendItemIcon,@CommendContent,@IPAddress,@ContactInfo,@CommendItemState);SELECT SCOPE_IDENTITY()";
                SqlParameter[] paras = new SqlParameter[]{
                        new SqlParameter("@CommendItem", CommendItem),
                        new SqlParameter("@CommendItemIcon", CommendItemIcon),
                        new SqlParameter("@CommendContent", CommendContent),
                        new SqlParameter("@IPAddress", IPAddress),
                        new SqlParameter("@ContactInfo", ContactInfo),
                        new SqlParameter("@CommendItemState", CommendItemState)
                    };
                CommendItemID = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
                if (CommendItemID == null)
                {
                    flag = 0;
                }
                else
                {
                    flag = 1;
                }
            }
            else
            {
                strSQL = "UPDATE  Pickup SET CommendItem=@CommendItem, CommendItemIcon=@CommendItemIcon, CommendContent=@CommendContent, ContactInfo=@ContactInfo,State=@CommendItemState WHERE ID=@CommendItemID";
                SqlParameter[] paras = new SqlParameter[]{
                        new SqlParameter("@CommendItem", CommendItem),
                        new SqlParameter("@CommendItemIcon", CommendItemIcon),
                        new SqlParameter("@CommendContent", CommendContent),
                        new SqlParameter("@ContactInfo", ContactInfo),
                        new SqlParameter("@CommendItemState", CommendItemState),
                        new SqlParameter("@CommendItemID", CommendItemID),
                    };
                flag = DAL.SQLHelper.ExcuteSQL(strSQL, paras);
            }

            if (flag != 0)
            {
                Response.Redirect("pickupList.aspx");
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