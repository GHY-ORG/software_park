using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// PickupInfo 的摘要说明
/// </summary>
public class PickupInfo
{
    public string PickupID, PickupCommendItem, PickupCommendItemIcon, PickupCommendContent, PickupUploadTime;
    public PickupInfo()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static List<PickupInfo> GetPickupList(int start,int count)
    {
        string strSQL= "SELECT TOP " + count + " * FROM Pickup WHERE State = '1' AND ID NOT IN(SELECT TOP " + start + " ID FROM Pickup WHERE State = '1' ORDER BY UploadTime DESC) ORDER BY UploadTime DESC";
        SqlDataReader PickupDataReader = DAL.SQLHelper.GetReader(strSQL);
        List<PickupInfo> PickupList = new List<PickupInfo>();
        while (PickupDataReader.Read())
        {
            PickupInfo info = new PickupInfo();
            info.PickupID = PickupDataReader["ID"].ToString();
            info.PickupCommendItem = PickupDataReader["CommendItem"].ToString();
            info.PickupCommendItemIcon = PickupDataReader["CommendItemIcon"].ToString().Replace(",","");
            info.PickupCommendContent = PickupDataReader["CommendContent"].ToString();
            info.PickupUploadTime = Convert.ToDateTime(PickupDataReader["UploadTime"].ToString()).ToString("MM/dd/yyyy");
            PickupList.Add(info);
        }
        return PickupList;
    }
}