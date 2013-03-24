(function($) {

//skip callbacks during  fast typing
  $.fn.type = function(callback) {
    var timeoutID;
    var el = this;
    this.keyup(function() {
      window.clearTimeout(timeoutID);
      timeoutID = window.setTimeout(function() {
        callback(el.val())
        return el;
      }, 700);
    });
  }

})( jQuery );