(($) ->

  shuffle = (a) ->
    for i in [a.length-1..1]
      j = Math.floor Math.random() * (i + 1)
      [a[i], a[j]] = [a[j], a[i]]
    a


  $.chaperone = (count=10, max=10, min_distance=1) ->
    random=(max)->
      Math.floor(Math.random()*max)
    last= 0
    [0...count].map (i) ->
      for x in [0...max]#try a lot, but don't infloop
        r= random(max)
        unless last <=r+min_distance && last>r-min_distance
          last=r
          return r
      random(max)#fallback


  $.socialist = (count=10, max=10) ->
    shuffled=(max)->
      shuffle [0...max]
    all = []
    [0...(count/max)].map (i) ->
      for x in [0...max]#try a lot, but don't infloop
        arr= shuffled(max).slice(0,max)
        all= all.concat arr
        if all.length>=count
          return all
    all


) jQuery


