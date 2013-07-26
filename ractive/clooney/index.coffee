$ ->
  side= 300
  data= {
    overlap:100,
    angle:50,
    side:side,
    image1:"https://www.googleapis.com/freebase/v1/image/en/toronto?mode=fillcropmid&maxwidth=#{side}&maxheight=#{side}"
    image2:"https://www.googleapis.com/freebase/v1/image/en/drew_barrymore?mode=fillcropmid&maxwidth=#{side}&maxheight=#{side}"
  }
  data.keys= Object.keys(data)
  window.r = new Ractive({
      el: "#result",
      data: data,
      template: HAML.template()
  });

  con= new Ractive({
      el: "#controls",
      data: {keys:Object.keys(data), data:data},
      template: HAML.control()
  });
