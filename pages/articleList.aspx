<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="articleList.aspx.cs" Inherits="pages_articleList" Title="软件园·文章" %>

    <asp:Content ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/Statics/css/articleList.min.css?v=20171102" />
    </asp:Content>

    <asp:Content ContentPlaceHolderID="body" runat="server">
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
            <!--翻页-->
            <div class="text-center">
                <ul class="pagination" id="pagination">
                    <li>
                        <asp:LinkButton ID="PrevPageLinkButton" CommandName="prev" OnCommand="Page_OnClick" runat="server">
                            <i class="glyphicon glyphicon-menu-left"></i>
                        </asp:LinkButton>
                    </li>
                    <asp:Repeater ID="PageNumRepeater" runat="server">
                        <ItemTemplate>
                            <li>
                                <asp:LinkButton ID="PageNumLinkButton" OnCommand="Page_OnClick" CommandArgument="<%# Container.DataItem %>" CommandName="page"
                                    runat="server" CssClass="active">
                                    <%# Container.DataItem %>
                                </asp:LinkButton>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <li>
                        <asp:LinkButton ID="NextPageLinkButton" CommandName="next" OnCommand="Page_OnClick" runat="server">
                            <i class="glyphicon glyphicon-menu-right"></i>
                        </asp:LinkButton>
                    </li>
                </ul>
            </div>
        </div>
    </asp:Content>

    <asp:Content ContentPlaceHolderID="js" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                $("#pagination li").removeClass();
                $("#pagination li:contains(...)").addClass("disabled");
                $("#pagination li:contains(" +<%=CurrentPage + 1 %> +")").addClass("active");
            });
        </script>
    </asp:Content>