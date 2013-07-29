$ ->
  w= 900
  h= 300
  buffer= 20
  length= 300
  overlap= 50

  data= [
      {image:"https://www.googleapis.com/freebase/v1/image/en/toronto?mode=fillcropmid&maxwidth=#{length}&maxheight=#{length}"
      },
      {image:"https://www.googleapis.com/freebase/v1/image/en/vancouver?mode=fillcropmid&maxwidth=#{length}&maxheight=#{length}"
      },
      {image:"https://www.googleapis.com/freebase/v1/image/en/radiohead?mode=fillcropmid&maxwidth=#{length}&maxheight=#{length}"
      },
      {image:"https://www.googleapis.com/freebase/v1/image/en/jupiter?mode=fillcropmid&maxwidth=#{length}&maxheight=#{length}"
      },
    ]
  svg = d3.select("#result").append("svg").attr("width", w+buffer).attr("height", h).style("border","1px solid grey")
  svg= svg.append("g").attr("transform","translate(#{-overlap},0)")

  leanleft=(w=100, amount=40, left )->
    """
      m #{left} 0
      l #{w - amount} 0
      l #{amount} #{w}
      l #{-w + amount} 0
      z
    """

  leanright=(w=100, amount=40, left )->
    """
      m #{amount+left} 0
      l #{w - amount} 0
      l #{amount} #{w}
      l #{-w + amount} 0
      z
    """



  defs = svg.append("defs")
  defs.selectAll("pattern").data(data).enter().append("pattern")
  .attr("id",(d,i)->
    "img#{i}"
    )
  .attr("patternUnits","userSpaceOnUse")
  .attr("width","#{length}")
  .attr("height","#{length}")
  .attr("x", (d,i)-> (length - overlap) * i )
  .append("image")
  .attr("height","#{length}")
  .attr("width","#{length}")
  .attr("xlink:href",(d,i)-> data[i].image)
  .attr("y",0)

  gs = svg.selectAll("g").data(data).enter().append("g")

  gs
  .append("path")
  # .attr( "stroke", (d,i) -> "green")
  .attr "d", (d,i) ->
    leanleft(length, overlap, (i*(length-overlap/2) ) ).compact()
  .style( "fill", (d,i)->
    "url(#img#{i})"
    )
  .transition().delay((d,i)->i*100).duration(1200)
  .attr "d", (d,i) ->
    leanleft(length, overlap, (i*(length-overlap)) ).compact()

  # svg.selectAll("image").transition().delay((d,i)->i*100).duration(5200)
  # .attr("y","50")