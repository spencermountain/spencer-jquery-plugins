# store the initial values
change = ()->
  console.log path
  clearTimeout timeout
  path.data(pie(dataset[@value])).transition().duration(750).attrTween "d", arcTween # redraw the arcs

# Store the displayed angles in _current.
# Then, interpolate from _current to the new angles.
# During the transition, _current is updated in-place by d3.interpolate.
arcTween = (a) ->
  i = d3.interpolate(@_current, a)
  @_current = i(0)
  (t) ->
    arc i(t)


calcPercent = (percent) ->
  [percent, 100 - percent]
dataset =
  apples: calcPercent(0)
  oranges: calcPercent(53)

width = 290
height = 290
radius = Math.min(width, height) / 2
color = d3.scale.category20()
pie = d3.layout.pie().sort(null)
arc = d3.svg.arc().innerRadius(radius - 30).outerRadius(radius - 20)
svg = d3.select("body").append("svg").attr("width", width).attr("height", height).append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
path = svg.selectAll("path").data(pie(dataset.apples)).enter().append("path").attr("class", (d, i) ->
  "color" + i
).attr("d", arc).each((d) ->
  @_current = d
)
d3.selectAll("input").on "change", change

timeout = setTimeout(->
  d3.select("input[value=\"oranges\"]").property("checked", true).each change
, 2000)