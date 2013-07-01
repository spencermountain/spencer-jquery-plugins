// Generated by CoffeeScript 1.6.3
(function($) {
  return $.fn.type = function(callback) {
    var el, timeoutID;
    timeoutID = void 0;
    el = this;
    return this.keyup(function() {
      window.clearTimeout(timeoutID);
      return timeoutID = window.setTimeout(function() {
        callback(el.val());
        return el;
      }, 700);
    });
  };
})(jQuery);

/*
//@ sourceMappingURL=index.map
*/
