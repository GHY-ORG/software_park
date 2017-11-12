<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pickupList.aspx.cs" Inherits="pickupList" %>
<%@ Register TagPrefix="softwarePark" TagName="Header" Src="~/control/header.ascx"%>
<%@ Register TagPrefix="softwarePark" TagName="Footer" Src="~/control/footer.ascx"%>
<%@ Register TagPrefix="softwarePark" TagName="ContactUsModal" Src="~/control/contactUsModal.ascx" %>
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
    <title>软件园·P!CKUP</title>
    <link rel="icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="shortcut icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="stylesheet" href="./css/normalize.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/global.css?v=20170919" />
    <link rel="stylesheet" href="./css/pickupList.css?v=20170919" />
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
                        <li class="active"><a href="pickupList.aspx">P!ICKUP</a></li>
                        <span class="breadcrumb-end"></span>
                    </ol>
                </div>
            </div>
        </section>
        <div class="container">
            <!--pickup标题-->
            <div class="pickup-title">
                <h1>P!ICKUP</h1>
                <p>P!ck新潮 Up热门</p>
                <button type="button" class="btn btn-info btn-let-me-up" data-toggle="modal" data-target="#let-me-up-modal">我要UP</button>
                <div class="pickup-title-line"></div>
            </div>
            <!--pickupList-->
            <div id="pickup-list">
            </div>
            <!--加载更多-->
            <div id="pickup-end" style="display:none;">
                <p>没有更多啦 戳“我要UP”看看呢</p>
                <div class="pickup-end-line"></div>
            </div>
            <div class="text-center"><button type="button" class="btn btn-info" id="btn-more">更 多</button></div>
        </div>
        <!--我要UP弹窗-->
        <div class="modal fade" id="let-me-up-modal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title text-center">— 我 要 U P —</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="sr-only" for="CommendItemTextBox">请输入被UP对象的名称或标题...</label>
                            <asp:TextBox ID="CommendItemTextBox" runat="server" placeholder="请输入被UP对象的名称或标题..." required="" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="CommendContentTextBox">请输入内容..</label>
                            <asp:TextBox ID="CommendContentTextBox" runat="server" placeholder="请输入内容..." TextMode="MultiLine" required="" ViewStateMode="Inherit"
                                CssClass="form-control" Rows="5"></asp:TextBox>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="CommendItemSubmitBtn" runat="server" CssClass="btn btn-info btn-submit" Text="提交" OnClick="CommendItemSubmitBtn_Click"
                            />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <span class="help-block">
                            <p>Ooops！都有些什么正确的UP姿势呢？</p>
                            <p>✔可安利软件、APP、游戏（内容健康、不侵权）</p>
                            <p>✔可署名</p>
                            <p>✔可留下您的联系方式（我们保证您的隐私）</p>
                        </span>
                        <div class="form-group">
                            <label class="sr-only" for="ContactInfoTextBox">您可以留下您的联系方式，也可不填</label>
                            <asp:TextBox ID="ContactInfoTextBox" runat="server" placeholder="您可以留下您的联系方式，也可不填" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <SoftwarePark:FloatingWindow ID="FloatingWindow" runat="server" />
        <softwarePark:ContactUsModal ID="ContactUsModal" runat="server" />
        <softwarePark:Footer ID="Footer" runat="server" />
    </form>
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script src="./js/masonry.pkgd.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/global.js?v=20170919"></script>
    <script src="./js/pickuplist.js?v=20170919"></script>
</body>

</html>