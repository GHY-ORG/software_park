$(function () {

});

function getMorePickup(start, count) {
    $.ajax({
        type: "Get",
        dataType: "json",
        url: "/GetPickup.ashx",
        data: "start=" + start + "&count=" + count,
        success: function (data) {
            if (data.length < count) {
                $("#btn-more").hide();
                $("#pickup-end").css("display", "block");
            }
            $.each(data, function (i, item) {
                var $pickListItem = $(
                    '<div class="pickup-list-item">' +
                    '   <div class="item-block">' +
                    '       <div class="item-title">' +
                    '           <a href="pickupDetail.aspx?id=' + item.PickupID + '" class="item-title-icon"><img src="' + item.PickupCommendItemIcon + '" alt="' + item.PickupCommendItem + '" title="' + item.PickupCommendItem + '"></a>' +
                    '           <div class="item-title-text"><a href="pickupDetail.aspx?id=' + item.PickupID + '">' + item.PickupCommendItem + '</a></div>' +
                    '       </div>' +
                    '       <div class="item-block-content">' +
                    '           <div class="block-content-text"><a href="pickupDetail.aspx?id=' + item.PickupID + '"><p>' + item.PickupCommendContent + '</p></a><i class="taptap-icon icon-quote-left"></i><i class="taptap-icon icon-quote-right"></i></div>' +
                    '           <p class="block-content-uploadtime">' + item.PickupUploadTime + '</p>' +
                    '       </div>' +
                    '   </div>' +
                    '</div>'
                );
                $("#pickup-list").append($pickListItem).masonry().masonry('appended', $pickListItem);
            })
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#btn-more").hide();
            $("#pickup-end").css("display", "block");
            //alert("程序错误，错误信息：" + errorThrown);
        }
    });
}
$(document).ready(function () {
    var start = 0,
        count = 6;
    var $container = $('#pickup-list');
    $container.masonry({
            itemSelector: '.pickup-list-item',
            isAnimated: true,
        });
    getMorePickup(start, count);
    $("#btn-more").click(function () {
        start += count;
        getMorePickup(start, count);
    });

});