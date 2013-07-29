// Generated by CoffeeScript 1.6.3
$(function() {
  var buffer, data, defs, gs, h, leanleft, leanright, length, overlap, svg, w;
  w = 900;
  h = 300;
  buffer = 20;
  length = 300;
  overlap = 50;
  data = [
    {
      image: "https://www.googleapis.com/freebase/v1/image/en/toronto?mode=fillcropmid&maxwidth=" + length + "&maxheight=" + length
    }, {
      image: "https://www.googleapis.com/freebase/v1/image/en/vancouver?mode=fillcropmid&maxwidth=" + length + "&maxheight=" + length
    }, {
      image: "https://www.googleapis.com/freebase/v1/image/en/radiohead?mode=fillcropmid&maxwidth=" + length + "&maxheight=" + length
    }, {
      image: "https://www.googleapis.com/freebase/v1/image/en/jupiter?mode=fillcropmid&maxwidth=" + length + "&maxheight=" + length
    }
  ];
  svg = d3.select("#result").append("svg").attr("width", w + buffer).attr("height", h).style("border", "1px solid grey");
  svg = svg.append("g").attr("transform", "translate(" + (-overlap) + ",0)");
  leanleft = function(w, amount, left) {
    if (w == null) {
      w = 100;
    }
    if (amount == null) {
      amount = 40;
    }
    return "m " + left + " 0\nl " + (w - amount) + " 0\nl " + amount + " " + w + "\nl " + (-w + amount) + " 0\nz";
  };
  leanright = function(w, amount, left) {
    if (w == null) {
      w = 100;
    }
    if (amount == null) {
      amount = 40;
    }
    return "m " + (amount + left) + " 0\nl " + (w - amount) + " 0\nl " + amount + " " + w + "\nl " + (-w + amount) + " 0\nz";
  };
  defs = svg.append("defs");
  defs.selectAll("pattern").data(data).enter().append("pattern").attr("id", function(d, i) {
    return "img" + i;
  }).attr("patternUnits", "userSpaceOnUse").attr("width", "" + length).attr("height", "" + length).attr("x", function(d, i) {
    return (length - overlap) * i;
  }).append("image").attr("height", "" + length).attr("width", "" + length).attr("xlink:href", function(d, i) {
    return data[i].image;
  }).attr("y", 0);
  gs = svg.selectAll("g").data(data).enter().append("g");
  return gs.append("path").attr("d", function(d, i) {
    return leanleft(length, overlap, i * (length - overlap / 2)).compact();
  }).style("fill", function(d, i) {
    return "url(#img" + i + ")";
  }).transition().delay(function(d, i) {
    return i * 100;
  }).duration(1200).attr("d", function(d, i) {
    return leanleft(length, overlap, i * (length - overlap)).compact();
  });
});

/*
//@ sourceMappingURL=index.map
*/
