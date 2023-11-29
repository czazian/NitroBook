$(".method").change(function () {
    var option = $(".method").val();

    if (option == 2 || option == 3)
        $(".cardOnly").css("display", "flex");
    else
        $(".cardOnly").css("display", "none");


    //Summary
    if (option == 1)
        $(".displayMethod").text("Cash");
    else if (option == 2)
        $(".displayMethod").text("Debit Card");
    else
        $(".displayMethod").text("Credit Card");

});


$(".getAddress").change(function () {
    var address = $(".getAddress").val();
    $(".displayAddress").text(address);
})

$(".getCardType").change(function () {
    var cardTypeValue = $(".getCardType").val();
    var paymentMethodValue = $(".method").val();

    if (paymentMethodValue == 2 && cardTypeValue == 1) {
        $(".displayMethod").text("Debit Card - Visa");
    } else if (paymentMethodValue == 2 && cardTypeValue == 2) {
        $(".displayMethod").text("Debit Card - Master");
    } else if (paymentMethodValue == 3 && cardTypeValue == 1) {
        $(".displayMethod").text("Credit Card - Visa");
    } else if (paymentMethodValue == 3 && cardTypeValue == 2) {
        $(".displayMethod").text("Credit Card - Master");
    }
})