<%@ Page Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="OrderTracking.aspx.cs" Inherits="AssignmentWAD.Customer.OrderTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="customer.css" />

    <script defer>
        document.addEventListener('DOMContentLoaded', function () {
            // Get the modal element
            var exampleModal = new bootstrap.Modal(document.getElementById('exampleModal'));

            // Add event listener when the modal is about to be shown
            exampleModal.addEventListener('show.bs.modal', function (event) {
                // Button that triggered the modal
                var button = event.relatedTarget;

                // Extract info from data-bs-* attributes
                var recipient = button.getAttribute('data-bs-whatever');

                // Update the modal's content
                var modalTitle = exampleModal._element.querySelector('.modal-title');
                var modalBodyInput = exampleModal._element.querySelector('.modal-body input');

                modalTitle.textContent = 'New message to ' + recipient;
                modalBodyInput.value = recipient;
            });
        });

        function openModal() {
            var exampleModal = new bootstrap.Modal(document.getElementById('exampleModal'));

            // Update the modal's content (optional)
            var modalTitle = exampleModal._element.querySelector('.modal-title');
            var modalBodyInput = exampleModal._element.querySelector('.modal-body input');

            //modalTitle.textContent = 'New message to @getbootstrap';
            //modalBodyInput.value = '@getbootstrap';

            // Show the modal
            exampleModal.show();
        }


        $(function () {

            $(document).on({
                mouseover: function (event) {
                    $(this).find('.far').addClass('star-over');
                    $(this).prevAll().find('.far').addClass('star-over');
                },
                mouseleave: function (event) {
                    $(this).find('.far').removeClass('star-over');
                    $(this).prevAll().find('.far').removeClass('star-over');
                }
            }, '.rate');


            $(document).on('click', '.rate', function () {
                if (!$(this).find('.star').hasClass('rate-active')) {
                    $(this).siblings().find('.star').addClass('far').removeClass('fas rate-active');
                    $(this).find('.star').addClass('rate-active fas').removeClass('far star-over');
                    $(this).prevAll().find('.star').addClass('fas').removeClass('far star-over');
                } else {
                    console.log('has');
                }
            });

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section style="background-color: #eee;">
        <div class="container py-5" style="width: 100%;">

            <div class="row" style="display: flex; justify-content: space-evenly">
                <div class="col-2" style="margin-right: 10px;">
                    <div id="row-profile" style="border-style: solid; border-color: #D0D0D0; border-radius: 2px;">
                        <br />
                        <div id="list-example" class="list-group">
                            <p class="heading" style="font-size: 1.1rem; font-weight: bold; color: #fa6464; margin-left: 5px; font-family: Arial, Helvetica, sans-serif">Profile</p>
                            <hr />
                            <asp:LinkButton ID="lkbAccount" runat="server" CssClass="UserProfileOption" Text="My Account" PostBackUrl="~/Customer/UserProfile.aspx" />
                            <asp:LinkButton ID="lkbMyPurchase" runat="server" CssClass="UserProfileOption" Text="My Purchase" PostBackUrl="~/Customer/OrderTracking.aspx" />
                            <asp:LinkButton ID="lkbLogout" runat="server" CssClass="UserProfileOption" Text="Logout" PostBackUrl="~/Customer/Logout.aspx" />

                        </div>
                    </div>
                </div>


                <div class="col-9">
                    <div id="row-profile" style="display: flex; flex-flow: column nowrap; justify-content: center; border-style: solid; border-color: #D0D0D0; border-radius: 2px;">
                        <div class="row">
                            <h2 class="heading"
                                style="color: crimson; font-size: 1.3rem; font-weight: bold; margin-top: 20px; margin-left: 20px; font-family: Arial, Helvetica, sans-serif">My Purchase</h2>
                        </div>

                        <!--An Order-->
                        <div class="w3-panel w3-border-top">


                            <div class="row" style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
                                <!--Items in a box-->
                                <br />
                                <div class="items-container row">
                                    <asp:Label ID="lblFail" runat="server" Text="" Style="font-weight: bold; color: red; font-size: 20px; margin-top: 15px; margin-bottom: 5px;"></asp:Label>

                                    <asp:SqlDataSource ID="TrackingSource" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT DISTINCT P.PaymentDate AS PaymentDate, P.TotalAmount AS TotalAmount, O.OrderID AS OrderID, O.Status AS OrderStatus, OD.Quantity AS OrderQuantity, B.BookID AS BookID, B.Image AS Image, B.Title AS BookTitle, B.Price AS BookPrice FROM Payment P JOIN [Order] O ON P.OrderID = O.OrderID JOIN [User] U ON O.UserID = U.UserID JOIN OrderDetails OD ON OD.OrderID = O.OrderID JOIN Book B ON OD.BooKID = B.BookID WHERE O.UserID = @userID ORDER BY PaymentDate DESC;">
                                        <SelectParameters>
                                            <asp:Parameter Name="userID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:Repeater ID="OuterRepeater" runat="server" OnItemDataBound="OuterRepeater_ItemDataBound">
                                        <ItemTemplate>
                                            <div style="margin-bottom: 15px">
                                                <div class="top-container" style="width: 100%; display: flex; justify-content: space-between; margin-left: 20px; margin-top: 10px; margin-bottom: 10px;">
                                                    <div class="orderDate" style="color: crimson; font-weight: bold;">
                                                        <i class="far fa-clipboard" style="color: crimson"></i>
                                                        Order Date :
                                            <asp:Label runat="server" ID="lblOrderDate" Text='<%# Bind("PaymentDate", "{0:dd-MM-yyyy}") %>' /><br/><br />
                                                        <i class="fa-solid fa-hashtag"></i>&nbsp;Order ID : <asp:Label runat="server" ID="oID" Text='<%# "MY"+Eval("OrderID") %>' />
                                                    </div>
                                                    <div style="margin-right: 20px;">
                                                        <asp:Label CssClass="shippingStatus" runat="server" ID="lblDeliveryStatus" Text='<%#Eval("OrderStatus") %>' />
                                                    </div>
                                                </div>



                                                <asp:Repeater ID="InnerRepeater" runat="server" OnItemDataBound="InnerRepeater_ItemDataBound">
                                                    <ItemTemplate>
                                                        <div class="an-item">
                                                            <div class="an-item" style="width: 100%; display: flex; flex-flow: row nowrap;">
                                                                <asp:ImageButton PostBackUrl='<%# "~/Product/IndividualProduct.aspx?bookID=" + Eval("bookID") %>' ID="image1" runat="server" ImageUrl='<%#Eval("Image") %>' AlternateText="PurchaseImage" CssClass="bookImage" Style="width: 120px; margin-left: 30px; margin-top: 15px; float: left;" />
                                                                <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; width: 100%; height: 160px; margin-top: 15px; margin-left: 10px; margin-right: 5px;">
                                                                    <div class="PurchaseDetails" style="height: 100px;">
                                                                        <div>
                                                                            <b>
                                                                                <asp:Label runat="server" ID="lblBookName1" Text='<%#Eval("BookTitle")%>' /></b>
                                                                        </div>
                                                                        <div>
                                                                            <asp:Label Style="color: #6c6b6b" ID="lblQty" runat="server" Text='<%# "x" + Eval("OrderQuantity") %>' />
                                                                        </div>
                                                                    </div>
                                                                    <div style="display: flex; flex-flow: column nowrap; justify-content: end;">
                                                                        <%--                                                                        <asp:HiddenField ID="BookPrice" runat="server" Value='<%# Eval("BookPrice") %>' />
                                                                        <asp:HiddenField ID="BookQty" runat="server" Value='<%# Eval("OrderQuantity") %>' />
                                                                        <div class="priceLabel" style="margin-right: 10px;">
                                                                            <asp:Label Style="color: #6c6b6b;" runat="server" ID="lblBookPrice" />
                                                                        </div>--%>
                                                                        <div style="margin-top: 5px;">
                                                                            <!--Rate Button-->
                                                                            <asp:Button ID="btnToOpenFeedback" runat="server" CssClass="RatingButton pull-right ratebtn" Text="Rate" CommandArgument='<%# Eval("bookID") %>' OnCommand="btnToOpenFeedback_Command" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>



                                                <div style="margin-top: 40px;">
                                                    <div class="bottom-container" style="display: flex; flex-flow: row nowrap; justify-content: space-between;">
                                                        <div style="display: flex; flex-flow: row nowrap; align-items: end; margin-top: 10px;">
                                                            <span style="color: #6c6b6b; font-size: 10px;">Estimated Arrival Date: </span>
                                                            <asp:Label runat="server" ID="lblArrivalDate" Style="color: #6c6b6b; font-size: 10px; margin-top: -30px;" />
                                                        </div>
                                                        <div style="display: flex; flex-flow: column nowrap;">
                                                            <div>
                                                                <b>
                                                                    <asp:Label runat="server" ID="Label1" Style="font-size: 20px; margin-right: 5px;" Text='<%# "Total: RM " + Eval("TotalAmount") %>' /></b>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <hr style="height: 2px; border-width: 0; color: black; background-color: black">
                                                </div>
                                        </ItemTemplate>
                                    </asp:Repeater>



                                    <!--Rating Model-->
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel" style="font-size: 25px;"><b>Product Feedback</b></h5>
                                                    <asp:Button ID="btnClose" runat="server" class="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                                                </div>
                                                <div class="modal-body">
                                                    <div class="mb-3">

                                                        <asp:Label ID="lblRate" runat="server" CssClass="col-form-label" Text="Product Rating: " Style="margin-top: 100px;"></asp:Label>


                                                        <div class="wrap" style="margin-bottom: 20px;">

                                                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="r" runat="server">
                                                                <asp:ListItem Value="1" Style="margin-right: 10px; display: flex; flex-flow: column nowrap; color: crimson">&#9733;1</asp:ListItem>
                                                                <asp:ListItem Value="2" Style="margin-right: 10px; display: flex; flex-flow: column nowrap; color: crimson">&#9733;2</asp:ListItem>
                                                                <asp:ListItem Value="3" Style="margin-right: 10px; display: flex; flex-flow: column nowrap; color: crimson">&#9733;3</asp:ListItem>
                                                                <asp:ListItem Value="4" Style="margin-right: 10px; display: flex; flex-flow: column nowrap; color: crimson">&#9733;4</asp:ListItem>
                                                                <asp:ListItem Value="5" Style="margin-right: 10px; display: flex; flex-flow: column nowrap; color: crimson">&#9733;5</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </div>
                                                    <div class="mb-3">
                                                        <br />
                                                        <asp:Label ID="lblFeedback" runat="server" Text="Feedback: " CssClass="col-form-label"></asp:Label>
                                                        <asp:TextBox ID="txtFeedback" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-danger" Text="Submit" OnClick="btnSubmit_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--End of an order-->






                        </div>
                    </div>
                </div>
            </div>
    </section>



</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
