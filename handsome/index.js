(function($) {

	function segment(text, fraction) {
			fraction = fraction / 100;
			var end = parseInt(text.length * fraction)
			return text.substring(0, end)
		}

		function render_defaults(txt, options) {
			options.normalize_to = options.normalise_to || txt.length;
			options.normalize_to = 100;
			if (typeof options.normalize_to == "string") {
				options.normalize_to = options.normalize_to.length;
			}
			var percentage = txt.length / options.normalize_to;
			var defaults = {
				duration: (options.duration || 1000) * percentage,
				humanize: false,
				resolution: txt.length,
				cursor: false
			}
			return $.extend(defaults, options);
		}

		function human_defaults(txt, options) {
			var defaults = {
				duration: txt.length * 90,
				humanize: true,
				resolution: txt.length,
				cursor: true
			}
			return $.extend(defaults, options);
		}


	$.fn.handsome = function(txt, options, callback) {
		options = options || {};
		if (typeof options == "function") {
			callback = options;
			options = {};
		}
		if (options.human) {
			options = human_defaults(txt, options)
		} else {
			options = render_defaults(txt, options)
		}
		var steps = options.duration / options.resolution;
		var el = this;
		var i = 0;
		var percentage = 0;
		var part = '';
		var last = '';
		var delay = 0;
		(function doit() {
			i++;
			percentage = (i / steps) * 100;
			part = segment(txt, percentage);
			if (part != last) {
				if (options.cursor) {
					part += '|';
				}
				el.html(part)
			}
			if (i < steps) {
				delay = options.duration / steps;
				if (options.humanize) {
					delay += Math.floor(Math.random() * 250) - 100;
				}
				setTimeout(doit, delay)
			} else {
				if (options.cursor) {
					el.text(el.text().replace(/\|$/, ''))
				}
				if (typeof callback == "function") {
					callback();
				}
			}
		})()
	};

})( jQuery );