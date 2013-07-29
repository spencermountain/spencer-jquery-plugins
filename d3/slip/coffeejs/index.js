// Generated by CoffeeScript 1.6.3
var arc, arcTween, calcPercent, change, color, dataset, height, path, pie, radius, svg, timeout, width;

change = function() {
  console.log(path);
  clearTimeout(timeout);
  return path.data(pie(dataset[this.value])).transition().duration(750).attrTween("d", arcTween);
};

arcTween = function(a) {
  var i;
  i = d3.interpolate(this._current, a);
  this._current = i(0);
  return function(t) {
    return arc(i(t));
  };
};

calcPercent = function(percent) {
  return [percent, 100 - percent];
};

dataset = {
  apples: calcPercent(0),
  oranges: calcPercent(53)
};

width = 290;

height = 290;

radius = Math.min(width, height) / 2;

color = d3.scale.category20();

pie = d3.layout.pie().sort(null);

arc = d3.svg.arc().innerRadius(radius - 30).outerRadius(radius - 20);

svg = d3.select("body").append("svg").attr("width", width).attr("height", height).append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

path = svg.selectAll("path").data(pie(dataset.apples)).enter().append("path").attr("class", function(d, i) {
  return "color" + i;
}).attr("d", arc).each(function(d) {
  return this._current = d;
});

d3.selectAll("input").on("change", change);

timeout = setTimeout(function() {
  return d3.select("input[value=\"oranges\"]").property("checked", true).each(change);
}, 2000);

/*
//@ sourceMappingURL=index.map
*/
