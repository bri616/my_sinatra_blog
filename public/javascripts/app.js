$(document).ready(function () {

    $(".brand").click(function () {
        $(this).css("background", "url(/robot_logo2.png) no-repeat left center");
    });

    $(".title").click(function () {
        $(this).css("font-size", (Math.random() *100) + "px");
        $(this).css("color", "blue");
        $(".brand").slideToggle();
    });
});
