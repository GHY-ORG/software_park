<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="bannerList.aspx.cs" Inherits="admin_pages_bannerList" %>
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
                <th>描述</th>
                <th>链接</th>
                <th>状态</th>
                <th>操作</th>
            </HeaderTemplate>
            <ItemTemplate>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"Description") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"Link") %>
                </td>
                <td>
                    <%#(int) DataBinder.Eval(Container.DataItem,"State")==0?"未审核":"发布" %>
                </td>
                <td>
                    <a class="btn btn-link btn-xs" href="bannerEdit.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>">编辑</a>/
                    <asp:Button ID="btnDelete" CssClass="btn btn-link btn-xs" runat="server" CommandName="delete" Text="删除" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                        OnLoad="Delete_LoadBtn" />
                </td>
            </ItemTemplate>
        </asp:DataList>
    </div>
     <SoftwarePark:Pager ID="Pager" runat="server" DatabaseTable="Banner" PageSize="20" SQLCondition="" SQLOrder="ORDER BY ID" />
</asp:Content>