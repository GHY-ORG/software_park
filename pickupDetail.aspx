<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pickupDetail.aspx.cs" Inherits="pickupDetail" %>
<%@ Register TagPrefix="softwarePark" TagName="Header" Src="~/control/header.ascx"%>
<%@ Register TagPrefix="softwarePark" TagName="Footer" Src="~/control/footer.ascx"%>
<%@ Register TagPrefix="softwarePark" TagName="ContactUsModal" Src="~/control/contactUsModal.ascx" %>
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
    <title>软件园·P!CKUP·P!CK</title>
    <link rel="icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="shortcut icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="stylesheet" href="./css/normalize.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/global.css?v=20170919" />
    <link rel="stylesheet" href="./css/pickupDetail.css?v=20170919" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <softwarePark:Header ID="iHeader" runat="server" />
        <!--位置-->
        <section class="softwarepark-breadcrumb">
            <div class="container">
                <div class="row">
                    <ol class="breadcrumb">
                        <li><span>你的位置:</span></li>
                        <li><a href="index.aspx">首页</a></li>
                        <li><a href="pickupList.aspx">P!ICKUP</a></li>
                        <li class="active"><a href="pickupDetail.aspx?id=<%=PickupID %>">P!CK</a></li>
                        <span class="breadcrumb-end"></span>
                    </ol>
                </div>
            </div>
        </section>
        <div class="container">
            <!--pickup-->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-pick-commenditemicon">
                        <img src="<%=PickupCommendItemIcon %>" alt="">
                    </div>
                    <div class="panel-pick-title">
                        <h3 class="panel-pick-commenditem">
                            <%=PickupCommendItem %>
                        </h3>
                        <p class="panel-pick-uploadtime">发布时间：
                            <%=PickupUploadTime %>
                        </p>
                    </div>
                    <asp:LinkButton ID="UpvoteLinkBtn" runat="server" CssClass="btn btn-primary" OnClick="UpvoteLinkBtn_Click"><i class="glyphicon glyphicon-thumbs-up"></i>
                        <%=PickupUpvoteNum %>次</asp:LinkButton>
                </div>
                <div class="panel-body">
                    <div class="panel-pick-commendcontent">
                        <p>
                            <%=PickupCommendContent %>
                        </p>
                        <i class="taptap-icon icon-quote-left"></i>
                        <i class="taptap-icon icon-quote-right"></i>
                    </div>
                </div>
            </div>
            <!--分页按钮-->
            <div class="text-center">
                <asp:LinkButton ID="PrevLinkBtn" CssClass="btn btn-info btn-pager" runat="server" OnClick="PrevLinkBtn_Click">上 一 个</asp:LinkButton>
                <asp:LinkButton ID="NextLinkBtn" CssClass="btn btn-info btn-pager" runat="server" OnClick="NextLinkBtn_Click">下 一 个</asp:LinkButton>
            </div>
        </div>
        <SoftwarePark:FloatingWindiw ID="FloatingWindow" runat="server" />
        <softwarePark:ContactUsModal ID="ContactUsModal" runat="server" />
        <softwarePark:Footer ID="Footer" runat="server" />
    </form>
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/masonry.pkgd.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/global.js?v=20170919"></script>
</body>

</html>