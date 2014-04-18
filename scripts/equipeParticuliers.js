$(window).load(function () {
    if ($(".conteneu").width >= "650px") {
        $("#membrePart").als({
            visible_items: 3,
            circular: "yes",
        });
    };
    $(".descriptifPoste").slimScroll({
        height: "120px",
        width: "290px",
        size: "5px",
        color: "#9b1230",
        distance: "5px",
        wheelStep: 2,
        railVisible: true,
        alwaysVisible: true
    });

    var id;
    var sens200 = false;
    var sens400 = false;
    $(".membreEquipe").click(function () {
        var elem = $(this);
        var parent = elem.parent();
        var position1 = parent.position();
        var actuelId = elem.attr("id").replace("membre_", "detail_");
        if (id != actuelId) {
            if (id != "undefined") {
                $("#" + id).css("display", "none");
                id = elem.attr("id").replace("membre_", "detail_");
            }
            elem.parent().find("#" + id).css("display", "block");
            elem.parent().find("#" + id).position({
                my: "left",
                at: "right",
                of: elem,
                within: parent
            });
            if (position1.left >= 150 && position1.left < 300) {
                elem.closest(".als-wrapper").css("left", "-150px");
                var position = elem.position();
                sens200 = true;
            }
            else if (position1.left >= 300) {
                parent.closest(".als-wrapper").css("left", "-300px");
                sens400 = true;
            }
        }

        else {

            if ($("#" + id).css("display") == "block") {
                elem.parent().find("#" + id).css("display", "none");
                if (sens200 == true) {
                    elem.closest(".als-wrapper").css("left", "0px");
                    sens200 = false;
                }
                else if (sens400 == true) {
                    elem.closest(".als-wrapper").css("left", "0px");
                    sens400 = false;
                }
            }

            else {
                elem.parent().find("#" + id).css("display", "block");
                if (position1.left >= 150 && position1.left < 300) {
                    elem.closest(".als-wrapper").css("left", "-150px");
                    sens200 = true;
                }
                else if (parent.position().left == 300) {
                    parent.closest(".als-wrapper").css("left", "-300px");
                    sens400 = true;
                }
            }
        }
    });
})

