<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="categoryList.aspx.cs" Inherits="admin_pages_categoryList" %>
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
                            <a class="btn btn-link btn-xs" href="categoryEdit.aspx?id=<%# DataBinder.Eval(Container.DataItem," ID ") %>">编辑</a>/
                            <asp:LinkButton CssClass="btn btn-link btn-xs" ID="DeleteLinkBtn" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                OnLoad="Delete_LoadBtn" OnClick="DeleteLinkBtn_Click" runat="server">删除</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                </FooterTemplate>
            </asp:Repeater>
        </table>
    </div>
    <SoftwarePark:Pager ID="Pager" runat="server" DatabaseTable="Class" PageSize="20" SQLCondition="" SQLOrder="ORDER BY ID" OnPageIndexChanged="Pager_OnPageIndexChanged" />
</asp:Content>