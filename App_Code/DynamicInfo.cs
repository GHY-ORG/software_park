using System;
using System.Collections.Generic;
using System.Data.SqlClient;

/// <summary>
/// NewsInfo 的摘要说明
/// </summary>
public class DynamicInfo
{

    public string DynamicID,DynamicClass, DynamicTitle, DynamicUploadTime, DynamicBannerURL, DynamicContent, DynamicViewtimes,DynamicLink;
    public string DynamicTagsName = "", DynamicTagsID = "";
    public DynamicInfo()
    {
    //
    // TODO: 在此处添加构造函数逻辑
    //
    }
    public static List<DynamicInfo> GetDynamicList(int start,int count,string searchContent="",int searchClass=0)
    {
        string selVal;
        if (searchClass == 0)//无搜索
        {
            selVal = "";
        }
        else if (searchClass == 1)//搜索的为标签
        {
            selVal = "AND ID IN (SELECT ArticleID FROM TagMap WHERE TagID='" + searchContent + "')";
        }
        else
        {
            selVal = "AND (ArticleContent='%" + searchContent + "%' OR Title='%" + searchContent + "%')";
        }
        string strSQL = "SELECT TOP " + count + " * FROM Article WHERE State = '1' " + selVal + " AND ID NOT IN(SELECT TOP " + start + " ID FROM Article WHERE State = '1' ORDER BY StickState DESC, UploadTime DESC) ORDER BY StickState DESC, UploadTime DESC";
        SqlDataReader DynamicDataReader = DAL.SQLHelper.GetReader(strSQL);
        List<DynamicInfo> DynamicList = new List<DynamicInfo>();
        while (DynamicDataReader.Read())
        {
            DynamicInfo info = new DynamicInfo();
            info.DynamicID = DynamicDataReader["ID"].ToString();
            string str1,str2;
            switch (Convert.ToInt32(DynamicDataReader["Class"].ToString()))
            {
                case 0:
                    str1 = "文章";
                    str2 = "/pages/articleDetail.aspx?id=" + info.DynamicID;
                    break;
                case 1:
                    str1 = "软件";
                    str2 = "/pages/softwareDetail.aspx?id=" + info.DynamicID;
                    break;
                case 2:
                    str1 = "专题";
                    str2 = DynamicDataReader["ExtraContent"].ToString();
                    break;
                default:
                    str1 = "无效的分类";
                    str2 = "#";
                    break;
            }
            info.DynamicClass = str1;
            info.DynamicLink = str2;
            info.DynamicTitle = DynamicDataReader["Title"].ToString();
            info.DynamicUploadTime = Convert.ToDateTime(DynamicDataReader["UploadTime"].ToString()).ToString("MM/dd/yyyy");
            info.DynamicBannerURL = DynamicDataReader["BannerURL"].ToString();
            HtmlToText convert = new HtmlToText();
            str1 = convert.Convert(DynamicDataReader["ArticleContent"].ToString());
            if (str1.Length>80)
            {
                str1 = str1.Substring(0, 80);
            }
            info.DynamicContent = str1 + "...";
            info.DynamicViewtimes = DynamicDataReader["BrowseTimes"].ToString();
            strSQL = "SELECT TOP 3 * FROM Tag WHERE ID IN (SELECT TagID FROM TagMap WHERE ArticleID = @ArticleID)";
            SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@ArticleID", DynamicDataReader["ID"].ToString())
            };
            SqlDataReader DynamicTagsDataReader = DAL.SQLHelper.GetReader(strSQL,paras);
            while (DynamicTagsDataReader.Read())
            {
                info.DynamicTagsName += DynamicTagsDataReader["TagName"]+",";
                info.DynamicTagsID += DynamicTagsDataReader["ID"]+",";
            }
            DynamicList.Add(info);
        }
        return DynamicList;
    }
}