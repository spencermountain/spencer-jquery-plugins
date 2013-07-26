(function() {
  if (window.HAML == null) {
    window.HAML = {};
  }

  window.HAML['template'] = function(context) {
    return (function() {
      with (context || {}) {;
      var $o;
      $o = [];
      $o.push("<input type='range' min='0' max='100' value='{{side}}' style='width:300px;'>\n<h2>{{side}} %</h2>\n<p></p>\n<input type='range' min='0' max='100' value='{{overlap}}' style='width:300px;'>\n<h2>{{overlap}} %</h2>\n<p></p>\n<svg>\n  <defs>\n    <pattern id='img1' patternUnits='userSpaceOnUse' width='{{side}}' height='{{side}}'>\n      <image xlink:href='{{image1}}' x='0' y='0' width='{{side}}' height='{{side}}' opacity='0.9'></image>\n    </pattern>\n    <pattern id='img2' patternUnits='userSpaceOnUse' width='{{(side*2)}}' height='{{side}}'>\n      <image xlink:href='{{image2}}' x='200' y='0' width='{{side}}' height='{{side}}' opacity='0.9'></image>\n    </pattern>\n  </defs>\n  <g transform='translate(00,00)'>\n    <path d='m 0 0 l {{side}} 0 l 0 {{side}} l {{(-side)}} 0 z' fill='url(#img1)'></path>\n    <path d='m {{(side - overlap)}} 0 l {{(side)}} 0 l 0 {{side}} l {{(  -1 * (overlap * (-1*(angle/100))) -side  )}} 0 z' fill='url(#img2)'></path>\n  </g>\n</svg>");
      return $o.join("\n").replace(/\s(?:id|class)=(['"])(\1)/mg, "");
      return };
    }).call(context);
  };

}).call(this);
