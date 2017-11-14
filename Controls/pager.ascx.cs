using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class Controls_pager : System.Web.UI.UserControl
{
    private static int _CurrentPage, RecordCount, PageCount;
    private static string _DatabaseTable, _SQLCondition, _SQLOrder;

    public int PageSize { get; set; }
    public string DatabaseTable
    {
        get
        {
            return _DatabaseTable;
        }

        set
        {
            _DatabaseTable = value;
        }
    }
    public string SQLCondition
    {
        get
        {
            return _SQLCondition;
        }

        set
        {
            _SQLCondition = value;
        }
    }
    public string SQLOrder
    {
        get
        {
            return _SQLOrder;
        }

        set
        {
            _SQLOrder = value;
        }
    }
    public int CurrentPage
    {
        get
        {
            return _CurrentPage;
        }

        set
        {
            _CurrentPage = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CurrentPage = 0;
        }
    }

    public DataSet CreatSource()
    {
        RecordCount = GetRecordCount();
        PageCount = (RecordCount % PageSize) == 0 ? RecordCount / PageSize : RecordCount / PageSize + 1;
        int StartIndex, EndIndex;
        StartIndex = CurrentPage * PageSize;
        EndIndex = (CurrentPage + 1) * PageSize + 1;
        string strSQL = "SELECT * FROM (SELECT ROW_NUMBER() OVER(" + SQLOrder + ")ROWNUMBER, *FROM " + DatabaseTable+" " + SQLCondition + ")A WHERE ROWNUMBER > " + StartIndex.ToString() + " AND ROWNUMBER < " + EndIndex.ToString();
        DataSet dataSet = DAL.SQLHelper.GetDataSet(strSQL);
        GeneratePager();
        PagerState();
        return dataSet;
    }

    protected int GetRecordCount()
    {
        string strSQL = "SELECT COUNT(*) FROM " + DatabaseTable + " " + SQLCondition;
        return (int)DAL.SQLHelper.GetObject(strSQL);
    }

    protected void GeneratePager()
    {
        string[] PageNumList;
        if (PageCount < 6)
        {
            PageNumList = new string[PageCount];
            for (int i = 1; i <= PageCount; i++)
            {
                PageNumList[i - 1] = i.ToString();
            }
        }
        else if (PageCount == 6)
        {
            if (CurrentPage >= 3)
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
            if (CurrentPage < 3)
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

    protected void PagerState()
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
        foreach (RepeaterItem item in this.PageNumRepeater.Items)
        {
            LinkButton link = item.FindControl("PageNumLinkButton") as LinkButton;
            if (link.CommandArgument!=null)
            {
                if (link.CommandArgument == "...")
                {
                    link.CssClass += "disabled";
                }
                else if (Convert.ToInt32(link.CommandArgument) == (CurrentPage + 1))
                {
                    link.CssClass += "active";
                }
            }
        }
    }

    public void Page_OnClick(Object sender, CommandEventArgs e)
    {
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
                if (e.CommandArgument!=null&&e.CommandArgument.ToString()!="...")
                {
                    CurrentPage = Convert.ToInt32(e.CommandArgument);
                    CurrentPage--;
                }
                break;
        }
    }
}