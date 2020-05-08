$(function() {

    $(".dropdown-icon").on("click", function() {
        $(".fa-angle-down").toggleClass("flip");
        $(".fa-angle-down").css("transition", "all ease .5s");
    });

});