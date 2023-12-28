
$(document).ready(function () {

    var quantitiy = 0;
    $('.quantity-right-plus').click(function (e) {

        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('.quantity').val());

        $('.quantity').val(quantity + 1);

    });

    $('.quantity-left-minus').click(function (e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        var quantity = parseInt($('.quantity').val());

        if (quantity > 1) {
            $('.quantity').val(quantity - 1);
        }
    });

    var availableQty = document.getElementById('<%= hdnAvailableQty.ClientID %>').val();
    //var currentQty = document.getElementById('<%= txtQuantity.ClientID%>').val();

    alert(currentQty + " " + availableQty)
    if (currentQty + 1 >= availableQty) {
        document.getElementById('<%= txtQuantity.ClientID %>').value = availableQty;
    } 

});