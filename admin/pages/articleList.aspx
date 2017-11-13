<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="articleList.aspx.cs" Inherits="admin_pages_articleList" %>
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
        <asp:DataList ID="DataList1" runat="server" class="table table-striped table-hover" OnItemDataBound="DataList1_ItemDataBound"
            OnItemCommand="DataList1_ItemCommand" OnDeleteCommand="DataList1_DeleteCommand">
            <HeaderTemplate>
                <th>标题</th>
                <th>作者</th>
                <th>形式</th>
                <th>标签</th>
                <th>浏览次数</th>
                <th>状态</th>
                <th>日期</th>
                <th>操作</th>
            </HeaderTemplate>
            <ItemTemplate>
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
                <td>
                    <a class="btn btn-link btn-xs" href="articleEdit.aspx?articleid=<%# DataBinder.Eval(Container.DataItem," ID ") %>">编辑</a>/
                    <asp:Button ID="btnDelete" CssClass="btn btn-link btn-xs" runat="server" CommandName="delete" Text="删除" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                        OnLoad="Delete_LoadBtn" />/
                    <asp:Button ID="btnSetStickState" CssClass="btn btn-link btn-xs" runat="server" CommandName="setStickState" Text='<%# (int) DataBinder.Eval(Container.DataItem,"StickState")==1?"取消置顶":"置顶" %>'
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
</asp:Content>