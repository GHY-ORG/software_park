<%@ Control Language="C#" AutoEventWireup="true" %>
    <!--导航栏-->
    <nav class="navbar navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/index.aspx"><img src="/img/logo-top.png" alt=""></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="/index.aspx">首 页</a></li>
                    <li><a href="/pages/softwareList.aspx">软 件</a></li>
                    <li><a href="/pages/articleList.aspx">文 章</a></li>
                    <li><a href="/pages/pickupList.aspx">P!CKUP</a></li>
                </ul>
                <div class="navbar-form">
                    <div class="input-group">
                        <div class="input-group-btn">
                            <a id="search-btn" class="btn"><i class="glyphicon glyphicon-search"></i></a>
                        </div>
                        <input id="search-input" type="text" class="form-control" placeholder="搜索..." name="search">
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <div style="margin-bottom:65px"></div>
