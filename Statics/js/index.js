function getMoreDynamic(start, count) {
    $.ajax({
        type: "Get",
        dataType: "json",
        url: "GetDynamic.ashx",
        data: "start=" + start + "&count=" + count,
        success: function (data) {
            if (data.length < count) {
                $("#btn-more").hide();
                $("#dynamic-end").css("display", "block");
            }
            $.each(data, function (i, item) {
                var $panel = $(
                    '<div class="panel panel-default">' +
                    '   <div class="panel-heading">' +
                    '       <h5 class="panel-dynamic-class">' + item.DynamicClass + '</h5>' +
                    '       <a class="panel-dynamic-title" href="' + item.DynamicLink + '">' + '<p>' + item.DynamicTitle + '</p></a>' +
                    '       <p class="panel-dynamic-time">' + item.DynamicUploadTime + '</p>' +
                    '       <div class="clearfix"></div>' +
                    '   </div>' +
                    '   <div class="panel-body">' +
                    '       <div class="panel-dynamic-banner">' +
                    '           <a href="' + item.DynamicLink + '"><img src="' + item.DynamicBannerURL + '" alt="" /></a>' +
                    '       </div>' +
                    '       <div class="panel-dynamic-content"><a href="' + item.DynamicLink +'">摘要：' + item.DynamicContent + '</a></div>' +
                    '   </div>' +
                    '   <div class="panel-footer">' +
                    '       <div class="row">' +
                    '           <div class="col-md-4"></div>' +
                    '           <div class="col-md-4 col-md-offset-4">' +
                    '               <div class="panel-dynamic-viewtimes">' + '<div class="glyphicon glyphicon-eye-open"></div> 浏览量：' + item.DynamicViewtimes + '</div>' +
                    '           </div>' +
                    '       </div>' +
                    '   </div>' +
                    '</div>'
                );
                var tagsName = item.DynamicTagsName.split(",");
                var tagsID = item.DynamicTagsID.split(",");
                var $tagContainer = $panel.find(".panel-footer .row .col-md-4")[0];
                for (var i = 0; i < tagsName.length; i++) {
                    if (tagsName[i] != "") {
                        var $tag = $(
                            '<a href="/pages/searchResult.aspx?searchcontent=' + tagsID[i] + '&searchclass=1" class="badge panel-dynamic-tag">' + tagsName[i] + '</a>'
                        ).appendTo($tagContainer);
                    }
                }
                $("#dynamic").append($panel);
            })
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#dynamic-end").css("display", "block");
            //alert("程序错误，错误信息：" + errorThrown);
        }
    });
}
$(document).ready(function () {
    var start = 0,
        count = 5;
    getMoreDynamic(start, count);
    $("#btn-more").click(function () {
        start += count;
        getMoreDynamic(start, count);
    });
});