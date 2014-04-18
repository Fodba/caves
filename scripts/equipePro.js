$(window).load(function () {
    $(".conteneu").css("visibility", "hidden");
    $(".cont").find(".detailMembre").css("display", "none");


    /// on gère le click sur les boutons de filtre.
    $(".filtre").click(function () {
        var elem = $(this);
        $(".conteneu").css("visibility", "visible");
        if (elem.attr("id") == "filtreParticuliers") {
            if (!($("#" + id).css("display") == "block")) {
                $("#membresPro").find(".detailMembre").css("display", "none");
                $("#membresPro").hide();
                $("#membresPart").show();
            }
        }
        else if (elem.attr("id") == "filtreProfessionnels") {
            $("#membresPart").find(".detailMembre").css("display", "none");
            $("#membresPart").hide();
            $("#membresPro").show();
        }
    });


    $(".owl-carousel").owlCarousel({
        itemsScaleUp: true,
        itemsDesktop: [1700, 3],
        itemsDesktopSmall: [1399, 2],
        responsive: true,
        responsiveRefreshRate: 200,
        responsiveBaseWidth: window,
        items: 3
    });
    var owl2 = $("#viewportPro.owl-carousel").data("owlCarousel");
    var owl1 = $("#wrapperPart.owl-carousel").data("owlCarousel");


    var sens200 = false; //indique si un element est selectionné ou non.
    var sens400; // definit si la position du wrapper est à 0 ou si elle est négative.
    var PosInit; // position initial du wrapper au moment du click sur un membre.
    var ItemInit = 1; // entier indiquant le numéro de l'item en première position visible dans le slider.


    $(".slider-prev").click(function () {
        var elem = $(this);
        if (elem.closest(".typeSlider").attr("id") == "membresPart") {
            owl1.prev();
        }
        else {
            if (!sens200) {
                owl2.prev();
            }
            sens400 = parseInt($("#membresPro").find(".owl-wrapper").position().left);
            PosInit = parseInt($("#membresPro").find(".owl-wrapper").position().left);
        }
    })

    $(".slider-next").click(function () {
        var elem = $(this);
        if (elem.closest(".typeSlider").attr("id") == "membresPart") {
            owl1.next();
        }
        else if (elem.closest(".typeSlider").attr("id") == "membresPro") {
            if (!sens200) {
                owl2.next();
            }
            sens400 = parseInt($("#membresPro").closest(".owl-wrapper").position().left);
            PosInit = parseInt($("#membresPro").closest(".owl-wrapper").position().left);
        }
    })


    /// gestion de l'affichage du détail pour le click sur un membre professionnel
        var id = 0;
    var taille5; // stocke la taille d'un owl-item.
    var taille2; // stocke la taille de l'element actuel.
    var deplacement; // indique le deplacement en px.

    /// on gère le click sur l'un des items du slider.
    $("#membresPro").find(".zoneMembre").click(function () {
        var elem = $(this);
        var parent = elem.parent();
        var position1; // stocke la position du owl-item au moment du click.
        var elemId = elem.attr("id").replace("membre_", "detail_").toString();
        id = elem.attr("id").replace("membre_", "detail_").toString();


        position1 = parent.position().left;
        sens400 = elem.closest(".owl-wrapper").position().left;
        var taille = $("#viewportPro").css("width").replace("px","");
        var taille1 = elem.closest("#viewportPro").css("width").replace("px", "");
        taille2 = elem.css("width").replace("px", "");
        var tailleInfo = taille1 - taille2;
       
        /// on gère le cas où le détail est déjà affiché
        if ($("#" + id).css("display") == "block") {

            position1 = elem.parent().position().left;
            elem.parent().find("#" + id).css("display", "none");
            parent.parent().css("width", taille5);

            if (bowser["name"] == "Internet Explorer") {
                elem.closest(".owl-wrapper").css("left", PosInit + "px");
                sens200 = false;
            }
            else {
                elem.closest(".owl-wrapper").css("left", total + "px");
                sens200 = false;
            }
            
        }

        /// on gère le cas où aucun détail n'est affiché.
        else {
            PosInit = parseInt(elem.closest(".owl-wrapper").position().left);
            taille5 = $(this).closest(".owl-item").css("width").toString();
            parent.find("#" + id).css("display", "block");
            parent.find("#" + id).css("visibility", "visible");
            parent.find("#" + id).css("width", tailleInfo);
            sens200 = true;
            parent.find("#" + id).position({
                my: "left",
                at: "right",
                of: elem,
                within: elem.parent()
            })

            var total = parseInt(position1) - parseInt(sens400);
            if (total > taille) {
                total = (total - taille) * 2;
            }
            parent.parent().css("width", taille);
            
            if (bowser["name"]=="Internet Explorer") {
                elem.closest(".owl-wrapper").css("left", "-" + position1 + "px");
                deplacement = parseInt(position1);
            }
            else {
                elem.closest(".owl-wrapper").css("left", "-" + total + "px");
                deplacement = parseInt(total);
            }
        }

    })
})

