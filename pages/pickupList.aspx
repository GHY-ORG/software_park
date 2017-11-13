<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="pickupList.aspx.cs" Inherits="pages_pickupList" Title="软件园·P!CKUP" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/Statics/css/pickupList.min.css?v=20171102" />
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <!--位置-->
    <section class="softwarepark-breadcrumb">
        <div class="container">
            <div class="row">
                <ol class="breadcrumb">
                    <li>
                        <span>你的位置:</span>
                    </li>
                    <li class="active">
                        <a href="/pages/pickupList.aspx">P!CKUP</a>
                    </li>
                    <span class="breadcrumb-end"></span>
                </ol>
            </div>
        </div>
    </section>
    <div class="container">
        <!--pickup标题-->
        <div class="pickup-title">
            <h1>P!ICKUP</h1>
            <p>P!ck新潮 Up热门</p>
            <button type="button" class="btn btn-info btn-let-me-up" data-toggle="modal" data-target="#let-me-up-modal">我要UP</button>
            <div class="pickup-title-line"></div>
        </div>
        <!--pickupList-->
        <div id="pickup-list">
        </div>
        <!--加载更多-->
        <div id="pickup-end" style="display:none;">
            <p>没有更多啦 戳“我要UP”看看呢</p>
            <div class="pickup-end-line"></div>
        </div>
        <div class="text-center">
            <button type="button" class="btn btn-info" id="btn-more">更 多</button>
        </div>
    </div>
    <!--我要UP弹窗-->
    <div class="modal fade" id="let-me-up-modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title text-center">— 我 要 U P —</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="sr-only" for="CommendItemTextBox">请输入被UP对象的名称或标题...</label>
                        <asp:TextBox ID="CommendItemTextBox" runat="server" placeholder="请输入被UP对象的名称或标题..." required="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="CommendContentTextBox">请输入内容..</label>
                        <asp:TextBox ID="CommendContentTextBox" runat="server" placeholder="请输入内容..." TextMode="MultiLine" required="" ViewStateMode="Inherit"
                            CssClass="form-control" Rows="5"></asp:TextBox>
                    </div>
                    <div class="text-center">
                        <asp:Button ID="CommendItemSubmitBtn" runat="server" CssClass="btn btn-info btn-submit" Text="提交" OnClick="CommendItemSubmitBtn_Click"
                        />
                    </div>
                </div>
                <div class="modal-footer">
                    <span class="help-block">
                        <p>Ooops！都有些什么正确的UP姿势呢？</p>
                        <p>✔可安利软件、APP、游戏（内容健康、不侵权）</p>
                        <p>✔可署名</p>
                        <p>✔可留下您的联系方式（我们保证您的隐私）</p>
                    </span>
                    <div class="form-group">
                        <label class="sr-only" for="ContactInfoTextBox">您可以留下您的联系方式，也可不填</label>
                        <asp:TextBox ID="ContactInfoTextBox" runat="server" placeholder="您可以留下您的联系方式，也可不填" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="js" runat="server">
    <script src="/Statics/js/masonry.pkgd.min.js"></script>
    <script src="/Statics/js/pickuplist.min.js?v=20171102"></script>
</asp:Content>