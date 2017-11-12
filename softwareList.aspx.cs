﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class softwareList : System.Web.UI.Page
{
    public int CurrentPage;
    int PageSize, RecordCount, PageCount;
    protected void Page_Load(object sender, EventArgs e)
    {
        PageSize = 4;
        if (!IsPostBack)
        {
            CurrentPage = 0;
            ViewState["PageIndex"] = 0;
            RecordCount = CalculateRecord();//计算总共有多少记录
            PageCount = Convert.ToInt32(Math.Ceiling(Convert.ToDouble(RecordCount) / PageSize));//计算总共有多少页
            ViewState["PageCount"] = PageCount;
            DataListBind();
        }
    }

    protected void ClassRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Repeater ArticleRepeater = (Repeater)e.Item.FindControl("ArticleRepeater");
            DataRowView rowv = (DataRowView)e.Item.DataItem;//提取分类ID 
            int ClassID = Convert.ToInt32(rowv["ID"]);
            string strSQL = "SELECT * FROM Article WHERE ID IN (SELECT ArticleID FROM ClassMap WHERE ClassID = @ClassID) AND State='1' AND Class='1'";
            SqlParameter[] paras = new SqlParameter[]{
                new SqlParameter("@ClassID", ClassID)
            };
            ArticleRepeater.DataSource = DAL.SQLHelper.GetReader(strSQL, paras);
            ArticleRepeater.DataBind();
        }
    }

    public string GetSoftwareIcon(string ArticleID)
    {
        string SoftwareIcon, SoftwareID;
        string strSQL = "SELECT ExtraContent FROM Article WHERE ID=@ArticleID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID)
        };
        SoftwareID = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        strSQL = "SELECT Icon FROM Software WHERE ID=@SoftwareID";
        paras = new SqlParameter[]{
            new SqlParameter("@SoftwareID", SoftwareID)
        };
        SoftwareIcon = DAL.SQLHelper.GetObject(strSQL, paras).ToString().Replace(",", "");
        return SoftwareIcon;
    }

    public string GetSoftwareNameAndEdition(string ArticleID)
    {
        string SoftwareName, SoftwareID, SoftwareEdition;
        string strSQL = "SELECT ExtraContent FROM Article WHERE ID=@ArticleID";
        SqlParameter[] paras = new SqlParameter[]{
            new SqlParameter("@ArticleID", ArticleID)
        };
        SoftwareID = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        strSQL = "SELECT Name FROM Software WHERE ID=@SoftwareID";
        paras = new SqlParameter[]{
            new SqlParameter("@SoftwareID", SoftwareID)
        };
        SoftwareName = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        strSQL = "SELECT Edition FROM Software WHERE ID=@SoftwareID";
        SoftwareEdition = DAL.SQLHelper.GetObject(strSQL, paras).ToString();
        return SoftwareName + '&' + SoftwareEdition;
    }

    public void DataListBind()
    {
        ClassRepeater.DataSource = CreateSource();
        ClassRepeater.DataBind();
        PageState();
    }

    //计算总共有多少条记录
    public int CalculateRecord()
    {
        string strSQL = "SELECT COUNT(*) FROM Class";
        DataTable dt = DAL.SQLHelper.GetTable(strSQL);
        return Int32.Parse(dt.Rows[0][0].ToString());
    }

    ICollection CreateSource()
    {
        int StartIndex;
        //设定导入的起终地址
        StartIndex = CurrentPage * PageSize;
        SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"].ToString());
        string strSQL = "SELECT * FROM Class Order BY ID DESC";
        DataSet ds = new DataSet();
        SqlDataAdapter sda = new SqlDataAdapter(strSQL, conn);
        sda.Fill(ds, StartIndex, PageSize, "ClassRepeater");
        return ds.Tables["ClassRepeater"].DefaultView;
    }

    //翻页按钮事件
    public void Page_OnClick(Object sender, CommandEventArgs e)
    {
        CurrentPage = (int)ViewState["PageIndex"];
        PageCount = (int)ViewState["PageCount"];
        string cmd = e.CommandName;
        switch (cmd)
        {
            case "next":
                if (CurrentPage < (PageCount - 1)) CurrentPage++;
                break;
            case "prev":
                if (CurrentPage > 0) CurrentPage--;
                break;
            case "page":
                CurrentPage = Convert.ToInt32(e.CommandArgument);
                CurrentPage--;
                break;
        }
        ViewState["PageIndex"] = CurrentPage;
        DataListBind();
    }

    //更新翻页按钮
    private void PageState()
    {
        if (CurrentPage == (PageCount - 1))
        {
            NextPageLinkButton.Enabled = false;
            NextPageLinkButton.Style["display"] = "none";
        }
        else
        {
            NextPageLinkButton.Enabled = true;
            NextPageLinkButton.Style["display"] = "block";
        }
        if (CurrentPage == 0)
        {
            PrevPageLinkButton.Enabled = false;
            PrevPageLinkButton.Style["display"] = "none";
        }
        else
        {
            PrevPageLinkButton.Enabled = true;
            PrevPageLinkButton.Style["display"] = "block";
        }
        PageNumRepeaterBind();
    }

    //生成翻页按钮,并进行绑定
    protected void PageNumRepeaterBind()
    {
        int PageNumListIndex = 0;
        string[] PageNumList;
        if (PageCount < 6)
        {
            PageNumList = new string[PageCount];
            for (int i = 1; i <= PageCount; i++)
            {
                PageNumList[PageNumListIndex] = i.ToString();
                PageNumListIndex++;
            }
        }
        else if (PageCount == 6)
        {
            if (CurrentPage == 4)
            {
                PageNumList = new string[6] { "1", "...", "3", "4", "5", "6" };
            }
            else
            {
                PageNumList = new string[6] { "1", "2", "3", "4", "...", "6" };
            }
        }
        else
        {
            if (CurrentPage <= 3)
            {
                PageNumList = new string[6] { "1", "2", "3", "4", "...", PageCount.ToString() };
            }
            else if (CurrentPage >= (PageCount - 3))
            {
                PageNumList = new string[6] { "1", "...", (PageCount - 3).ToString(), (PageCount - 2).ToString(), (PageCount - 1).ToString(), PageCount.ToString() };
            }
            else
            {
                PageNumList = new string[7] { "1", "...", CurrentPage.ToString(), (CurrentPage + 1).ToString(), (CurrentPage + 2).ToString(), "...", PageCount.ToString() };
            }
        }
        this.PageNumRepeater.DataSource = PageNumList;
        this.PageNumRepeater.DataBind();
    }

}