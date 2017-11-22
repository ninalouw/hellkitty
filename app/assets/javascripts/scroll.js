$(function () {
    // back to top scrolling
    $('.back-to-top').click(function () {
        smoothScrollToTarget($('body'));
    });

    $('.btn-scroll').click(function(){
        $this = $(this);
        var category = $this.data('category');
        smoothScrollToTarget($('.line-header[data-category="' + category + '"]'));
    });

    $(window).scroll(function () {
        //  scrolling function
        var $this = $(this);
        var wScroll = $this.scrollTop();

        if (wScroll > 500) {
            $('.back-to-top').removeClass('hidden');
        } else {
            $('.back-to-top').addClass('hidden');
        }
    });

    function smoothScrollToTarget(target) {
        var startY = $(window).scrollTop();
        var stopY = target.offset().top;
        var distance = stopY > startY ? stopY - startY : startY - stopY;

        if (distance < 100) {
            scrollTo(0, stopY);
            return;
        }

        var speed = Math.round(distance / 100);

        if (speed >= 20) speed = 20;
        var step = Math.round(distance / 25);
        var leapY = stopY > startY ? startY + step : startY - step;
        var timer = 0;


        if (stopY > startY) {
            for (var i = startY; i < stopY; i += step) {
                setTimeout("window.scrollTo(0, " + leapY + ")", timer * speed);
                leapY += step; if (leapY > stopY) leapY = stopY; timer++;
            }
            return;
        }
        for (var i = startY; i > stopY; i -= step) {
            setTimeout("window.scrollTo(0, " + leapY + ")", timer * speed);
            leapY -= step; if (leapY < stopY) leapY = stopY; timer++;
        }

        return false;
    }
});