(($) ->
  $.fn.waist = (text=null, options={}) ->
    family=$("input").css("font-family") || 'Lucida Grande'
    text = text or this.text() ||''
    this.css "text-align", "center"
    options.min = options.min or 8
    height = options.height or this.height() * 0.8 || 200
    width = options.width or this.width() or 200
    room = Math.floor(width / text.length)

    #find out how wide these letters are when rendered
    randomstring= "slkjeoclcmlsekjc"
    $("body").append """<span id="#{randomstring}" style="opacity:0.0; font-size:10px; font-family:#{family};">#{text}</span>"""
    randomstring= "#"+randomstring
    avg = Math.ceil($(randomstring).width() / text.length)
    $(randomstring).remove()
    font = Math.floor(room / (avg / 10))
    font = height if font > height
    font = options.min  if font < options.min
    this.text text
    this.css "font-size", parseInt(font)

  $.waist= (options={}) ->
    sel= options.sel || ".waist"
    $(sel).each () ->
        $(this).waist(null, options)

) jQuery