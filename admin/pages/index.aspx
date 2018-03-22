﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Admin_pages_index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Software Park Admin v1.0</title>
    <link href="../css/index.css" rel="stylesheet" />

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                    <a class="navbar-brand" href="index.aspx">Software Park Admin v1.0</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <asp:LinkButton ID="SignOutBtn" runat="server" OnClick="SignOutBtn_Click"><i class="fa fa-sign-out fa-fw"></i> 登出</asp:LinkButton>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="disabled">
                                <a href="#"<%-- target="iframe"--%>><i class="fa fa-dashboard fa-fw"></i> 仪表盘</a>
                            </li>
                            <li>
                                <a href="#" target="iframe"><i class="fa fa-camera fa-fw"></i> Banner<span class="fa arrow"></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="bannerList.aspx" target="iframe">所有</a>
                                    </li>
                                    <li>
                                        <a href="bannerEdit.aspx" target="iframe">添加</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-files-o fa-fw"></i> 文章<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="articleList.aspx" target="iframe">所有</a>
                                    </li>
                                    <li>
                                        <a href="articleEdit.aspx" target="iframe">添加</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa arrow"></i> 分类目录</a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="categoryList.aspx" target="iframe">所有</a>
                                            </li>
                                            <li>
                                                <a href="categoryEdit.aspx" target="iframe">添加</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="disabled">
                                        <a href="#"<%-- target="iframe"--%>>标签</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-gamepad fa-fw"></i> 多媒体<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="softwareList.aspx" target="iframe">软件库</a>
                                    </li>
                                    <li>
                                        <a href="softwareEdit.aspx" target="iframe">添加</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-edit fa-fw"></i>P!CKUP<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="pickupList.aspx" target="iframe">所有</a>
                                    </li>
                                    <li>
                                        <a href="pickupEdit.aspx" target="iframe">添加</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"> <i class="glyphicon glyphicon-user"></i>&nbsp&nbsp用户 <span class="fa arrow"> </span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="userList.aspx" target="iframe">所有</a>
                                    </li>
                                    <li>
                                        <a href="register.aspx" target="iframe">添加</a>
                                    </li>
                                    <li>
                                        <a href="userEdit.aspx" target="iframe">我的个人资料</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <iframe src="" frameborder="0" name="iframe">
                    </iframe>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->
    </form>
    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</body>

</html>