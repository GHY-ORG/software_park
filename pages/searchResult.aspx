<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="searchResult.aspx.cs" Inherits="pages_searchResult" Title="软件园·搜索结果" %>

    <asp:Content ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="/css/index.css?v=20170919" />
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
                            <a href="#">搜索结果</a>
                        </li>
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
            <div class="text-center">
                <button type="button" class="btn btn-info" id="btn-more">更 多</button>
            </div>
        </div>
    </asp:Content>

    <asp:Content ContentPlaceHolderID="js" runat="server">
        <script src="/js/searchResult.js?v=20170919"></script>
    </asp:Content>