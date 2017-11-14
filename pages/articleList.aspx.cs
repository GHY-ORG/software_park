using System;

public partial class pages_articleList : System.Web.UI.Page
{
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        DataListBind();
    }

    public void DataListBind()
    {
        ArticleRepeater.DataSource = Pager.CreatSource();
        ArticleRepeater.DataBind();
    }

    //将html格式转换为text且长度小于等于80
    public string returnContent(string content)
    {
        HtmlToText convert = new HtmlToText();
        string str = convert.Convert(content);
        if (str.Length > 80)
        {
            str = str.Substring(0, 80);
        }
        return str;
    }
}