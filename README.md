spencer-jquery-plugins
======================

spencer's plugins for jquery

#typed
    $("input").type(callback)

like keyup but it skips the callback during fast-typing


#handsome
    var text="this is a story all about how my life got twist-turned upside-down"
    $("#el").handsome(text)
animates the rendering of the text

#waist
    var text="and sometimes you feel like the sidewalk"
    $("#el").waist(text)
makes the text as large as possible, without wrapping

#greek
    var text="london bridges falling down"
    $("#el").greek(text)
    $("#el").ungreek(text)
swap letters for similar-looking greek symbols