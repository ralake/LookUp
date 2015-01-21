function greyOut(styleToApply) { $(styleToApply).css( { "width": $(document).width(), "height": $(document).height() })
	.click(function() {
		 	$(this).css("display", "none"); $(styleToApply).css("display", "none");
			$('#takePictureField').click(); 
		});
}
