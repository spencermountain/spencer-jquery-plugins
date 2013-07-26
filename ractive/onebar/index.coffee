$ ->


  $.fn.bar = (data={}, options={w:300, h:30, delay:0, duration:800, ease:"linear", labels:true}) ->
    stage= $(this)
    window.r= new Ractive({
        el: stage,
        data: data,
        template: HAML.bar({})
    });

  data= [{value:25, title:"good", color:"steelblue"}, {value:75, title:"evil", color:"darkred"}]
  obj= {
     bars:data,
     w:300,
     h:30,
     sum: data.reduce( ((p,v) -> p+(v.value||0) ), 0)
    }
  $("#results").bar(obj)