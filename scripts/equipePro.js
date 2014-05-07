$(window).load(function () {
    var nombreItem = 3;
    $(".conteneu").css("visibility", "hidden");
    $(".detailMembre").css("display", "none");


    var sliderId; // Id du bloc affiché à l'écran. Correspond au département.

    var owl = new Array();

    var pos = 0; // position du slider par rapport au viewport.
    var positionWrapper = 0; // indique le nombre de déplacement du slider depuis l'item 0
    
    /// on gère le click sur les boutons de filtre.

    $(".filtre").click(function () {
        $(".conteneu").find(".typeSlider").css("display", "none");
        sliderId = $(".typeSlider").attr("id");
        //$(".detailMembre").css("display", "none");
        var elem = $(this);
        $(".conteneu").css("visibility", "visible");
        $(".conteneu").find(".typeSlider").css("display", "block");

        if (sliderId.replace("Pro", "") == "Professionnel") {
            var item = $("#membreImportant").find(".zoneMembre");
            $("#membreImportant").find(".detailleMembre").position({
                my: "left",
                at: "right",
                of: item,
                within: item.parent()
            })
        }

        jQuery.each($("#" + sliderId).find(".cont"), function () {
            var elem = $(this);
            var abc = elem.find(".als-item").length;
            var sliderPrevId = elem.attr("id").replace("slider_", "prev_");
            var sliderNextId = elem.attr("id").replace("slider_", "next_");

            if (abc - nombreItem <= 0) {
                $("#" + sliderPrevId).css("display", "none");
                $("#" + sliderNextId).css("display", "none");
            }
            else if (abc - nombreItem > 0) {
                $("#" + sliderPrevId).css("display", "block");
                $("#" + sliderNextId).css("display", "block");
            }

        })

        $(".cont").owlCarousel({
            itemsScaleUp: true,
            itemsDesktop: [1700, 3],
            itemsDesktopSmall: [1399, 2],
            responsive: true,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            mouseDrag: false,
            touchDrag: false,
            items: nombreItem
        });
    });


    $(".slider-prev").click(function () {
        if (!sens200) {
            var elem = $(this);
            var sliderCible = elem.parent().find(".owl-carousel");
            owl = sliderCible.data("owlCarousel");
            pos = elem.parent().find(".owl-wrapper").position().left;
            if (pos == 0) {
                positionWrapper = (($("." + sliderId).find(".als-item").length) - nombreItem) + 1;
                positionWrapper--;
            }
            else {
                positionWrapper--;
            }
            owl.prev();
        }
    })

    $(".slider-next").click(function () {
        if (!sens200) {
            var elem = $(this);
            var sliderCible = elem.parent().find(".owl-carousel");
            owl = sliderCible.data("owlCarousel");
            pos = elem.parent().find(".owl-wrapper").position().left;
            if (pos == 0) {
                positionWrapper = 0;
                positionWrapper++;
            }
            else if ((positionWrapper + nombreItem == $("." + sliderId).find(".als-item").length)) {
                positionWrapper = 0;
            }
            else {
                positionWrapper++;
            }
            owl.next();
        }
    })


    var sens200 = false; //indique si un element est selectionné ou non.
    var sens400; // definit si la position du wrapper est à 0 ou si elle est négative.


    /// gestion de l'affichage du détail pour le click sur un membre professionnel

    var taille; // stocke la taille du viewport owlCarousel.
    var taille5; // stocke la taille d'un owl-item.
    var taille2; // stocke la taille de l'element actuel.
    var deplacement; // indique le deplacement en px.
    var positionWrapp; // stocke la position du owl-wrapper au moment du click.


    /// on gère le click sur l'un des items du slider.

    $(".zoneMembre").click(function () {
        var elem = $(this);
        var parent = elem.parent();
        var position1; // stocke la position du owl-item au moment du click.
        var elemId = elem.attr("id").replace("membre_", "detail_").toString();
        taille = elem.closest(".owl-carousel").css("width").replace("px", "");
        var tailleInfo = taille - taille2;
        position1 = elem.position().left;
        var numeroItem = parent.attr("id").replace("item_", "");
        var num = numeroItem.substring(1);


        /// on gère le cas où le détail est déjà affiché

        if ($("#" + elemId).css("display") == "block") {
            sens200 = false;
            parent.parent().css("width", taille2);
            $("#" + elemId).css("display", "none");

            /// on gère le deplacement du slider pour que la photo revienne à sa position de départ.

            elem.closest(".owl-wrapper").css("left", "0px");
        }

            /// on gère le cas où aucun détail n'est affiché.

        else {
            //alert("Item N°: " + numeroItem + "\nPosition dans le viewport: " + num);
            sens200 = true;
            positionWrapp = elem.closest(".owl-wrapper").position().left;
            $("#" + elemId).css("display", "block");

            taille2 = parent.parent().css("width").replace("px", "");
            taille5 = elem.closest(".owl-item").css("width").replace("px", "");

            parent.find("#" + elemId).css("display", "block");
            parent.find("#" + elemId).css("visibility", "visible");

            parent.find("#" + elemId).position({
                my: "left",
                at: "right",
                of: elem,
                within: parent
            })
            parent.parent().css("width", taille);

            /// on gère le deplacement du slider pour que la photo s'affiche à gauche du viewport.

            var temp = num - positionWrapper;
            var deplacement = temp * taille5;
            elem.closest(".owl-wrapper").css("left", "-" + deplacement + "px");

        }
    })



    var nombreDeplacement = 0;
    if (nombreDeplacement == 0) {
        $(".flecheHaut").css("display", "none");
    }

    $(".flecheBas").click(function () {
        var elem = $(this).parent();
        var position = elem.parent().find(".viewportEquipe").position().top;
        var nombreService = elem.parent().find(".itemService").length;
        if (nombreService - nombreDeplacement <= 4) {
            $(".flecheBas").css("display", "none");
        }
        else {
            $(".flecheBas").css("display", "block");
        }
        if (nombreService - nombreDeplacement == 3) {
            nombreDeplacement = 0;
        }
        else {
            nombreDeplacement++;
        }
            var taille = parseInt(elem.parent().find(".itemService").css("height")) + 14;
        var posi = taille * nombreDeplacement;
        $(".viewportEquipe").css("top", "-" + posi + "px");
        $(".flecheHaut").css("display", "block");
    })
    $(".flecheHaut").click(function () {
        var elem = $(this).parent();
        var position = elem.parent().find(".viewportEquipe").position().top;
        var nombreService = elem.parent().find(".itemService").length;
        if (nombreDeplacement == 1) {
            $(".flecheHaut").css("display", "none");
        }
        else {
            $(".flecheHaut").css("display", "block");
        }
        if (position == 0) {
            nombreDeplacement = nombreService - 3;
        }
        else {
            nombreDeplacement--;
        }
        var taille = parseInt(elem.parent().find(".itemService").css("height")) + 14;
        var posi = taille * nombreDeplacement;
        $(".viewportEquipe").css("top", "-" + posi + "px");
        $(".flecheBas").css("display", "block");
    })









})

