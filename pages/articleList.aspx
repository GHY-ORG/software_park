<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="articleList.aspx.cs" Inherits="pages_articleList" Title="软件园·文章" %>
<%@ Register Src="~/Controls/pager.ascx" TagPrefix="SoftwarePark" TagName="Pager" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Statics/css/articleList.min.css?v=20171113" />
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server" ViewStateMode="Inherit">
    <section class="softwarepark-breadcrumb">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li>
                        <span>你的位置:</span>
                    </li>
                    <li class="active">
                        <a href="/pages/articleList.aspx">文章</a>
                    </li>
                    <span class="breadcrumb-end"></span>
                </ol>
            </div>
        </div>
    </section>
    <div class="container">
        <!--文章-->
        <div id="article-list">
            <asp:Repeater ID="ArticleRepeater" runat="server">
                <ItemTemplate>
                    <div class="article-block">
                        <div class="row">
                            <div class="col-xs-4 article-block-banner">
                                <a href="/pages/articleDetail.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>">
                                    <img src="<%# DataBinder.Eval(Container.DataItem," BannerURL ") %>" alt="Banner">
                                </a>
                            </div>
                            <div class="col-xs-8 article-block-text">
                                <a href="/pages/articleDetail.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>" class="article-block-title">
                                    <p>
                                        <%# DataBinder.Eval(Container.DataItem,"Title") %>
                                    </p>
                                </a>
                                <a href="/pages/articleDetail.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>" class="article-block-content">
                                    <p>文章摘要：
                                        <%# returnContent(DataBinder.Eval(Container.DataItem, "ArticleContent").ToString()) %>...</p>
                                </a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <SoftwarePark:Pager ID="Pager" runat="server" DatabaseTable="Article" PageSize="4" SQLCondition="WHERE State='1' AND Class='0'"
            SQLOrder="ORDER BY StickState DESC, UploadTime DESC" OnPageIndexChanged="Pager_OnPageIndexChanged" />
    </div>
</asp:Content>