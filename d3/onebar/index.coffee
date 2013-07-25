#make a bar that shows proportions
# $("body:first").bar([{value:25, title:"good"}, {value:75, title:"evil"}])
$.fn.bar = (data=[], options={w:300, h:30, delay:0, duration:800, ease:"linear", labels:true}) ->
  stage= this[0];
  colours = ["steelblue","darkred","#1f77b4", "#aec7e8", "#ff7f0e", "#ffbb78", "#2ca02c", "#98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", "#8c564b", "#c49c94", "#e377c2", "#f7b6d2", "#7f7f7f", "#c7c7c7", "#bcbd22", "#dbdb8d", "#17becf", "#9edae5"]
  svg = d3.select(stage).append("svg:svg").attr("height", options.h ).attr("width", options.w)
  sum= data.reduce(((p,v) -> p+(v.value||0)), 0)
  x = d3.scale.linear().domain([0, sum]).range([0, options.w])
  rect = svg.selectAll("rect").data(data).enter().append("rect")

  #sum up previous values
  already= (i)->
    if i==0
      0
    data.slice(0, i).reduce( ((p, c) -> (parseInt(p) + c.value)||0 ), 0)

  rect
  .attr("x", (d, i) ->0)
  .attr("y", (d) ->0)
  .attr("height", options.h)
  .attr("width", (d) -> x 0)
  .attr("fill-opacity", 1.0)
  .attr("title", (d, i) -> d.title||'')
  .style( "fill", (d, i) -> d.color||colours[i])

  rect
  .transition()
  .duration(options.duration)
  .ease(options.ease)
  .delay((d,i)-> options.delay)
  .attr("x", (d, i) -> x(already(i)) )
  .attr("width", (d) -> x d.value)

  rect.append("svg:title").text((d,i)->d.title||"")

  if options.labels
    texts = svg.selectAll("text").data(data).enter().append("text")
    texts.style("fill","white")
    .style("font-size","12")
    .attr("x", (d,i) -> 0)
    .attr("y", (d,i)-> options.h/2)
    .attr("text-anchor", "start")
    .attr("dx", 10)
    .transition()
    .duration(options.duration)
    .ease(options.ease)
    .delay((d,i)-> options.delay)
    .attr("x", (d, i) ->
      x(already(i))
    ).text (d)->
      if x(d.value)>0
        d.title||""