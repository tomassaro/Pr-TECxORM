$(document).ready(function() {

    //    **************     CART
    $('#header_chart').append( $('#cart_block'));

    var header_cart_timeout;

    $('#header_chart').hover(
        function() {
            clearTimeout(header_cart_timeout);
            $('#cart_block').stop().animate({
                'height': $('#cart_block .block_content').height() +5,
                'opacity': 1
            })
        },
        function() {
            header_cart_timeout = setTimeout("$('#cart_block').animate({'height': '0px', 'opacity': 0.2})", 350);
        }
        )

    //    **************     SCROLL FIX

    $(window).scroll(function () {
        if ($(window).scrollTop() > 222){
            $("#header_nav").css({
                "position": "fixed",
                "top": 0
            })
        } else {
             $("#header_nav").css({
                "position": "relative",
                "top": 'auto'
            })
        }
    });
});