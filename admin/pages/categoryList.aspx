﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="categoryList.aspx.cs" Inherits="admin_pages_categoryList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Software Park Admin v1.0</title>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="/Statics/css/normalize.css" />
        <link rel="stylesheet" href="/Statics/css/bootstrap.min.css" />
</head>
<body>
    <form id="BaseForm" runat="server">
        <div class="container">
            <div class="row" style="padding:15px">
                <div class="input-group custom-search-form col-xs-4 col-xs-offset-8">
                    <asp:TextBox ID="SearchTextBox" runat="server" type="text" class="form-control" placeholder="Search..."></asp:TextBox>
                    <span class="input-group-btn">
                    <asp:LinkButton class="btn btn-default btn-md" ID="SearchBtn" runat="server" OnClick="SearchBtn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover table-striped">
                    <asp:Repeater ID="ClassRepeater" runat="server">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>总数</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# DataBinder.Eval(Container.DataItem,"ClassName ") %>
                                </td>
                                <td>
                                    <%#  GetArticleNum(DataBinder.Eval(Container.DataItem, "ID ").ToString()) %>
                                </td>
                                <td>
                                    <a class="btn btn-link btn-xs" href="categoryEdit.aspx?id=<%# DataBinder.Eval(Container.DataItem,"ID ") %>">编辑</a>/<asp:LinkButton CssClass="btn btn-link btn-xs" ID="DeleteLinkBtn" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' OnLoad="Delete_LoadBtn" OnClick="DeleteLinkBtn_Click" runat="server">删除</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                        </FooterTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <ul class="pager">
                <li>
                    <asp:LinkButton ID="LinkBtnPrevPage" Text="上一页" CommandName="prev" OnCommand="Page_OnClick" runat="server" />
                </li>
                <li>
                    <asp:LinkButton ID="LinkBtnNextPage" Text="下一页" CommandName="next" OnCommand="Page_OnClick" runat="server" />
                </li>
                共有
                <asp:Label ID="LableRecordCount" runat="server" />条记录 当前为
                <asp:Label ID="LableCurrentPage" runat="server" />/
                <asp:Label ID="LablePageCount" runat="server" />页
            </ul>
        </div>
    </form>
    <script src="/Statics/js/jquery-3.2.1.min.js"></script>
    <script src="/Statics/js/bootstrap.min.js"></script>
</body>
</html>
