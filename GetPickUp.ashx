<%@ WebHandler Language="C#" Class="GetPickUp" %>
using System;
using System.Web;
using System.Collections.Generic;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;

public class GetPickUp : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        int count = Convert.ToInt32(context.Request.QueryString["count"].ToString());
        int start = Convert.ToInt32(context.Request.QueryString["start"].ToString());
        List<PickupInfo> ListQuery = PickupInfo.GetPickupList(start, count);
        string ResultJson;
        if (ListQuery.Count>0)
        {
            ResultJson=ObjectToJson<List<PickupInfo>>(ListQuery);
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