root= module ? window
$ ->
  $.stick = (->
    stick= {}
    uuid = (length=7) ->
      id = ""
      id += Math.random().toString(36).substr(2) while id.length < length
      "id"+id.substr 0, length

    stick.reset = () ->
      root.fb.set {}
      $(root.sel).each (i,d) ->
        el=$(this)
        setvalue(el, "")

    stick.init = (account, namespace = uuid(), sel= ".stick") ->
      root.sel= sel
      root.fb = new Firebase("http://#{account}.firebaseio.com").child(namespace)
      $(root.sel).each (i,d) ->
        el=$(this)
        tag= el.prop('tagName')||""
        key= el.attr("id") || "id#{tag}#{i}"
        el.attr("stick-id", key)
        root.fb.on "value", (snapshot) ->
          obj = snapshot.val() || {}
          Object.keys(obj).forEach (key)->
            e=$("[stick-id=\"#{key}\"]")
            if getvalue(e)!=obj[key]
              setvalue(e, obj[key])
          el.change ->
            stick.update(el)
          if el.attr('contentEditable',true)
            el.on("blur", ->
              el.trigger("change")
            )


    stick.update =(el) ->
      obj= {}
      root.fb.once('value', (snapshot)->
        obj = snapshot.val() || {}
        console.log(obj)
        obj[el.attr("stick-id")]=getvalue(el)
        root.fb.set obj
      )

    getvalue = (el) ->
      if el.is("input") && el.attr("type")=="checkbox"
        return el.is(':checked')
      else if el.is("input")
        return el.val()
      else if el.is("textarea")
        return el.val()
      else if el.attr('contentEditable',true)
        return el.html()
      else
        el.val() || el.html()

    setvalue = (el, val) ->
      if el.is("input") && el.attr("type")=="checkbox"
        return el.prop('checked', val);
      else if el.is("input")
        return el.val(val)
      else if el.is("textarea")
        return el.val(val)
      else if el.attr('contentEditable',true)
        return el.html(val)
      else
        el.val(val)

    stick
    )()