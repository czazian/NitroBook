<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="AssignmentWAD.Order.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="cart.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Start of Shopping Cart-->

    <div class="cartitems-container">

        <div class="cart-title">
            My Cart
        </div>
        <div class="cart-subtitle">
            Spend RM200 to obtain a free delivery for all regions in Malaysia.
        </div>

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





                <!--CONTENT-->
                <tr class="content">
                    <!--Book Image-->
                    <td style="padding: 10px;">
                        <asp:ImageButton ImageUrl="~/image/book/book12.jpg" runat="server" ID="imgBook" OnClick="imgBook_Click" Width="180" Height="280" />
                    </td>

                    <!--Author and Book title and price-->
                    <td class="listing">
                        <asp:Label CssClass="t1" runat="server" ID="lblTitle" Text="Makoto Shinkai" />
                        <asp:Label CssClass="t2" runat="server" ID="lblAuthor" Text="Suzume" />
                        <asp:Label CssClass="t3 price" runat="server" ID="lblPrice" Text="RM 60.00" />
                    </td>

                    <!--Quantity-->
                    <td class="input-container" style="text-align: center;">
                        <div class="qtyContainer" style="font-size: 1.05em">
                            <asp:Label runat="server" ID="lblCurrentQty" Text="1" />
                        </div>
                    </td>

                    <!--dustbin-->
                    <td class="dus">

                        <!---->
                        <asp:LinkButton OnClientClick="return false;" CssClass="btn" data-bs-toggle="modal" data-bs-target="#deleteConfirmation" ID="lnBtnDustbin" runat="server">
                            <svg class="icon-trash" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 40" width="40" height="40">
                              <path class="trash-lid" fill-rule="evenodd" d="M6 15l4 0 0-3 8 0 0 3 4 0 0 2 -16 0zM12 14l4 0 0 1 -4 0z" />
                              <path class="trash-can" d="M8 17h2v9h8v-9h2v9a2 2 0 0 1-2 2h-8a2 2 0 0 1-2-2z" />
                            </svg>
                        </asp:LinkButton>

                        <div class="modal fade" id="deleteConfirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <span>Delete Item</span>
                                        <asp:LinkButton Style="background-color: transparent; border: none; color: coral; font-size: 1.5rem; text-decoration: none;" runat="server" ID="btnCloseModal" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </asp:LinkButton> 
                                    </div>
                                    <div class="modal-body">
                                        Are you sure to delete this item?
                                    </div>
                                    <div class="modal-footer d-flex align-items-center justify-content-center">
                                        <asp:Button runat="server" ID="btnCancel" class="btn btn-primary" data-dismiss="modal" Text="Cancel"/>
                                        <asp:Button runat="server" ID="btnDelete" class="btn btn-danger" data-dismiss="modal" Text="Delete"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---->


    <%--                    <asp:LinkButton ID="lnBtnDustbin" runat="server">
                            <svg class="icon-trash" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 28 40" width="40" height="40">
                              <path class="trash-lid" fill-rule="evenodd" d="M6 15l4 0 0-3 8 0 0 3 4 0 0 2 -16 0zM12 14l4 0 0 1 -4 0z" />
                              <path class="trash-can" d="M8 17h2v9h8v-9h2v9a2 2 0 0 1-2 2h-8a2 2 0 0 1-2-2z" />
                            </svg>
                        </asp:LinkButton>--%>
                    </td>

                    <!--Total-->
                    <td class="total" id="oTotal" style="text-align: right;">
                        <asp:Label runat="server" ID="lblTotal" Text="RM 60.00" />
                    </td>
                </tr>

                <!--END CONTENT-->

            </table>


            <div class="overall-payment">
                <div colspan="5" class="amount-container">
                    <div id="payment-title">
                        Total : RM
                    </div>
                    <div class="amount" id="amount">
                        <asp:Label runat="server" ID="lblAmount" Text="60.00" />
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
    </div>

    <!--End of Shopping Cart-->
</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
    <script type="text/javascript" src="../Product/cart.js"></script>
    <script type="text/javascript">
        const myModal = document.getElementById('myModal')
        const myInput = document.getElementById('myInput')

        myModal.addEventListener('shown.bs.modal', () => {
            myInput.focus()
        })
    </script>
</asp:Content>
