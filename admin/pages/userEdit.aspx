<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="userEdit.aspx.cs" Inherits="UserEdit" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../css/userEdit.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="form-register">
        <h2 class="form-register-heading">修改个人信息</h2>
        <label for="Password" class="sr-only">旧密码</label>
        <asp:TextBox type="password" id="OldPassword" class="form-control" placeholder="旧密码" required="" runat="server"></asp:TextBox>
        <label for="Password" class="sr-only">新密码</label>
        <asp:TextBox type="password" id="NewPassword" class="form-control" placeholder="新密码" required="" runat="server"></asp:TextBox>
        <label for="rePassword" class="sr-only">确认密码</label>
        <asp:TextBox type="password" id="rePassword" class="form-control" placeholder="确认密码" required="" runat="server"></asp:TextBox>
        <p>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="确认密码不符！" ControlToCompare="NewPassword" ControlToValidate="rePassword"></asp:CompareValidator>
        </p>
        <asp:Button class="btn btn-lg btn-primary btn-block" type="submit" ID="UserEditBtn" runat="server" Text="修改" OnClick="UserEditBtn_Click"
        />
    </div>
</asp:Content>