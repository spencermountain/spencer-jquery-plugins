(function() {
  if (window.HAML == null) {
    window.HAML = {};
  }

  window.HAML['bar'] = function(context) {
    return (function() {
      with (context || {}) {;
      var $o;
      $o = [];
      $o.push("<h2>hiiii</h2>\n<table style='width:500px;'>\n  <tr>\n    <td>\n      <input type='range' min='1' max='{{sum}}' value='{{bars[0].value}}' style='height:200px; width:20px; -webkit-appearance: slider-vertical;'>\n    </td>\n    <td>\n      <input type='range' min='1' max='{{sum}}' value='{{bars[1].value}}' style='height:200px; width:20px; -webkit-appearance: slider-vertical;'>\n    </td>\n  </tr>\n</table>\n<svg>\n  <g transform='translate(130,130)'>\n    {{#each bars}}\n    <text font-size='12px'>{{sum}}</text>\n    <rect y='{{(i * 50)}}' x='{{value}}' height='30' width='{{w}}' style='fill: {{color}}'></rect>\n    {{/each}}\n  </g>\n</svg>");
      return $o.join("\n");
      return };
    }).call(context);
  };

}).call(this);
