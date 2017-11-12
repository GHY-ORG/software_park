<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="softwareDetail.aspx.cs" Inherits="pages_softwareDetail" Title="软件园·软件" %>

    <asp:Content ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/Statics/css/softwareDetail.min.css?v=20171102" />
    </asp:Content>

    <asp:Content ContentPlaceHolderID="body" runat="server">
        <section class="softwarepark-breadcrumb">
            <div class="container">
                <div class="row">
                    <ol class="breadcrumb">
                        <li>
                            <span>你的位置:</span>
                        </li>
                        <li>
                            <a href="/pages/softwareList.aspx">软件</a>
                        </li>
                        <li class="active">
                            <a href="/pages/softwareDetail.aspx?id=<%=ArticleID %>">
                                <%=SoftwareName %>&<%=SoftwareEdition %>
                            </a>
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
                            <h3>
                                <%=SoftwareName %>&<%=SoftwareEdition %>
                            </h3>
                            <asp:LinkButton ID="SoftwareDownloadLinkBtn" runat="server" CssClass="btn btn-primary" OnClick="SoftwareDownloadLinkBtn_Click">
                                <i class="glyphicon glyphicon-download-alt"></i> 正版下载</asp:LinkButton>
                            <a href="<%=SoftwareOfficialWebsite %>" target="_blank" class="btn btn-primary">
                                <i class="glyphicon glyphicon-link"></i> 官网链接</a>
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
                            <p>软件语言：
                                <%=SoftwareLanguage %>
                            </p>
                            <p>运行环境：
                                <%=SoftwareRunningEnvironment %>
                            </p>
                            <p>授权方式：
                                <%=SoftwareAuthorizationWay %>
                            </p>
                            <p>软件大小：
                                <%=SoftwareSize %>
                            </p>
                            <p>整理时间：
                                <%=ArticleUploadTime %>
                            </p>
                            <p>下载次数：
                                <%=SoftwareDownloadNum %>
                            </p>
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
    </asp:Content>
    <asp:Content ContentPlaceHolderID="js" runat="server">
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
                                '<a href="/pages/searchResult.aspx?searchcontent=' + tagsIDArray[i] + '&searchclass=1" class="badge panel-software-tag">' +
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
    </asp:Content>