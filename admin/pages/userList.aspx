<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userList.aspx.cs" Inherits="admin_pages_userList" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Software Park Admin v1.0</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/css/normalize.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <div class="container">
            <div class="row" style="padding:15px">
                <div class="input-group custom-search-form col-xs-4 col-xs-offset-8">
                    <asp:TextBox ID="SearchTextBox" runat="server" CssClass="form-control" placeholder="Search..."></asp:TextBox>
                    <span class="input-group-btn">
                    <asp:LinkButton CssClass="btn btn-default btn-md" ID="SearchBtn" runat="server" OnClick="SearchBtn_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton>
                    </span>
                </div>
            </div>
            <div class="table-responsive">
                <asp:DataList ID="DataList1" runat="server" CssClass="table table-striped table-hover" OnItemCommand="DataList1_ItemCommand"
                    OnDeleteCommand="DataList1_DeleteCommand">
                    <HeaderTemplate>
                        <th>用户名</th>
                        <th>姓名</th>
                        <th>角色</th>
                        <th>注册时间</th>
                        <th>操作</th>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"UserName") %>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"RealName") %>
                        </td>
                        <td>
                            <%# (int) DataBinder.Eval(Container.DataItem,"Role") == 1?"管理员":"编辑"%>
                        </td>
                        <td>
                            <%# DataBinder.Eval(Container.DataItem,"RegisterTime") %>
                        </td>
                        <td>
                            <a class="btn btn-link btn-xs" href="userEdit.aspx?userid=<%# DataBinder.Eval(Container.DataItem," ID ") %>">修改密码</a>/
                            <asp:Button ID="DeleteBtn" CssClass="btn btn-link btn-xs" runat="server" CommandName="delete" Text="删除" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                OnLoad="Delete_LoadBtn" />/
                            <asp:Button ID="SetRoleBtn" CssClass="btn btn-link btn-xs" runat="server" CommandName="setRole" Text='<%# (int) DataBinder.Eval(Container.DataItem,"Role")==1?"取消管理员权限":"设为管理员权限" %>'
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                        </td>
                    </ItemTemplate>
                </asp:DataList>
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
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>

</html>