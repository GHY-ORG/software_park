<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" Title="软件园" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Statics/css/index.min.css?v=20171102" />
</asp:Content>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="container-fluid">
        <!--banner-->
        <div id="banner-carousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#banner-carousel" data-slide-to="0" class="active"></li>
                <li data-target="#banner-carousel" data-slide-to="1"></li>
                <li data-target="#banner-carousel" data-slide-to="2"></li>
                <li data-target="#banner-carousel" data-slide-to="3"></li>
                <li data-target="#banner-carousel" data-slide-to="4"></li>
                <li data-target="#banner-carousel" data-slide-to="5"></li>
            </ol>
            <div class="carousel-inner">
                <asp:Repeater ID="BannerRepeater" runat="server">
                    <ItemTemplate>
                        <div class="item <%# Container.ItemIndex==0?" active ":" " %>">
                            <a href="<%# DataBinder.Eval(Container.DataItem," Link ") %>">
                                <img class="img-responsive" src="<%# DataBinder.Eval(Container.DataItem," ImageSrc").ToString().Replace(", "," ") %>" alt="<%# DataBinder.Eval(Container.DataItem," Description ") %>" title="<%# DataBinder.Eval(Container.DataItem,"Description ") %>">
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!--动态-->
        <div id="dynamic">
        </div>
        <!--加载更多-->
        <div id="dynamic-end" style="display:none;">
            <p>没有更多啦╮(╯▽╰)╭</p>
            <div class="dynamic-end-line"></div>
        </div>
        <div class="text-center">
            <button type="button" class="btn btn-info" id="btn-more">更 多</button>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="js" runat="server">
    <script src="/Statics/js/index.min.js?v=20171113"></script>
</asp:Content>