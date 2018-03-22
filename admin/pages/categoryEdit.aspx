﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="categoryEdit.aspx.cs" Inherits="admin_pages_categoryEdit" %>

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
            <h2>添加新分类目录</h2>
            <div class="form-inline">
                <div class="col-md-8">
                    <label class="sr-only" for="CommendItemTextBox">请输入分类目录名称</label>
                    <asp:TextBox ID="ClassNameTextBox" Width="100%" runat="server" placeholder="请输入分类目录名称" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="ClassSubmitBtn" CssClass="btn btn-default" runat="server" Text="发布" OnClick="ClassSubmitBtn_Click"/>
            </div>
            
            <div class="table-responsive">
                <table class="table table-hover table-striped">
                    <asp:Repeater ID="ArticleRepeater" runat="server" OnItemDataBound="ArticleRepeater_ItemDataBound">
                        <HeaderTemplate>
                            <thead>
                                <tr>
                                    <th>标题</th>
                                    <th>作者</th>
                                    <th>形式</th>
                                    <th>标签</th>
                                    <th>浏览次数</th>
                                    <th>状态</th>
                                    <th>日期</th>
                                </tr>
                            </thead>
                            <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# DataBinder.Eval(Container.DataItem,"Title") %>
                                </td>
                                <td>
                                    <%# DataBinder.Eval(Container.DataItem,"Author") %>
                                </td>
                                <td>
                                    <%# ReturnClass((int) DataBinder.Eval(Container.DataItem,"Class")) %>
                                </td>
                                <td>
                                    <asp:Repeater ID="TagsRepeater" runat="server">
                                        <ItemTemplate>
                                            <%# DataBinder.Eval(Container.DataItem,"TagName") %>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                                <td>
                                    <%# DataBinder.Eval(Container.DataItem,"BrowseTimes") %>
                                </td>
                                <td>
                                    <%# ReturnState((int) DataBinder.Eval(Container.DataItem,"State")) %>
                                </td>
                                <td>
                                    <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem,"UploadTime")).ToString("yyyy-MM-dd") %>
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
