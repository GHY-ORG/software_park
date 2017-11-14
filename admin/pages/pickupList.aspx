<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="pickupList.aspx.cs" Inherits="admin_pages_pickupList" %>
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
                <th>推荐软件</th>
                <th>推荐内容</th>
                <th>联系方式</th>
                <th>上传时间</th>
                <th>IP地址</th>
                <th>点赞数</th>
                <th>操作</th>
            </HeaderTemplate>
            <ItemTemplate>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"CommendItem") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"CommendContent") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"ContactInfo") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"UploadTime") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"IPAddress") %>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem,"UpvoteNum") %>
                </td>
                <td>
                    <a class="btn btn-link btn-xs" href="pickupEdit.aspx?commenditemid=<%# DataBinder.Eval(Container.DataItem," ID ") %>">编辑</a>/
                    <asp:Button ID="btnDelete" CssClass="btn btn-link btn-xs" runat="server" CommandName="delete" Text="删除" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                        OnLoad="Delete_LoadBtn" />
                </td>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <SoftwarePark:Pager ID="Pager" runat="server" DatabaseTable="Pickup" PageSize="20" SQLCondition="" SQLOrder="ORDER BY ID" />
</asp:Content>