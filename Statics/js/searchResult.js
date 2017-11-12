function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串   
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    return theRequest;
}
function getMoreDynamic(start, count, searchContent, searchClass) {
    $.ajax({
        type: "Get",
        dataType: "json",
        url: "/GetDynamic.ashx",
        data: "start=" + start + "&count=" + count + "&searchcontent=" + searchContent + "&searchclass=" + searchClass,
        success: function (data) {
            if (data.length < count) {
                $("#btn-more").hide();
                $("#dynamic-end").show();
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
                    '       <div class="panel-dynamic-content"><a href="' + item.DynamicLink + '">摘要：' + item.DynamicContent + '</a></div>' +
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
            $("#dynamic-end").show();
            $("#btn-more").hide();
            //alert("程序错误，错误信息：" + errorThrown);
        }
    });
}
$(document).ready(function () {
    var start = 0,
        count = 5;
    var Request = new Object();
    Request = GetRequest();
    getMoreDynamic(start, count, Request["searchcontent"], Request["searchclass"]);
    $("#btn-more").click(function () {
        start += count;
        getMoreDynamic(start, count, Request["searchcontent"], Request["searchclass"]);
    });
});