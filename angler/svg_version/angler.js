(function() {
  if (window.HAML == null) {
    window.HAML = {};
  }

  window.HAML['angler'] = function(context) {
    return (function() {
      with (context || {}) {;
      var $c, $o, amount, colours, direction, end_polygon, leanleft, leanright, start_polygon, width;
      $c = function(text) {
        switch (text) {
          case null:
          case void 0:
            return '';
          case true:
          case false:
            return '' + text;
          default:
            return text;
        }
      };
      $o = [];
      start_polygon = function(w) {
        return "m 0 0\nl " + w + " 0\nl 0 " + w + "\nl " + (-w) + " 0\nz";
      };
      end_polygon = function(w, angle, overlap) {
        return "m " + (w - overlap) + " 0\nl " + w + " 0\nl 0 " + w + "\nl " + (-1 * (overlap * (-1 * (angle / 100))) - w) + " 0\nz";
      };
      leanleft = function(w, amount) {
        return "m 0 0\nl " + (w - amount) + " 0\nl " + amount + " " + w + "\nl " + (-w + amount) + " 0\nz";
      };
      leanright = function(w, amount) {
        return "m " + amount + " 0\nl " + (w - amount) + " 0\nl " + (-amount) + " " + w + "\nl " + (-w + amount) + " 0\nz";
      };
      amount = 50;
      direction = "right";
      width = 200;
      colours = ["#2ca02c", "#98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", "#8c564b", "#c49c94", "#e377c2", "#f7b6d2"];
      $o.push("<svg>\n  <g transform='translate(100,100)'>");
      [0, 1, 2, 3].map(function(i) {
        $o.push("    <g transform='translate(" + ($c((width - amount) * i)) + ",0)'>\n      <rect width='200' height='200' stroke='darkred'></rect>\n      <path d='" + ($c(leanright(width, amount, direction))) + "' fill='" + ($c(colours[i])) + "'></path>\n    </g>");
        return '';
      });
      $o.push("  </g>\n</svg>");
      return $o.join("\n").replace(/\s(\w+)='true'/mg, ' $1').replace(/\s(\w+)='false'/mg, '');
      return };
    }).call(context);
  };

}).call(this);
