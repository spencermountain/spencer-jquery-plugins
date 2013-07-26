(function() {
  if (window.HAML == null) {
    window.HAML = {};
  }

  window.HAML['control'] = function(context) {
    return (function() {
      with (context || {}) {;
      var $o;
      $o = [];
      $o.push("hiii");
      return $o.join("\n");
      return };
    }).call(context);
  };

}).call(this);
