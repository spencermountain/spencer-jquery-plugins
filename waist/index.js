(function($) {

	$.fn.waist = function(text, options) {
		text=text||this.text();
		if(!text){return}
		options=options||{};
		options.min=options.min||8
		options.height=options.height||this.height()||200;
		options.width=options.width||this.width()||200;
		var room=Math.floor(options.width/text.length);
		//find out how wide these letters are when rendered
		$('body').append('<span id="tmp" style="opacity:0.0; font-size:10px;">'+text+'</span>')
		var avg=Math.ceil($("#tmp").width()/text.length)
		$("#tmp").remove()
		var font=Math.floor(room/(avg/10));
		if(font>options.height){
			font=options.height;
		}
		if(font<options.min){
			font=options.min
		}
		this.text(text)
		this.css('font-size',parseInt(font))
}

})( jQuery );