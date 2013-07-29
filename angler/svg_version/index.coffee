$ ->
  o=
    angle:50
    width:200
    overlap:30
    border:85
    topics:[
        image:"https://www.googleapis.com/freebase/v1/image/en/toronto?mode=fillcropmid&maxwidth=300&maxheight=300"
        name:"toronto"
      ,
        image:"https://www.googleapis.com/freebase/v1/image/en/vancouver?mode=fillcropmid&maxwidth=300&maxheight=300"
        name:"vancouver"
    ]
  $("#result").html(HAML.angler(o))

  square=(w)->
    """
      m 0 0
      l #{w} 0
      l 0 #{w}
      l #{-w} 0
      z
    """

  polygon=(w, angle, overlap)->
    """
      m #{(w - overlap)} 0
      l #{w} 0
      l 0 #{w}
      l #{(  -1 * (overlap * (-1*(angle/100))) - w  ) } 0
      z
    """