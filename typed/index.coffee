(($) ->

  #skip callbacks during  fast typing
  $.fn.type = (callback) ->
    timeoutID = undefined
    el = this
    @keyup ->
      window.clearTimeout timeoutID
      timeoutID = window.setTimeout(->
        callback el.val()
        el
      , 700)

) jQuery