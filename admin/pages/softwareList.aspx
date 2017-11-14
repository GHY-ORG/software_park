﻿<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="softwareList.aspx.cs" Inherits="admin_pages_softwareList" %>
<%@ Register Src="~/Controls/pager.ascx" TagPrefix="SoftwarePark" TagName="Pager" %>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="row" style="padding:15px">
        <div class="input-group custom-search-form col-xs-4 col-xs-offset-8">
            <asp:TextBox ID="SearchTextBox" runat="server" type="text" class="form-control" placeholder="Search..."></asp:TextBox>
            <span class="input-group-btn">
                <asp:LinkButton class="btn btn-default btn-md" ID="SearchBtn" runat="server" OnClick="SearchBtn_Click">
                    <span class="glyphicon glyphicon-search"></span>
                </asp:LinkButton>
            </span>
        </div>
    </div>
    <div class="table-responsive">
        <asp:DataList ID="DataList1" runat="server" class="table table-striped table-hover" OnDeleteCommand="DataList1_DeleteCommand">
            <HeaderTemplate>
                <th>序号</th>
                <th>名称</th>
                <th>版本</th>
                <th>运行环境</th>
                <th>授权方式</th>
                <th>分类</th>
                <th>状态</th>
                <th>下载次数</th>
                <th>操作</th>
            </HeaderTemplate>
            <ItemTemplate>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"ID") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"Name") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"Edition") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"RunningEnvironment") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"AuthorizationWay") %>
                </td>
                <td></td>
                <td>
                    <%# ReturnState((int) DataBinder.Eval(Container.DataItem,"State")) %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"DownloadNum") %>
                </td>
                <td>
                    <a class="btn btn-link btn-xs" href="softwareEdit.aspx?softwareid=<%# DataBinder.Eval(Container.DataItem," ID ") %>">编辑</a>/
                    <asp:Button ID="btnDelete" CssClass="btn btn-link btn-xs" runat="server" CommandName="delete" Text="删除" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                        OnLoad="Delete_LoadBtn" />
                </td>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <SoftwarePark:Pager ID="Pager" runat="server" DatabaseTable="Software" PageSize="20" SQLCondition="" SQLOrder="ORDER BY ID" />
</asp:Content>