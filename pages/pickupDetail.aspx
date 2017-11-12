<%@ Page Language="C#" MasterPageFile="~/Master/MasterPage.master" AutoEventWireup="true" CodeFile="pickupDetail.aspx.cs" Inherits="pages_pickupDetail" Title="软件园·P!CKUP·P!CK" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/css/pickupDetail.css?v=20170919" />
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <!--位置-->
        <section class="softwarepark-breadcrumb">
            <div class="container">
                <div class="row">
                    <ol class="breadcrumb">
                        <li><span>你的位置:</span></li>
                        <li><a href="/pages/pickupList.aspx">P!CKUP</a></li>
                        <li class="active"><a href="/pages/pickupDetail.aspx?id=<%=PickupID %>">P!CK</a></li>
                        <span class="breadcrumb-end"></span>
                    </ol>
                </div>
            </div>
        </section>
        <div class="container">
            <!--pickup-->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-pick-commenditemicon">
                        <img src="<%=PickupCommendItemIcon %>" alt="">
                    </div>
                    <div class="panel-pick-title">
                        <h3 class="panel-pick-commenditem">
                            <%=PickupCommendItem %>
                        </h3>
                        <p class="panel-pick-uploadtime">发布时间：
                            <%=PickupUploadTime %>
                        </p>
                    </div>
                    <asp:LinkButton ID="UpvoteLinkBtn" runat="server" CssClass="btn btn-primary" OnClick="UpvoteLinkBtn_Click"><i class="glyphicon glyphicon-thumbs-up"></i>
                        <%=PickupUpvoteNum %>次</asp:LinkButton>
                </div>
                <div class="panel-body">
                    <div class="panel-pick-commendcontent">
                        <p>
                            <%=PickupCommendContent %>
                        </p>
                        <i class="taptap-icon icon-quote-left"></i>
                        <i class="taptap-icon icon-quote-right"></i>
                    </div>
                </div>
            </div>
            <!--分页按钮-->
            <div class="text-center">
                <asp:LinkButton ID="PrevLinkBtn" CssClass="btn btn-info btn-pager" runat="server" OnClick="PrevLinkBtn_Click">上 一 个</asp:LinkButton>
                <asp:LinkButton ID="NextLinkBtn" CssClass="btn btn-info btn-pager" runat="server" OnClick="NextLinkBtn_Click">下 一 个</asp:LinkButton>
            </div>
        </div>
</asp:Content>