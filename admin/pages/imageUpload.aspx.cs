using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_pages_imageUpload : System.Web.UI.Page
{
    string path;
    protected void Page_Load(object sender, EventArgs e)
    {
        path = Request.QueryString["path"];
    }
    public string renturnPath()
    {
        return path;
    }
}