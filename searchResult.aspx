<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchResult.aspx.cs" Inherits="searchResult" %>
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
    <title>软件园·搜索结果</title>
    <link rel="icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="shortcut icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="stylesheet" href="./css/normalize.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/index.css?v=20170919" />
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
                        <li class="active"><a href="#">搜索结果</a></li>
                        <span class="breadcrumb-end"></span>
                    </ol>
                </div>
            </div>
        </section>
        <div class="container">
            <!--动态-->
            <div id="dynamic">
            </div>
            <!--加载更多-->
            <div id="dynamic-end" style="display:none;">
                <p>没有更多啦╮(╯▽╰)╭</p>
                <div class="dynamic-end-line"></div>
            </div>
            <div class="text-center"><button type="button" class="btn btn-info" id="btn-more">更 多</button></div>
        </div>
        <SoftwarePark:FloatingWindiw ID="FloatingWindow" runat="server" />
        <SoftwarePark:ContactUsModal ID="ContactUsModal" runat="server" />
        <SoftwarePark:Footer ID="Footer" runat="server" />
    </form>
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/global.js?v=20170919"></script>
    <script src="./js/searchResult.js?v=20170919"></script>
</body>
</html>
