$(function () {
    $("html").bind("mouseleave", function () {
        //call modal
        $('#Modal').show().modal();
        $("html").unbind("mouseleave");
    });

    // $(".navbar-toggler").click(function () {
    //     //This code is called when navbar-mobile-toggle is clicked
    //     $(this).toggleClass("is-open");
    //     $(".navbar-collapse").toggleClass("is-open");
    // });
});