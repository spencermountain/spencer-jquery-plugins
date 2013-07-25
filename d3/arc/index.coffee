#make a arc that shows proportions
# $("body:first").arc([{value:25, title:"good"}, {value:75, title:"evil"}])
$.fn.arc = (data=[], options={r:75, delay:0, duration:800, ease:"linear", labels:true}) ->
  stage= this[0];
  colours = ["steelblue","darkred","#1f77b4", "#aec7e8", "#ff7f0e", "#ffbb78", "#2ca02c", "#98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", "#8c564b", "#c49c94", "#e377c2", "#f7b6d2", "#7f7f7f", "#c7c7c7", "#bcbd22", "#dbdb8d", "#17becf", "#9edae5"]
  options.w= options.w||options.r*2
  options.h= options.h||options.r
  sum= data.reduce(((p,v) -> p+(v.value||0)), 0)
  scale_angle = d3.scale.linear().range([-(Math.PI / 2), Math.PI / 2]).domain([0, sum])

  #maths
  already= (i)->
    return 0 if i==0
    data.slice(0, i).reduce( ((p, c) -> (parseInt(p) + c.value)||0 ), 0)

  r2ang= (r)->
    r * (180/Math.PI)

  #sum up previous values
  data = data.map (v, i) ->
    v.previous = already(i)
    v

  arc = d3.svg.arc()
  .startAngle((d) -> scale_angle d.previous )
  .endAngle((d) -> scale_angle d.previous + d.value)
  .innerRadius((d) -> options.r)
  .outerRadius((d) -> 0.5 * options.r)


  label= (arcs)->
    #text labels
    if options.labels
      arcs.append("svg:text")
      .attr("transform", (d,i) ->
        d= data[i]
        mid= d.previous+(d.value/2)
        c = arc.centroid(d)
        x = c[0]
        y = c[1]
        r= options.label_r || options.r*0.75
        h = Math.sqrt(x*x + y*y) # pythagorean theorem for hypotenuse
        "translate(" + (x/h * r) +  ',' +(y/h * r) +  ")rotate(#{r2ang(scale_angle(mid))})";
      )
      .attr("text-anchor", "middle")
      .style("fill", "white")
      .text((d,i) -> data[i].title||"")


  if d3.select(stage).select("svg")[0][0]
    #update existing arc
    console.log "exists"
    svg= d3.select(stage).select("svg")
    arcs= d3.select($("#results")[0]).select("svg").selectAll("path")#.data(data).enter().append("g")
    arcs.transition().duration(1200).attr("d", (d,i)-> arc data[i])
    label(arcs)

  else
    #create new arc
    console.log "new"
    svg = d3.select(stage).append("svg").attr("width", options.w).attr("height", options.h)
    wrapper= svg.append("g").attr("transform", "translate( #{options.w / 2}, #{options.h} )")
    arcs = wrapper.selectAll("g").data(data).enter().append("g")

    arcs
    .append("path")
    .style("fill", (d, i) ->
      d.color || colours[i]
    ).attr("d", arc)
    label(arcs)

    #mouseover thing
    arcs.append("svg:title").text((d)->d.title||"")


