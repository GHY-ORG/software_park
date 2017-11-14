<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="categoryEdit.aspx.cs" Inherits="admin_pages_categoryEdit" %>
<%@ Register Src="~/Controls/pager.ascx" TagPrefix="SoftwarePark" TagName="Pager" %>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <h2>添加新分类目录</h2>
    <div class="form-inline">
        <div class="col-md-8">
            <label class="sr-only" for="CommendItemTextBox">请输入分类目录名称</label>
            <asp:TextBox ID="ClassNameTextBox" Width="100%" runat="server" placeholder="请输入分类目录名称" CssClass="form-control"></asp:TextBox>
        </div>
        <asp:Button ID="ClassSubmitBtn" CssClass="btn btn-default" runat="server" Text="发布" OnClick="ClassSubmitBtn_Click" />
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
    <SoftwarePark:Pager ID="Pager" runat="server" DatabaseTable="Article" PageSize="20" SQLCondition="" SQLOrder="ORDER BY StickState DESC, UploadTime DESC" />
</asp:Content>