$(window).load(function () {
    $(".vignette").hoverIntent(function () {
        var elem = $(this);
        elem.find(".infosSup").css("display", "block").css("z-index", "4");
    })
    },
    function () {}
)