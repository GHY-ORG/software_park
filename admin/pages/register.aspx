<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Register" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../css/register.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="form-register">
        <h2 class="form-register-heading">注册</h2>
        <label for="UserName" class="sr-only">用户名</label>
        <asp:TextBox type="text" ID="UserName" class="form-control" placeholder="用户名" required="" autofocus="" runat="server"></asp:TextBox>
        <label for="RealName" class="sr-only">真实姓名</label>
        <asp:TextBox type="text" id="RealName" class="form-control" placeholder="真实姓名" required="" runat="server"></asp:TextBox>
        <label for="Password" class="sr-only">密码</label>
        <asp:TextBox type="password" id="Password" class="form-control" placeholder="密码" required="" runat="server"></asp:TextBox>
        <label for="rePassword" class="sr-only">确认密码</label>
        <asp:TextBox type="password" id="rePassword" class="form-control" placeholder="确认密码" required="" runat="server"></asp:TextBox>
        <p>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="确认密码不符！" ControlToCompare="Password" ControlToValidate="rePassword"></asp:CompareValidator>
        </p>
        <asp:Button class="btn btn-lg btn-primary btn-block" type="submit" ID="RegisterBtn" runat="server" Text="注册" OnClick="RegisterBtn_Click"
        />
    </div>
</asp:Content>