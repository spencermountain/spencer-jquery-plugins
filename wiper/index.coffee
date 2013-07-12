$ ->

  new_transition = ->
    transitions = [
      {left:0,top:100},
      {left:0,top:-100},
      {left:100,top:0},
      {left:-100,top:0},
    ]
    i = Math.floor(Math.random() * transitions.length)
    transitions[i]

  new_colour = ->
    colours = ["#1f77b4", "#aec7e8", "#ff7f0e", "#ffbb78", "#2ca02c", "#98df8a", "#d62728", "#ff9896", "#9467bd", "#c5b0d5", "#8c564b", "#c49c94", "#e377c2", "#f7b6d2", "#7f7f7f", "#c7c7c7", "#bcbd22", "#dbdb8d", "#17becf", "#9edae5"]
    i = Math.floor(Math.random() * colours.length)
    colours[i]

  i = 0
  prepare_next = ->
    console.log "prepare"
    i++
    t= new_transition()
    next = $("""<span class="box next"></span>""")
    next.html i
    next.css "background", new_colour()
    next.css "left", "#{t.left}%"
    next.css "top", "#{t.top}%"
    $("#stage").append next

  cleanup = ->
    console.log "cleanup"
    $(this).siblings(".current").remove()
    $(this).addClass "current"
    $(this).removeClass "next"
    $(this).siblings(".next").remove()
    prepare_next()


  bang= ->
    console.log($(".next").length)
    $(".next").animate({left:"0%", top:"0%"}, 400, "easeInExpo", cleanup)

  prepare_next()
  window.setInterval(->
    bang()
  , 2000)
