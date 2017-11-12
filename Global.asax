<%@ Application Language="C#" %>

<script runat="server">
    protected void Application_AcquireRequestState(object sender, EventArgs e)
    {
        Uri url = Request.Url;  //得到当前请求的URL
                                //访问Admin目录，需要进行登陆验证。
        if (url.AbsolutePath.StartsWith("/admin") && url.AbsolutePath != "/admin/pages/login.aspx" && HttpContext.Current.Session != null && HttpContext.Current.Session["UserName"] == null)
        {
            HttpContext.Current.Response.Redirect("/admin/pages/login.aspx");
        }
    }
    void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码

    }

    void Application_End(object sender, EventArgs e)
    {
        //  在应用程序关闭时运行的代码

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。

    }

</script>
