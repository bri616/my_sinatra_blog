$(document).ready(function () {

    $(".brand").click(function () {
        $(this).css("background", "url(/robot_logo2.png) no-repeat left center");
    });

    $(this).keypress(function () {
        $(".brand").slideToggle();
    });
});
