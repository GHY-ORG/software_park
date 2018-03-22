﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pickupEdit.aspx.cs" Inherits="admin_pages_pickupEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Software Park Admin v1.0</title>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/Statics/css/normalize.css" />
    <link rel="stylesheet" href="/Statics/css/bootstrap.min.css" />
    <link href="../css/pickupEdit.css" rel="stylesheet" />
</head>

<body>
    <form id="BaseForm" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <label class="sr-only" for="CommendItemTextBox">请输入被UP对象的名称或标题</label>
                        <asp:TextBox ID="CommendItemTextBox" runat="server" placeholder="请输入被UP对象的名称或标题" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="CommendContent">请输入内容</label>
                        <asp:TextBox ID="CommendContentTextBox" runat="server" placeholder="请输入内容" TextMode="MultiLine" ViewStateMode="Inherit" CssClass="form-control"
                            Rows="5"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="ContactInfo">请输入联系方式</label>
                        <asp:TextBox ID="ContactInfoTextBox" runat="server" placeholder="请输入联系方式" TextMode="SingleLine" ViewStateMode="Inherit" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">发布</div>
                        <div class="panel-body">
                            <div class="form-inline">
                                <asp:Button ID="PickupSubmitBtn" CssClass="btn btn-default pull-right" runat="server" Text="发布" OnClick="PickupSubmitBtn_Click"
                                />
                                <div class="form-group">
                                    <i class="glyphicon glyphicon-wrench"></i> 状态：
                                    <asp:RadioButtonList ID="CommendItemStateRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
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
        </div>
    </form>
    <script src="/Statics/js/jquery-3.2.1.min.js"></script>
    <script src="/Statics/js/bootstrap.min.js"></script>
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
            var IconImageSrc;
            if ("<%=CommendItemIcon%>" != "None") {
                IconImageSrc = "<%=CommendItemIcon%>";
                appendImg(IconImageShow, IconImageSrc);
            }
        }
        $(document).ready(function () {
            init();
            $("#IconImageGallary img").click(function () {
                $("#IconImageGallary img").removeClass("selected");
                $(this).addClass("selected");
            });
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
        });
    </script>
</body>

</html>