<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="softwareList.aspx.cs" Inherits="pages_softwareList" Title="软件园·软件" %>

    <asp:Content ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/css/softwareList.css?v=20170919" />
        <link rel="stylesheet" href="/css/swiper-3.4.2.min.css" />
    </asp:Content>

    <asp:Content ContentPlaceHolderID="body" runat="server">
        <!--位置-->
        <section class="softwarepark-breadcrumb">
            <div class="container">
                <div class="row">
                    <ol class="breadcrumb">
                        <li>
                            <span>你的位置:</span>
                        </li>
                        <li class="active">
                            <a href="/pages/softwareList.aspx">软件</a>
                        </li>
                        <span class="breadcrumb-end"></span>
                    </ol>
                </div>
            </div>
        </section>
        <div class="container">
            <!--文章-->
            <div id="software-list">
                <asp:Repeater ID="ClassRepeater" runat="server" OnItemDataBound="ClassRepeater_ItemDataBound">
                    <ItemTemplate>
                        <div class="software-class-name">
                            <div class="vertical-separator"></div>
                            <h4>
                                <%# DataBinder.Eval(Container.DataItem,"ClassName") %>
                            </h4>
                        </div>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <asp:Repeater ID="ArticleRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="swiper-slide">
                                            <div class="thumbnail">
                                                <a href="softwareDetail.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>">
                                                    <img src="<%# GetSoftwareIcon(DataBinder.Eval(Container.DataItem," ID ").ToString()) %>" alt="">
                                                </a>
                                                <a href="softwareDetail.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>" class="software-title">
                                                    <%# GetSoftwareNameAndEdition(DataBinder.Eval(Container.DataItem,"ID").ToString()) %>
                                                </a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
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
                                    <asp:LinkButton ID="PageNumLinkButton" OnCommand="Page_OnClick" CommandArgument="<%# Container.DataItem %>"
                                        CommandName="page" runat="server" CssClass="active">
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
        </div>
    </asp:Content>

    <asp:Content ContentPlaceHolderID="js" runat="server">
        <script src="/js/swiper-3.4.2.jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var swiper = new Swiper('.swiper-container', {
                    pagination: '.swiper-pagination',
                    nextButton: '.swiper-button-next',
                    prevButton: '.swiper-button-prev',
                    slidesPerView: 5.2,
                    paginationClickable: true,
                    spaceBetween: 15,
                });
            })
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#pagination li").removeClass();
                $("#pagination li:contains(...)").addClass("disabled");
                $("#pagination li:contains(" +<%=CurrentPage + 1 %> +")").addClass("active");
            });
        </script>
    </asp:Content>