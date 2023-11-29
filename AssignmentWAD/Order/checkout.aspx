<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="AssignmentWAD.Order.checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
        integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="../style/reset.css" rel="stylesheet" />
    <link href="checkout.css" rel="stylesheet" />
    <link rel="icon" type="image/x-icon" href="~/image/window-logo.png" />
    <title>Checkout</title>

</head>
<body>
    <form id="form1" runat="server" class="needs-validation was-validated" novalidate="">
        <!--Header-->
        <div class="checkout-title">
            <div class="back-btn">
                <asp:LinkButton runat="server" ID="btnBack" CssClass="back" OnClientClick="JavaScript:window:history.back(); return false" Style="margin-left: 25px; font-size: 22px;">
                    <p style="height : 50px; width: 50px; margin-left: 25px;">
                    <i class="fa fa-chevron-left ic" aria-hidden="true" style="margin-left: -15px; margin-top: 5px;"></i>
                    </p>
                </asp:LinkButton>
            </div>
            <div class="inner-title">
                Order Checkout
            </div>
        </div>

        <!--Shipping information-->
        <div class="shipping-container">
            <div class="s-outer-title">
                Shipphing Details
            </div>
            <div class="shipping-input">
                <div class="shipping-title">
                    <div class="t-ship">
                        Shipping Address
                    </div>
                </div>
                <div class="address-container">
                    <asp:TextBox TextMode="MultiLine" CssClass="form-control getAddress" Columns="30" Rows="30" ID="txtAddress" runat="server" required=""></asp:TextBox>
                    <div class="valid-feedback" style="text-align: right;" bis_skin_checked="1">
                        Looks great!
                    </div>
                    <div class="invalid-feedback" style="text-align: right;" bis_skin_checked="1">
                        Please enter your shipping address before proceeding.
                    </div>
                </div>

                <div class="map">
                </div>


            </div>
        </div>

        <!--Customer Information-->
        <div class="customerinfo-container">
            <div class="s-outer-title2">
                Customer Information
            </div>
            <div class="customer-input">
                <div class="name">
                    <div class="t-name">
                        Customer Name
                    </div>
                    <div class="mb-4 mt-3">
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtName" required="" />
                        <div class="valid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Looks great!
                        </div>
                        <div class="invalid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Please enter your name before proceeding.
                        </div>
                    </div>
                </div>

                <div class="phone">
                    <div class="t-phone">
                        Phone Number
                    </div>
                    <div class="mb-4 mt-3">
                        <asp:TextBox TextMode="Phone" CssClass="form-control" runat="server" ID="txtPhone" required="" />
                        <div class="valid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Looks great!
                        </div>
                        <div class="invalid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Please enter your phone number with correct format before proceeding.
                        </div>
                    </div>
                </div>

                <div class="email">
                    <div class="t-email">
                        Email Address
                    </div>
                    <div class="mb-1 mt-3">
                        <asp:TextBox TextMode="Email" CssClass="form-control" runat="server" ID="txtEmail" required="" />
                        <div class="valid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Looks great!
                        </div>
                        <div class="invalid-feedback" style="text-align: right;" bis_skin_checked="1" required="">
                            Please enter your email address with correct format before proceeding.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Order items-->
        <div class="order-container">
            <div class="s-outer-title2">
                Order items
            </div>

            <div class="order-input">
                <table>


                    <!--CONTENT-->
                    <tr class="content">
                        <!--Book Image-->
                        <td style="padding: 10px; width: 20%;">
                            <asp:ImageButton ImageUrl="~/image/book1.jpg" runat="server" ID="imgBook" Width="180" Height="280" />
                        </td>

                        <!--Author and Book title and price-->
                        <td class="listing" style="width: 30%;">
                            <asp:Label CssClass="t1" runat="server" ID="lblTitle" Text="Makoto Shinkai" />
                            <asp:Label CssClass="t2" runat="server" ID="lblAuthor" Text="Suzume" />
                            <asp:Label CssClass="t3 price" runat="server" ID="lblPrice" Text="RM 60.00" />
                        </td>

                        <!--Quantity-->
                        <td class="input-container" style="text-align: center; width: 25%;">
                            <div class="input">
                                QTY : &nbsp;<b><asp:Label runat="server" ID="lblQty" Text="1" /></b>
                            </div>
                        </td>

                        <!--Total-->
                        <td class="total" id="oTotal" style="text-align: right; width: 25%;">
                            <b>RM &nbsp;<asp:Label runat="server" ID="lblTotal" Text="20.00" /></b>
                        </td>
                    </tr>

                    <!--END CONTENT-->


                </table>

                <div class="overall">
                    <div colspan="5" class="amount-container">
                        <div id="payment-title">
                            Total : RM 
                        </div>
                        <div class="amount" id="amount">
                            <asp:Label runat="server" ID="lblOverallTotal" Text="20.00" />
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--Payment-->
        <div class="payment-container">
            <div class="s-outer-title2">
                Payment Methods
            </div>

            <div class="payment-input">
                <div class="payment-title">
                    Please select one payment method.
                </div>
                <div class="input-group mb-3 mt-3">
                    <label class="input-group-text" for="inputGroupSelect01">Payment Methods</label>
                    <asp:DropDownList CssClass="form-select method" ID="ddlPaymentMethod" runat="server">
                        <asp:ListItem Selected="True" Value="1">Cash</asp:ListItem>
                        <asp:ListItem Value="2">Debit Card</asp:ListItem>
                        <asp:ListItem Value="3">Credit Card</asp:ListItem>
                    </asp:DropDownList>
                </div>


                <div runat="server" id="cardtype" class="input-group mb-3 mt-3 cardOnly">
                    <label class="input-group-text" for="inputGroupSelect01">Type of Card</label>
                    <asp:DropDownList ID="ddlCardType" runat="server" CssClass="form-select getCardType">
                        <asp:ListItem Selected="True" Value="1">Visa Card</asp:ListItem>
                        <asp:ListItem Value="2">Master Card</asp:ListItem>
                    </asp:DropDownList>

                    <div class="input-group mb-3 mt-3">
                        <span class="input-group-text inputGroup-sizing-default">16-digits Card No.</span>
                        <asp:TextBox required="" pattern="[0-9]{16}" runat="server" ID="txtCardNo" onkeypress="return this.value.length<16" CssClass="noSpinners form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"></asp:TextBox>
                        <div class="valid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Looks great!
                        </div>
                        <div class="invalid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Please enter 16 digits card number with correct format.
                        </div>
                    </div>


                    <div class="input-group mb-3 col-lg-2">
                        <span class="input-group-text">Expiration Date</span>
                        <asp:TextBox required="" runat="server" ID="txtFront" CssClass="bd form-control" onkeypress="return this.value.length<5" />
                        <div class="valid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Looks great!
                        </div>
                        <div class="invalid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Please enter your expiration date with correct format.
                        </div>
                    </div>


                    <div class="input-group">
                        <span class="input-group-text">CCV/Security Code</span>
                        <asp:TextBox required="" pattern="[0-9]{3}" runat="server" ID="txtCCV" onkeypress="return this.value.length<3" class="form-control" aria-label="Sizing example input"
                            aria-describedby="inputGroup-sizing-default" />
                        <div class="valid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Looks great!
                        </div>
                        <div class="invalid-feedback" style="text-align: right;" bis_skin_checked="1">
                            Please enter your 3 digits CCV/Security Code with correct format.
                        </div>
                    </div>
                </div>

            </div>
        </div>


        <!--Summary-->
        <div class="summary-container">
            <div class="s-outer-title" style="margin-bottom: 10px;">
                Order Summary
            </div>

            <div class="summary-input container-fluid">
                <div class="display">
                    <div class="title">
                        Shipping Summary
                    </div>
                    <div class="shippingsum-address">
                        <asp:Label ID="lblOrderAddress" CssClass="displayAddress" runat="server" />
                    </div>
                </div>
                <div class="display">
                    <div class="title">
                        Payment Method
                    </div>
                    <div class="paymentsum-method">
                        <asp:Label ID="lblPaymentMethod" CssClass="displayMethod" runat="server" />
                    </div>
                </div>
                <div class="display">
                    <div class="title">
                        Shipping Fee
                    </div>
                    <div class="shipping-amount">
                        <asp:Label ID="lblShippingAmount" runat="server" Text="RM25.00" />
                    </div>
                </div>
                <div class="display">
                    <div class="title">
                        Discount
                    </div>
                    <div class="discount-amount">
                        <asp:Label ID="lblDeliveryAmount" runat="server" Text="RM20.00" />
                    </div>
                </div>
                <div class="display">
                    <div class="title">
                        Tax
                    </div>
                    <div class="tax-amount">
                        <asp:Label ID="lblTaxAmount" runat="server" Text="RM9.20" />
                    </div>
                </div>
                <div class="display">
                    <div class="title">
                        Overall Payment
                    </div>
                    <div class="overal-amount">
                        <asp:Label ID="lblOverallTotalPayment" runat="server" Text="RM74.2" />
                    </div>
                </div>
            </div>
        </div>

        <!--Submit-->
        <div class="btn-container mb-3">
            <div>
                <asp:LinkButton PostBackUrl="~/Order/completeOrder.aspx" ID="btnSubmitOdr" runat="server" CssClass="cta" Text="Place Order">
                    <span>Place Order</span>
                    <svg width="13px" height="10px" style="margin-top : -5px;" viewBox="0 0 13 10">
                        <path d="M1,5 L11,5"></path>
                        <polyline points="8 1 12 5 8 9"></polyline>
                    </svg>
                </asp:LinkButton>
            </div>
        </div>



    </form>
    <script src="checkout.js" type="text/javascript"></script>

</body>
</html>
