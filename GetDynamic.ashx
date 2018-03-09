<%@ WebHandler Language="C#" Class="GetDynamic" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Threading;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;

public class GetDynamic : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        List<DynamicInfo> ListQuery;
        int count = Convert.ToInt32(context.Request.QueryString["count"].ToString());
        int start = Convert.ToInt32(context.Request.QueryString["start"].ToString());
        if (context.Request.QueryString["searchclass"] != null && context.Request.QueryString["searchcontent"] != null)
        {
            int searchClass = Convert.ToInt32(context.Request.QueryString["searchclass"].ToString());
            string searchContent = HttpUtility.UrlDecode(context.Request.QueryString["searchcontent"].ToString());
            ListQuery = DynamicInfo.GetDynamicList(start, count, searchContent, searchClass);
        }
        else
        {
            ListQuery = DynamicInfo.GetDynamicList(start, count);
        }
        string ResultJson;
        if (ListQuery.Count>0)
        {
            ResultJson=ObjectToJson<List<DynamicInfo>>(ListQuery);
        }
        else
        {
            ResultJson = "";
        }
        context.Response.Write(ResultJson);
    }

    public static string ObjectToJson<T>(T t)
    {
        try
        {
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(t.GetType());
            using (MemoryStream ms = new MemoryStream())
            {
                serializer.WriteObject(ms, t);
                return Encoding.UTF8.GetString(ms.ToArray());
            }
        }
        catch
        {
            return null;
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}