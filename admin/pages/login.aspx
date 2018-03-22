﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Software Park Admin v1.0</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/Statics/css/normalize.css" />
    <link rel="stylesheet" href="/Statics/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/login.css" />
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-login">
                <h2 class="form-login-heading">登陆</h2>
                <label for="UserName" class="sr-only">用户名</label>
                <asp:TextBox id="UserName" CssClass="form-control" placeholder="用户名" required="" autofocus="" runat="server"></asp:TextBox>
                <label for="Password" class="sr-only">密码</label>
                <asp:TextBox id="Password" CssClass="form-control" placeholder="密码" required="" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Button ID="LoginBtn" CssClass="btn btn-lg btn-primary btn-block" runat="server" Text="登陆" OnClick="LoginBtn_Click" />
            </div>
        </div>
    </form>
    <script src="/Statics/js/jquery-3.2.1.min.js"></script>
    <script src="/Statics/js/bootstrap.min.js"></script>
</body>

</html>