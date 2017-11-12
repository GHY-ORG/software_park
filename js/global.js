jQuery(document).ready(function ($) {
	// browser window scroll (in pixels) after which the "back to top" link is shown
	var offset = 300,
		//browser window scroll (in pixels) after which the "back to top" link opacity is reduced
		offset_opacity = 1200,
		//duration of the top scrolling animation (in ms)
		scroll_top_duration = 700,
		//grab the "back to top" link
        $back_to_top = $('#floating-window');

	//hide or show the "back to top" link
	$(window).scroll(function () {
        ($(this).scrollTop() > offset) ? $back_to_top.addClass('floating-window-is-visible') : $back_to_top.removeClass('floating-window-is-visible floating-window-fade-out');
		if ($(this).scrollTop() > offset_opacity) {
            $back_to_top.addClass('floating-window-fade-out');
		}
	});

	//smooth scroll to top
    $("#back-to-top").on('click', function (event) {
		event.preventDefault();
		$('body,html').animate({
			scrollTop: 0,
		}, scroll_top_duration);
	});

});
$(document).ready(function () {
    $("#search-btn").click(function () {
        location.href = "searchResult.aspx?searchcontent=" + $("#search-input").val() + "&searchclass=2";
    });
    $("#search-input").keydown(function (e) {
        if (e.keyCode == 13) {
            e.preventDefault();
            location.href = "searchResult.aspx?searchcontent=" + $("#search-input").val() + "&searchclass=2";
        }
    });
});
