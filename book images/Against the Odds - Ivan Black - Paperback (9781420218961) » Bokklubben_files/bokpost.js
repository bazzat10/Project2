$(function () {
    var bildesrc = $('.js-replaceable').attr('src');
    $('.js-replace-image img').mouseover(function () {
        // alert($(this).attr('src'));
        $('.js-replaceable').attr('src', $(this).attr('src').replace('&width=50', ''));
    });
    $('.js-replace-image img').mouseout(function () {
        $('.js-replaceable').attr('src', bildesrc);
    });
});