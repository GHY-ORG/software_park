<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Software Park Admin v1.0</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/css/normalize.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/register.css" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <div class="container">
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
        </div>
    </form>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</body>

</html>