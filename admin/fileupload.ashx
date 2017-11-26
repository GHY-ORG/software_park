<%@ WebHandler Language="C#" Class="fileupload" %>

using System;
using System.Web;
using System.IO;

public class fileupload : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        if (context.Request["REQUEST_METHOD"] == "OPTIONS")
        {
            context.Response.End();
        }
        string path = context.Request.QueryString["path"];
        SaveFile(path);
    }

    //修改
    public static string GetTimeStamp()
    {
        TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
        return Convert.ToInt64(ts.TotalSeconds).ToString();
    }

    private void SaveFile(string path)
    {
        //修改
        string basePath = "~/upload/" + path + "/";
        var name = string.Empty;
        basePath = (basePath.IndexOf("~") > -1) ? HttpContext.Current.Server.MapPath(basePath) :
        basePath;
        HttpFileCollection files = HttpContext.Current.Request.Files;

        if (!Directory.Exists(basePath))
            Directory.CreateDirectory(basePath);
        Random r = new Random();
        var suffix = files[0].ContentType.Split('/');
        name = basePath + GetTimeStamp() + r.Next(100000, 1000000).ToString() + "." + suffix[1];
        files[0].SaveAs(name);
        var _result = "{\"jsonrpc\" : \"2.0\", \"result\" : null, \"id\" : \"" + name + "\"}";
        HttpContext.Current.Response.Write(_result);
    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}