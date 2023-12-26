<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="AssignmentWAD.Order.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="cart.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!--Remove the Query String after it is obtained, to avoid keep adding item-->
    <script>
        $(document).ready(function () {
            history.pushState(null, "", location.href.split("?")[0]);

            //Disabled the checkout and total amount if the cart is empty
            var qty = document.getElementById('<%= lblAmount.ClientID %>').innerHTML;
            var checkout = document.getElementById('checkout');
            var amount = document.getElementById('overall-payment');

            if (qty > 0) {
                checkout.style.display = "flex";
                amount.style.display = "flex";
            } else {
                checkout.style.display = "none";
                amount.style.display = "none";
            }

        })
    </script>


    <% 
        //Obtain shopping cart
        AssignmentWAD.ShoppingCart shoppingCart = (AssignmentWAD.ShoppingCart)Session["shoppingCart"];

        if (shoppingCart == null)
        {
            shoppingCart = new AssignmentWAD.ShoppingCart();
            Session["shoppingCart"] = shoppingCart;
        }

        List<AssignmentWAD.Cart> books = shoppingCart.getCartItems();

        if (books.Count == 0)
        {
            lblEmptyCart.Text = "Cart is empty. Kindly add an item and come back again!";
        }
    %>

    <!--Start of Shopping Cart-->
    <div class="cartitems-container">

        <div class="cart-title">
            My Cart
        </div>
        <div class="cart-subtitle">
            Spend RM200 to obtain a free delivery for all regions in Malaysia.
        </div>


        <!--Start of cart content-->

        <div class="cart-contents">

            <table style="border-collapse: collapse">

                <!--HEADER-->
                <tr class="titles">
                    <th class="title-image">Product
                    </th>
                    <th class="title-product"></th>
                    <th class="title-quantity">Quantity
                    </th>
                    <th class="title-dustbin"></th>
                    <th class="title-total">Total
                    </th>
                </tr>

                <asp:Repeater runat="server" ID="BookRepeater" OnItemDataBound="BookRepeater_ItemDataBound">

                    <ItemTemplate>

                        <tr class="content">
                            <!--Book Image-->
                            <td style="padding: 10px;">
                                <asp:ImageButton runat="server" ImageUrl='<%# Eval("image") %>' ID="imgBook" Width="180" Height="280" OnCommand="imgBook_Command" CommandArgument='<%# Eval("bookID") %>' />
                            </td>

                            <!--Author and Book title and price-->
                            <td class="listing">
                                <asp:Label CssClass="t1" runat="server" ID="lblAuthor" Text='<%# Eval("author") %>' />
                                <asp:Label CssClass="t2" runat="server" ID="lblTitle" Text='<%# Eval("title") %>' />
                                <asp:Label CssClass="t3 price" runat="server" ID="lblPrice" Text='<%# "RM " + Eval("price") %>' />
                            </td>

                            <!--Quantity-->
                            <td class="input-container" style="text-align: center;">
                                <div class="qtyContainer" style="font-size: 1.05em">
                                    <asp:Label runat="server" ID="lblCurrentQty" Text='<%# Eval("selectedQuantity") %>' />
                                </div>
                            </td>

                            <!--dustbin-->
                            <td class="dus">


                                <div>
                                    <asp:LinkButton CommandArgument='<%# Eval("bookID") %>' OnClick="btnDelete_Click" runat="server" ID="btnDelete" class="example btn" OnClientClick="return confirm('Are you sure you want to delete this item ?')">
                                        <svg class="icon-trash" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 40" width="40" height="40">
                                            <path class="trash-lid" fill-rule="evenodd" d="M6 15l4 0 0-3 8 0 0 3 4 0 0 2 -16 0zM12 14l4 0 0 1 -4 0z" />
                                            <path class="trash-can" d="M8 17h2v9h8v-9h2v9a2 2 0 0 1-2 2h-8a2 2 0 0 1-2-2z" />
                                        </svg>
                                    </asp:LinkButton>


                                </div>



                            </td>



                            <!--Total-->
                            <td class="total" id="oTotal" style="text-align: right;">
                                <asp:Label runat="server" ID="lblTotal" Text="RM 60.00" />
                            </td>
                        </tr>

                    </ItemTemplate>

                </asp:Repeater>

                <!--End of Cart Content-->

            </table>


            <!--If cart is empty-->
            <div style="text-align: center; width: 100%; padding: 10px; margin-top: 15px;">
                <asp:Label ID="lblEmptyCart" runat="server" Style="color: crimson; font-size: 1.2rem; font-weight: bold; text-align: center;"></asp:Label>
            </div>

            <div class="overall-payment" id="overall-payment">
                <div colspan="5" class="amount-container">
                    <div id="payment-title">
                        Total : RM
                    </div>
                    <div class="amount" id="amount">
                        <asp:Label runat="server" ID="lblAmount" Text="9" />
                    </div>
                </div>



                <div class="checkout" id="checkout" colspan="5" style="margin-top: 40px;">
                    <asp:LinkButton runat="server" ID="btnCheckot" CssClass="cta" PostBackUrl="~/Order/checkout.aspx">
                        <span>Checkout</span>
                        <svg width="13px" height="10px" style="margin-top : -5px;" viewBox="0 0 13 10">
                            <path d="M1,5 L11,5"></path>
                            <polyline points="8 1 12 5 8 9"></polyline>
                        </svg>
                    </asp:LinkButton>
                </div>
            </div>

        </div>

        <!--End of Shopping Cart-->
</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
    <script type="text/javascript" src="../Product/cart.js"></script>

</asp:Content>
