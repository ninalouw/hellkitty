$(function () {
    $("html").bind("mouseleave", function () {
        //call modal
        $('#Modal').show().modal();
        $("html").unbind("mouseleave");
    });
});