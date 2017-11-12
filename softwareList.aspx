<%@ Page Language="C#" AutoEventWireup="true" CodeFile="softwareList.aspx.cs" Inherits="softwareList" %>
<%@ Register TagPrefix="SoftwarePark" TagName="Header" Src="~/control/header.ascx"%>
<%@ Register TagPrefix="SoftwarePark" TagName="Footer" Src="~/control/footer.ascx"%>
<%@ Register TagPrefix="SoftwarePark" TagName="ContactUsModal" Src="~/control/contactUsModal.ascx" %>
<%@ Register TagPrefix="SoftwarePark" TagName="FloatingWindiw" Src="~/control/floatingWindow.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />   
    <meta name="keywords" content="西南财经大学，西财，西南财大，光华园，软件园，swufe" />
    <meta name="description" content="西南财经大学党委宣传部领导下的校园学生门户网站光华园网站的子网软件园，西财师生下载正版软件、浏览互联网资讯、分享软件、学习电脑技能技巧等的平台" />
    <meta name="copyright" content="Copyright © www.ghy.cn 2001-2017 All Rights Reserved." />
    <meta name="robots" content="all" />
    <title>软件园·软件</title>
    <link rel="icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="shortcut icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="stylesheet" href="./css/normalize.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/global.css?v=20170919" />
    <link rel="stylesheet" href="./css/softwareList.css?v=20170919" />
    <link rel="stylesheet" href="./css/swiper-3.4.2.min.css" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <SoftwarePark:Header ID="iHeader" runat="server" />
        <!--位置-->
        <section class="softwarepark-breadcrumb">
            <div class="container">
                <div class="row">
                    <ol class="breadcrumb">
                        <li><span>你的位置:</span></li>
                        <li><a href="index.aspx">首页</a></li>
                        <li class="active"><a href="softwareList.aspx">软件</a></li>
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
                            <h4><%# DataBinder.Eval(Container.DataItem,"ClassName") %></h4>
                        </div>
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                                <asp:Repeater ID="ArticleRepeater" runat="server">
                                    <ItemTemplate>
                                        <div class="swiper-slide">
                                            <div class="thumbnail">
                                                <a href="softwareDetail.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><img src="<%# GetSoftwareIcon(DataBinder.Eval(Container.DataItem,"ID").ToString()) %>" alt=""></a>
                                                <a href="softwareDetail.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID") %>" class="software-title"><%# GetSoftwareNameAndEdition(DataBinder.Eval(Container.DataItem,"ID").ToString()) %></a>
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
                        <li><asp:LinkButton ID="PrevPageLinkButton" CommandName="prev" OnCommand="Page_OnClick" runat="server"><i class="glyphicon glyphicon-menu-left"></i></asp:LinkButton></li>
                        <asp:Repeater ID="PageNumRepeater" runat="server">
                            <ItemTemplate>
                                <li><asp:LinkButton ID="PageNumLinkButton" OnCommand="Page_OnClick" CommandArgument="<%# Container.DataItem %>" CommandName="page" runat="server" CssClass="active"><%# Container.DataItem %></asp:LinkButton></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <li><asp:LinkButton ID="NextPageLinkButton" CommandName="next" OnCommand="Page_OnClick" runat="server"><i class="glyphicon glyphicon-menu-right"></i></asp:LinkButton></li>
                    </ul>
                </div>
            </div>
        </div>
        <SoftwarePark:FloatingWindiw ID="FloatingWindow" runat="server" />
        <SoftwarePark:ContactUsModal ID="ContactUsModal" runat="server" />
        <SoftwarePark:Footer ID="Footer" runat="server" />
    </form>
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/global.js?v=20170919"></script>
    <script src="./js/swiper-3.4.2.jquery.min.js"></script>
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
            $("#pagination li:contains(" +<%=CurrentPage+1%>+")").addClass("active");
        });
    </script>
</body>

</html>