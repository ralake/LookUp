function greyOut() { $('#screen').css( { "width": $(document).width(), "height": $(document).height() })
	.click(function() { $(this).css("display", "none"); $('#screen').css("display", "none"); });
}
