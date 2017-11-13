<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="bannerEdit.aspx.cs" Inherits="admin_pages_bannerEdit" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="../css/pickupEdit.css" rel="stylesheet" />
</asp:Content>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-8">
            <div class="form-group">
                <label class="sr-only" for="BannerDescriptionTextBox">请输入Banner描述</label>
                <asp:TextBox ID="BannerDescriptionTextBox" runat="server" placeholder="请输入Banner描述" CssClass="form-control" MaxLength="50"></asp:TextBox>
                <div class="help-block">
                    描述限制长度50
                </div>
            </div>
            <div class="form-group">
                <label class="sr-only" for="BannerLinkTextBox">请输入链接</label>
                <asp:TextBox ID="BannerLinkTextBox" runat="server" placeholder="请输入链接" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">发布</div>
                <div class="panel-body">
                    <div class="form-inline">
                        <asp:Button ID="BannerSubmitBtn" CssClass="btn btn-default pull-right" runat="server" Text="发布" OnClick="BannerSubmitBtn_Click"
                        />
                        <div class="form-group">
                            <i class="glyphicon glyphicon-wrench"></i> 状态：
                            <asp:RadioButtonList ID="BannerStateRadioButtonList" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Selected="True" Value="0">未审核</asp:ListItem>
                                <asp:ListItem Value="1">发布</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Banner</div>
                <div class="panel-body">
                    <div id="BannerImageShow">

                    </div>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#BannerImageModal">添加Banner</button>
                </div>
            </div>
        </div>
    </div>

    <div id="BannerImageModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">特色图片</h4>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-pills">
                        <li class="active">
                            <a data-toggle="pill" href="#UploadBannerImage">上传文件</a>
                        </li>
                        <li>
                            <a data-toggle="pill" href="#BannerImageGallary">媒体库</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="UploadBannerImage" class="tab-pane fade in active text-center">
                            <iframe src="imageUpload.aspx?path=banner" frameborder="0" style="width:100%;height:320px;"></iframe>
                        </div>
                        <div id="BannerImageGallary" class="tab-pane fade">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
                                <ContentTemplate>
                                    <asp:Button ID="RefreshBannerImageGalleryBtn" CssClass="btn btn-info btn-block" style="margin:10px 0;" runat="server" OnClick="RefreshBannerImageGalleryBtn_Click"
                                        Text="刷新" />
                                    <input type="hidden" id="hidden1" runat="server" />
                                    <asp:Repeater ID="BannerImageGallaryRepeater" runat="server">
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
                    <button type="button" id="SetAsBannerBtn" class="btn btn-primary">设为图标</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="js" runat="server">
    <script type="text/javascript">
        function appendImg(parentElement, imgSrc) {
            var imgSrcArray = imgSrc.split(",");
            for (var i = 0; i < imgSrcArray.length; i++) {
                if (imgSrcArray[i] != "") {
                    var $img = $(
                        '<img class="img-thumbnail" style="width:100%;height:180px;" src="' + imgSrcArray[i] +
                        '" >'
                    );
                    $(parentElement).append($img);
                }
            }
        }

        function init() {
            var BannerImageSrc;
            if ("<%=BannerImageSrc%>" != "None") {
                BannerImageSrc = "<%=BannerImageSrc%>";
                appendImg(BannerImageShow, BannerImageSrc);
            }
        }
        $(document).ready(function () {
            init();
            $("#BannerImageGallary img").click(function () {
                $("#BannerImageGallary img").removeClass("selected");
                $(this).addClass("selected");
            });
            $("#SetAsBannerBtn").click(function () {
                BannerImageSrc = "";
                $("#BannerImageShow").empty();
                for (var i = 0; i < $("#BannerImageGallary .selected ").length; i++) {
                    BannerImageSrc += $("#BannerImageGallary .selected ")[i].src;
                }
                if (BannerImageSrc != undefined && BannerImageSrc != "") {
                    $("#hidden1").val(BannerImageSrc);
                    $("#hidden1").submit();
                    appendImg(BannerImageShow, BannerImageSrc);
                    $('#BannerImageModal').modal('hide');
                } else {
                    alert("未选择图像！");
                }
            })
        });
    </script>
</asp:Content>