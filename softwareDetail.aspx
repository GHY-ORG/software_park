<%@ Page Language="C#" AutoEventWireup="true" CodeFile="softwareDetail.aspx.cs" Inherits="softwareDetail" %>
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
    <meta name="keywords" content="your tags" />
    <meta name="description" content="西南财经大学党委宣传部领导下的校园学生门户网站光华园网站的子网软件园，西财师生下载正版软件、浏览互联网资讯、分享软件、学习电脑技能技巧等的平台" />
    <meta name="copyright" content="Copyright © www.ghy.cn 2001-2017 All Rights Reserved." />
    <meta name="robots" content="all" />
    <title>软件园·软件·<%=SoftwareName %>&<%=SoftwareEdition %></title>
    <link rel="icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="shortcut icon" href="./img/favicon.ico" type="img/x-icon" />
    <link rel="stylesheet" href="./css/normalize.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="./css/global.css?v=20170919" />
    <link rel="stylesheet" href="./css/softwareDetail.css?v=20170919" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <SoftwarePark:Header ID="iHeader" runat="server" />
        <section class="softwarepark-breadcrumb">
            <div class="container">
                <div class="row">
                    <ol class="breadcrumb">
                        <li><span>你的位置:</span></li>
                        <li><a href="index.aspx">首页</a></li>
                        <li><a href="softwareList.aspx">软件</a></li>
                        <li class="active">
                            <a href="softwareDetail.aspx?id=<%=ArticleID %>"><%=SoftwareName %>&<%=SoftwareEdition %></a>
                        </li>
                        <span class="breadcrumb-end"></span>
                    </ol>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="row">
                <div class="col-sm-7">
                    <div class="panel panel-default panel-info-brief">
                        <div class="panel-body">
                            <div class="panel-software-icon">
                                <img src="<%=SoftwareIcon %>" alt="<%=SoftwareName %>&<%=SoftwareEdition %>" />
                            </div>
                            <h3><%=SoftwareName %>&<%=SoftwareEdition %></h3>
                            <asp:LinkButton ID="SoftwareDownloadLinkBtn" runat="server" CssClass="btn btn-primary" OnClick="SoftwareDownloadLinkBtn_Click"><i class="glyphicon glyphicon-download-alt"></i> 正版下载</asp:LinkButton><a href="<%=SoftwareOfficialWebsite %>"
                                target="_blank" class="btn btn-primary"><i class="glyphicon glyphicon-link"></i> 官网链接</a>
                        </div>
                        <div class="panel-footer" id="tagsContainer">
                            <div class="panel-subtitle">
                                <div class="vertical-separator"></div>
                                <h4>标签</h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="panel panel-default panel-info-detail">
                        <div class="panel-heading">
                            <div class="panel-subtitle">
                                <div class="vertical-separator"></div>
                                <h4>详细信息</h4>
                            </div>
                        </div>
                        <div class="panel-body">
                            <p>软件语言：<%=SoftwareLanguage %></p>
                            <p>运行环境：<%=SoftwareRunningEnvironment %></p>
                            <p>授权方式：<%=SoftwareAuthorizationWay %></p>
                            <p>软件大小：<%=SoftwareSize %></p>
                            <p>整理时间：<%=ArticleUploadTime %></p>
                            <p>下载次数：<%=SoftwareDownloadNum %></p>
                            <p style="color:#469ab5;">若有更多需要请联系我们~</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel-software-screenshots">
                <div class="panel-heading">
                    <div class="panel-subtitle">
                        <div class="vertical-separator"></div>
                        <h4>软件截图</h4>
                    </div>
                </div>
                <div class="panel-body">
                    <div id="banner-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner" id="bannerCarouselInner">

                        </div>
                        <a class="left carousel-control" href="#banner-carousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#banner-carousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel-software-content">
                <div class="panel-heading">
                    <div class="panel-subtitle">
                        <div class="vertical-separator"></div>
                        <h4>软件介绍</h4>
                    </div>
                </div>
                <div class="panel-body">
                    <%=ArticleContent %>
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
    <script type="text/javascript">
        $(document).ready(function () {
            function appendImg(parentElement, imgSrc) {
                var imgSrcArray = imgSrc.split(",");
                for (var i = 0; i < imgSrcArray.length; i++) {
                    if (imgSrcArray[i] != "") {
                        if (i == 0) {
                            var $img = $(
                                '<div class="item active"><img class="img-responsive" src= "' + imgSrcArray[
                                    i] + '" alt= "" /></div>'
                            );
                        } else {
                            var $img = $(
                                '<div class="item"><img class="img-responsive" src= "' + imgSrcArray[i] +
                                '" alt= "" /></div>'
                            );
                        }

                        $(parentElement).append($img);
                    }
                }
            }
            function appendTag(parentElement, tagsID, tagsName) {
                var tagsNameArray = tagsName.split(",");
                var tagsIDArray = tagsID.split(",");
                var $tagContainer = $(parentElement);
                for (var i = 0; i < tagsNameArray.length; i++) {
                    if (tagsNameArray[i] != "") {
                        var $tag = $(
                            '<a href="searchResult.aspx?searchcontent=' + tagsIDArray[i] + '&searchclass=1" class="badge panel-software-tag">' +
                            tagsNameArray[i] + '</a>'
                        ).appendTo($tagContainer);
                    }
                }
            }

            function init() {
                var ScreenShotsImageSrc;
                if ("<%=SoftwareScreenShots%>" != "None") {
                    ScreenShotsImageSrc = "<%=SoftwareScreenShots%>";
                    appendImg(bannerCarouselInner, ScreenShotsImageSrc);
                }
                if ("<%=TagsID%>" != "None" && "<%=TagsName%>" != "None") {
                    var tagsID = "<%=TagsID%>";
                    var tagsName = "<%=TagsName%>";
                    appendTag(tagsContainer, tagsID, tagsName);
                }
            }
            init();
        });
    </script>
</body>

</html>
