<%@ Page Language="C#" AutoEventWireup="true" CodeFile="softwareEdit.aspx.cs" Inherits="admin_pages_softwareEdit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Software Park Admin v1.0</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../../css/normalize.css" />
    <link rel="stylesheet" href="../../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/softwareEdit.css" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="SoftwareNameTextBox" class="control-label col-md-2">软件名称：</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="SoftwareNameTextBox" CssClass="form-control" runat="server" required=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="SoftwareEditionTextBox" class="control-label col-md-2">软件版本：</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="SoftwareEditionTextBox" CssClass="form-control" runat="server" required=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="SoftwareOfficialWebsiteTextBox" class="control-label col-md-2">官网链接：</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="SoftwareOfficialWebsiteTextBox" CssClass="form-control" runat="server" required=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="SoftwareDownloadWebsiteTextBox" class="control-label col-md-2">下载链接：</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="SoftwareDownloadWebsiteTextBox" CssClass="form-control" runat="server" required=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="SoftwareLanguageDropDownList" class="control-label col-md-2">软件语言：</label>
                            <div class="col-md-10">
                                <asp:DropDownList ID="SoftwareLanguageDropDownList" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">简体中文</asp:ListItem>
                                    <asp:ListItem Value="1">繁体中文</asp:ListItem>
                                    <asp:ListItem Value="2">英文</asp:ListItem>
                                    <asp:ListItem Value="3">其它</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="SoftwareRunningEnvironmentTextBox" class="control-label col-md-2">运行环境：</label>
                            <div class="col-md-10">
                                <asp:CheckBoxList ID="SoftwareRunningEnvironmentCheckBoxList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="Win XP">Win XP</asp:ListItem>
                                    <asp:ListItem Value="Win 7">Win 7</asp:ListItem>
                                    <asp:ListItem>Win 8</asp:ListItem>
                                    <asp:ListItem>Win 10</asp:ListItem>
                                    <asp:ListItem>MacOS</asp:ListItem>
                                    <asp:ListItem>UNIX</asp:ListItem>
                                    <asp:ListItem>LINUX</asp:ListItem>
                                    <asp:ListItem>Android</asp:ListItem>
                                    <asp:ListItem>IOS</asp:ListItem>
                                    <asp:ListItem>其他</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="SoftwareAuthorizationWayDropDownList" class="control-label col-md-2">授权方式：</label>
                            <div class="col-md-10">
                                <asp:DropDownList ID="SoftwareAuthorizationWayDropDownList" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0">正版软件</asp:ListItem>
                                    <asp:ListItem Value="1">免费软件</asp:ListItem>
                                    <asp:ListItem Value="2">授权软件</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="SoftwareSizeTextBox" class="control-label col-md-2">软件大小：</label>
                            <div class="col-md-10">
                                <asp:TextBox ID="SoftwareSizeTextBox" CssClass="form-control" runat="server" required=""></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">发布</div>
                        <div class="panel-body">
                            <div class="form-inline">
                                <asp:Button ID="SoftwareSubmitBtn" CssClass="btn btn-default pull-right" runat="server" Text="发布" OnClick="SoftwareSubmitBtn_Click"
                                />
                                <div class="form-group">
                                    <i class="glyphicon glyphicon-wrench"></i> 状态：
                                    <asp:RadioButtonList ID="SoftwareStateRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Selected="True" Value="0">未审核</asp:ListItem>
                                        <asp:ListItem Value="1">发布</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">图标</div>
                        <div class="panel-body">
                            <div id="IconImageShow">

                            </div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#IconImageModal">添加图标</button>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">游戏截图</div>
                        <div class="panel-body">
                            <div id="ScreenShotsImageShow">

                            </div>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ScreenShotsImageModal">添加游戏截图</button>
                        </div>
                    </div>
                    <div id="IconImageModal" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">特色图片</h4>
                                </div>
                                <div class="modal-body">
                                    <ul class="nav nav-pills">
                                        <li class="active"><a data-toggle="pill" href="#UploadIconImage">上传文件</a></li>
                                        <li><a data-toggle="pill" href="#IconImageGallary">媒体库</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="UploadIconImage" class="tab-pane fade in active text-center">
                                            <iframe src="imageUpload.aspx?path=icon" frameborder="0" style="width:100%;height:320px;"></iframe>
                                        </div>
                                        <div id="IconImageGallary" class="tab-pane fade">
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
                                                <ContentTemplate>
                                                    <asp:Button ID="RefreshIconImageGalleryBtn" CssClass="btn btn-info btn-block" style="margin:10px 0;" runat="server" OnClick="RefreshIconImageGalleryBtn_Click"
                                                        Text="刷新" />
                                                    <input type="hidden" id="hidden1" runat="server" />
                                                    <asp:Repeater ID="IconImageGallaryRepeater" runat="server">
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
                                    <button type="button" id="SetAsIconBtn" class="btn btn-primary">设为图标</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="ScreenShotsImageModal" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">特色图片</h4>
                                </div>
                                <div class="modal-body">
                                    <ul class="nav nav-pills">
                                        <li class="active"><a data-toggle="pill" href="#UploadScreenShotsImage">上传文件</a></li>
                                        <li><a data-toggle="pill" href="#ScreenShotsImageGallary">媒体库</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="UploadScreenShotsImage" class="tab-pane fade in active text-center">
                                            <iframe src="imageUpload.aspx?path=screenshots" frameborder="0" style="width:100%;height:320px;"></iframe>
                                        </div>
                                        <div id="ScreenShotsImageGallary" class="tab-pane fade">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="True">
                                                <ContentTemplate>
                                                    <asp:Button ID="RefreshScreenShotsImageGallary" CssClass="btn btn-info btn-block" style="margin:10px 0;" runat="server" OnClick="RefreshScreenShotsImageGallary_Click"
                                                        Text="刷新" />
                                                    <input type="hidden" id="hidden2" runat="server" />
                                                    <asp:Repeater ID="ScreenShotsImageGallaryRepeater" runat="server">
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
                                    <button type="button" id="SetAsScreenShotsBtn" class="btn btn-primary">设为屏幕截图</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="../../js/jquery-3.2.1.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function appendImg(parentElement, imgSrc) {
            var imgSrcArray = imgSrc.split(",");
            for (var i = 0; i < imgSrcArray.length; i++) {
                if (imgSrcArray[i] != "") {
                    var $img = $(
                        '<img class="img-thumbnail" style="width:100%;height:180px;" src="' + imgSrcArray[i] + '" >'
                    );
                    $(parentElement).append($img);
                }
            }
        }
        function init() {
            var IconImageSrc, ScreenShotsImageSrc;
            if ("<%=SoftwareIcon%>" != "None") {
                IconImageSrc = "<%=SoftwareIcon%>";
                appendImg(IconImageShow, IconImageSrc);
            }
            if ("<%=SoftwareScreenShots%>" != "None") {
                ScreenShotsImageSrc = "<%=SoftwareScreenShots%>";
                appendImg(ScreenShotsImageShow, ScreenShotsImageSrc);
            }
        }
        $(document).ready(function () {
            init();
            $("#IconImageGallary img").click(function () {
                $("#IconImageGallary img").removeClass("selected");
                $(this).addClass("selected");
            });
            $("#ScreenShotsImageGallary img").click(function () {
                if ($(this).hasClass("selected")) {
                    $(this).removeClass("selected");
                }
                else {
                    $(this).addClass("selected");
                }
            })
            $("#SetAsIconBtn").click(function () {
                IconImageSrc = "";
                $("#IconImageShow").empty();
                for (var i = 0; i < $("#IconImageGallary .selected ").length; i++) {
                    IconImageSrc += $("#IconImageGallary .selected ")[i].src + ",";
                }
                if (IconImageSrc != undefined && IconImageSrc != "") {
                    $("#hidden1").val(IconImageSrc);
                    $("#hidden1").submit();
                    appendImg(IconImageShow, IconImageSrc);
                    $('#IconImageModal').modal('hide');
                }
                else {
                    alert("未选择图像！");
                }
            })
            $("#SetAsScreenShotsBtn").click(function () {
                ScreenShotsImageSrc = "";
                $("#ScreenShotsImageShow").empty();
                for (var i = 0; i < $("#ScreenShotsImageGallary .selected ").length; i++) {
                    ScreenShotsImageSrc += $("#ScreenShotsImageGallary .selected ")[i].src + ",";
                }
                if (ScreenShotsImageSrc != undefined && ScreenShotsImageSrc != "") {
                    $("#hidden2").val(ScreenShotsImageSrc);
                    $("#hidden2").submit();
                    appendImg(ScreenShotsImageShow, ScreenShotsImageSrc);
                    $('#ScreenShotsImageModal').modal('hide');
                }
                else {
                    alert("未选择图像！");
                }
            })
        });
    </script>
</body>

</html>