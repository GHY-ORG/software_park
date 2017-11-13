<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="articleDetail.aspx.cs" Inherits="pages_articleDetail" Title="软件园·文章" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Statics/css/articleDetail.min.css?v=20171102" />
</asp:Content>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <!--位置-->
    <section class="softwarepark-breadcrumb">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li><span>你的位置:</span></li>
                    <li><a href="/pages/articleList.aspx">文章</a></li>
                    <li class="active">
                        <a href="/pages/articleDetail?id=<%=ArticleID %>.aspx"><%=ArticleTitle %></a>
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
</asp:Content>