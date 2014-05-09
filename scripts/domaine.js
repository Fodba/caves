//$(window).load(function () {
//    $(".vignette").hoverIntent(function () {
//        var elem = $(this);
//        elem.find(".infosSupa").css("display", "block").css("z-index", "4");
//    })
//    },
//    function () {}
//)

$(window).load(function () {
    $(".vignette").hover(function (event) {

        var elem = $(this).find(".infosSup");
        var photo = $(this);
        elem.position({
            my: 'left',
            at: 'right ',
            of: photo,
            //collision: 'flip',
            within: '.portfolio'
        });
    })
})