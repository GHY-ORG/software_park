<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="softwareList.aspx.cs" Inherits="pages_softwareList" Title="软件园·软件" %>
<%@ Register Src="~/Controls/pager.ascx" TagPrefix="SoftwarePark" TagName="Pager" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Statics/css/softwareList.min.css?v=20180309" />
    <link rel="stylesheet" href="/Statics/css/swiper-3.4.2.min.css" />
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
            <SoftwarePark:Pager ID="Pager" runat="server" DatabaseTable="Class" PageSize="4" SQLCondition="" SQLOrder="Order BY ID DESC" />
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="js" runat="server">
    <script src="/Statics/js/swiper-3.4.2.jquery.min.js"></script>
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
</asp:Content>