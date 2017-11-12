<%@ Page Language="C#" AutoEventWireup="true" CodeFile="articleDetail.aspx.cs" Inherits="articleDetail" %>
<%@ Register TagPrefix="SoftwarePark" TagName="Header" Src="~/control/header.ascx"%>
<%@ Register TagPrefix="SoftwarePark" TagName="Footer" Src="~/control/footer.ascx"%>
<%@ Register TagPrefix="SoftwarePark" TagName="ContactUsModal" Src="~/control/contactUsModal.ascx" %>
<%@ Register TagPrefix="SoftwarePark" TagName="FloatingWindow" Src="~/control/floatingWindow.ascx" %>

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
    <title>软件园·文章·<%=ArticleTitle %></title>
    <link rel="icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="shortcut icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="stylesheet" href="./css/normalize.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/articleDetail.css?v=20170919" />
    <link rel="stylesheet" href="./css/global.css?v=20170919" />
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
                        <li><a href="articleList.aspx">文章</a></li>
                        <li class="active">
                            <a href="articleDetail?id=<%=ArticleID %>.aspx"><%=ArticleTitle %></a>
                        </li>
                        <span class="breadcrumb-end"></span>
                    </ol>
                </div>
            </div>
        </section>
        <!--文章-->
        <div class="container">
            <div class="article-title">
                <h1><%=ArticleTitle %></h1>
                <div class="article-info">
                    <p>作者：<%=ArticleAuthor %></p>
                    <p>上传时间：<%=ArticleUploadTime %></p>
                    <p><i class="glyphicon glyphicon-eye-open"></i>浏览量：<%=ArticleBrowseTimes %></p>
                </div>
            </div>
            <div class="article-content">
                <%=ArticleContent %>
            </div>
        </div>
        <SoftwarePark:FloatingWindow ID="FloatingWindow" runat="server" />
        <SoftwarePark:ContactUsModal ID="ContactUsModal" runat="server" />
        <SoftwarePark:Footer ID="Footer" runat="server" />
    </form>
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/global.js?v=20170919"></script>
</body>

</html>