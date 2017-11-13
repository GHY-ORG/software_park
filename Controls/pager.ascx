<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pager.ascx.cs" Inherits="Controls_pager" %>
<div class="text-center">
    <ul class="pagination" id="pagination">
        <li>
            <asp:LinkButton ID="PrevPageLinkButton" CommandName="prev" OnCommand="Page_OnClick" runat="server">
                <i class="glyphicon glyphicon-menu-left"></i>
            </asp:LinkButton>
        </li>
        <asp:Repeater ID="PageNumRepeater" runat="server">
            <ItemTemplate>
                <li>
                    <asp:LinkButton ID="PageNumLinkButton" OnCommand="Page_OnClick" CommandArgument="<%# Container.DataItem %>" CommandName="page" runat="server">
                        <%# Container.DataItem %>
                    </asp:LinkButton>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        <li>
            <asp:LinkButton ID="NextPageLinkButton" CommandName="next" OnCommand="Page_OnClick" runat="server">
                <i class="glyphicon glyphicon-menu-right"></i>
            </asp:LinkButton>
        </li>
    </ul>
</div>