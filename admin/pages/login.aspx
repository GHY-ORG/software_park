<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../css/login.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="form-login">
        <h2 class="form-login-heading">登陆</h2>
        <label for="UserName" class="sr-only">用户名</label>
        <asp:TextBox id="UserName" CssClass="form-control" placeholder="用户名" required="" autofocus="" runat="server"></asp:TextBox>
        <label for="Password" class="sr-only">密码</label>
        <asp:TextBox id="Password" CssClass="form-control" placeholder="密码" required="" runat="server" TextMode="Password"></asp:TextBox>
        <asp:Button ID="LoginBtn" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="登陆" OnClick="LoginBtn_Click" />
    </div>
</asp:Content>