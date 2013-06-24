(($) ->
  segment = (text, fraction) ->
    fraction = fraction / 100
    end = parseInt(text.length * fraction)
    text.substring 0, end
  render_defaults = (txt, options) ->
    options.normalize_to = options.normalise_to or txt.length
    options.normalize_to = 100
    options.normalize_to = options.normalize_to.length  if typeof options.normalize_to is "string"
    percentage = txt.length / options.normalize_to
    defaults =
      duration: (options.duration or 1000) * percentage
      humanize: false
      resolution: txt.length
      cursor: false

    $.extend defaults, options

  human_defaults = (txt, options) ->
    defaults =
      duration: txt.length * 90
      humanize: true
      resolution: txt.length
      cursor: true

    $.extend defaults, options

  $.fn.handsome = (txt, options, callback) ->
    options = options or {}
    if typeof options is "function"
      callback = options
      options = {}
    if options.human
      options = human_defaults(txt, options)
    else
      options = render_defaults(txt, options)
    steps = options.duration / options.resolution
    el = this
    i = 0
    percentage = 0
    part = ""
    last = ""
    delay = 0
    (doit = ->
      i++
      percentage = (i / steps) * 100
      part = segment(txt, percentage)
      unless part is last
        part += "|"  if options.cursor
        el.html part
      if i < steps
        delay = options.duration / steps
        delay += Math.floor(Math.random() * 250) - 100  if options.humanize
        setTimeout doit, delay
      else
        el.text el.text().replace(/\|$/, "")  if options.cursor
        callback()  if typeof callback is "function"
    )()

  $.fn.climb = (options, callback) ->
    options= options ? {}
    delay = options.delay || 20
    callback= callback||->
    el=$(this)
    num = el.text()
    if parseInt(num)
      if options.average
        parts= bysize(num, options)
      else
        parts= bytime(num, options)
    i=0
    (doit = ->
      el.text parts[i]
      i++
      if i>=parts.length
        return callback
      else
        setTimeout(doit, delay)
    )()

  bytime= (num, options) ->
    time = options.time || 1200
    delay = options.delay || 20
    steps = options.steps || time/delay
    if num < steps
      steps = num
    parts= [0..steps].map (v) -> parseInt(num * (v/steps))
    parts


  bysize= (num, options) ->
    average = options.average || 100
    time = options.time || 1200
    delay = options.delay || 20
    max = options.max || 5000
    ideal_steps = time/delay
    ideal_divisor = average / ideal_steps
    if ((num/ideal_divisor) * delay) > max #if it's over 5 seconds, make it slightly more than average
      ideal_divisor = (average*1.5) / ideal_steps
    parts=(parseInt(i) for i in [0..num] by ideal_divisor)
    parts


) jQuery
