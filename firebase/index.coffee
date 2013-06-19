$ ->
  $.fn.firebase = ->
    uuid = (length=7) ->
      id = ""
      id += Math.random().toString(36).substr(2) while id.length < length
      "id"+id.substr 0, length

    init = (account, namespace = uuid()) ->
      root.fb = new Firebase("http://#{account}.firebaseio.com").child(namespace)
      $(".mack").each (i,d) ->
        el=$(this)
        key= el.attr("id") || "mackid#{i}"
        el.attr("mack-id", key)
        el.val()
        el.focusout ->
          update()
        root.fb.on "value", (snapshot) ->
          obj = snapshot.val() || {}
          Object.keys(obj).forEach (key)->
            $("input[mack-id=\"#{key}\"]").val(obj[key])

    update = ->
      obj= {}
      $(".mack").each (i,d) ->
        el=$(this)
        obj[el.attr("mack-id")]=el.val()||el.html()
      root.fb.set obj

    init()