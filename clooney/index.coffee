

$ ->
  cell = ->
  @style("left", (d) ->
    d.x + "px"
  ).style("top", (d) ->
    d.y + "px"
  ).style("width", (d) ->
    d.dx - 1 + "px"
  ).style "height", (d) ->
    d.dy - 1 + "px"

  w = 960
  h = 500
  d3_category20 = ["#1f77b4", "#aec7e8", "#ff7f0e", "#ffbb78", "#2ca02c", "#98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", "#8c564b", "#c49c94", "#e377c2", "#f7b6d2", "#7f7f7f", "#c7c7c7", "#bcbd22", "#dbdb8d", "#17becf", "#9edae5"]
  treemap = d3.layout.treemap().size([w, h]).sticky(true).value((d) ->
    d.size
  )
  div = d3.select("#chart").append("div").style("position", "relative").style("width", w + "px").style("height", h + "px")
  json= {
     "name": "flare",
     "size":50
     "children": [
      {
       "name": "analytics",
       "children": [
        {
         "name": "cluster",
         "children": [
          {"name": "aa", "size": 138},
          {"name": "ff", "size": 112},
          {"name": "dd", "size": 143}
         ]
        },
        {
         "name": "graph",
         "children": [
          {"name": "ccc", "size": 134},
          {"name": "wwwww", "size": 131}
         ]
        }
       ]
      },
      {"name": "asdf", "size": 134},
     ]
    }
  div.data([json]).selectAll("div").data(treemap.nodes).enter().append("div").attr("class", "cell").style("background", (d, i) ->
    d3_category20[i]  unless d.children
  ).data(treemap.value((d) ->
    1
  )).call(cell).text (d) ->
    (if d.children then null else d.name)

  div.selectAll("div").data(treemap.value((d) ->
    d.size
  )).transition().duration(2500).call cell
