<%@ Page Language="C#" AutoEventWireup="true" CodeFile="articleEdit.aspx.cs" Inherits="admin_pages_articleEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Software Park Admin v1.0</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/css/normalize.css" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/articleEdit.css" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <div class="container">
            <h2>撰写新文章</h2>
            <div class="row">
                <div class="col-sm-8">
                    <div class="form-group">
                        <label for="ArticleTitleTextBox" class="sr-only">在此输入标题</label>
                        <asp:TextBox ID="ArticleTitleTextBox" CssClass="form-control" runat="server" placeholder="在此输入标题"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ArticleContentTextBox" class="sr-only">在此输入内容</label>
                        <asp:TextBox ID="ArticleContentTextBox" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ArticleLinkTextBox" class="sr-only">在此输入软件编号或链接</label>
                        <asp:TextBox ID="ArticleLinkTextBox" CssClass="form-control" runat="server" placeholder="在此输入软件编号或链接"></asp:TextBox>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">发布</div>
                        <div class="panel-body">
                            <a class="btn btn-default" id="ArticlePrevBtn">预览文章</a>
                            <asp:Button ID="ArticleSubmitBtn" CssClass="btn btn-default pull-right" runat="server" Text="发布" OnClick="ArticleSubmitBtn_Click"
                            />
                            <p style="margin-top:15px;">
                                <i class="glyphicon glyphicon-wrench"></i> 状态：
                                <asp:RadioButtonList ID="ArticleStateRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Selected="True" Value="0">未审核</asp:ListItem>
                                    <asp:ListItem Value="1">发布</asp:ListItem>
                                </asp:RadioButtonList>
                            </p>
                            <p>
                                <i class="glyphicon glyphicon-pencil"></i> 形式：
                                <asp:RadioButtonList ID="ArticleClassRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Selected="True" Value="0">文章</asp:ListItem>
                                    <asp:ListItem Value="1">软件</asp:ListItem>
                                    <asp:ListItem Value="2">专题</asp:ListItem>
                                </asp:RadioButtonList>
                            </p>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">标签</div>
                        <div class="panel-body">
                            <label for="ArticleTags" class="sr-only">在此输入标签</label>
                            <asp:TextBox ID="ArticleTagsTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                            <p class="help-block">多个标签请用英文逗号（,）分开</p>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">分类目录</div>
                        <div class="panel-body">
                            <asp:CheckBoxList ID="ClassCheckBoxList" runat="server"></asp:CheckBoxList>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">Banner</div>
                        <div class="panel-body">
                            <asp:Image ID="ShowBanner" runat="server" class="img-thumbnail" style="width:100%" />
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ImageModal">添加Banner</button>
                        </div>
                    </div>
                    <div id="ImageModal" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">特色图片</h4>
                                </div>
                                <div class="modal-body">
                                    <ul class="nav nav-pills">
                                        <li class="active"><a data-toggle="pill" href="#UploadImage">上传文件</a></li>
                                        <li><a data-toggle="pill" href="#ImageGallary">媒体库</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="UploadImage" class="tab-pane fade in active text-center">
                                            <iframe src="imageUpload.aspx?path=banner" frameborder="0" style="width:100%;height:320px;"></iframe>
                                        </div>
                                        <div id="ImageGallary" class="tab-pane fade">
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
                                                <ContentTemplate>
                                                    <asp:Button ID="RefreshImageGalleryBtn" CssClass="btn btn-info btn-block" style="margin:10px 0;" runat="server" OnClick="RefreshImageGalleryBtn_Click"
                                                        Text="刷新" />
                                                    <input type="hidden" id="hidden1" runat="server" />
                                                    <asp:Repeater ID="ImageGallaryRepeater" runat="server">
                                                        <ItemTemplate>
                                                            <img src="<%# URLConvertor(DataBinder.Eval(Container.DataItem," fullName ").ToString()) %>" class="img-thumbnail" style="width:163.5px;height:163.5px"
                                                            />
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="SetAsBannerBtn" class="btn btn-primary" runat="server" Text="设为Banner" OnClick="SetAsBannerBtn_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/ueditor/ueditor.all.js"></script>
    <script type="text/javascript">
        var ue = UE.getEditor('ArticleContentTextBox');
        $(document).ready(function () {
            var ShowBannerSrc;
            $("#ImageGallary img").click(function () {
                ShowBannerSrc = $(this)[0].src;
                $("#ImageGallary img").removeClass("selected");
                $(this).addClass("selected");
                $("#hidden1").val(ShowBannerSrc);
                $("#hidden1").submit();
            });
        });
    </script>
</body>

</html>