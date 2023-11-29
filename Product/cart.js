
$(document).ready(function () {

    var quantitiy = 0;
    $('.in').click(function (e) {

        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('.num').val());

        $('.num').val(quantity + 1);

    });

    $('.de').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('.num').val());

        if (quantity > 1) {
            $('.num').val(quantity - 1);
        }
    });

});