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
                            <br />
                            <%--assign DataList--%>
                            <br />

                            <div class="row" style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
                                <!--Items in a box-->
                                <div class="items-container row">

                                    <div class="top-container" style="width: 100%; display: flex; justify-content: space-between; margin-left: 20px; margin-top: 25px; margin-bottom: 10px;">
                                        <div class="orderDate" style="color: crimson; font-weight: bold;">
                                            <i class="far fa-clipboard" style="color: crimson"></i>
                                            Order Date :
                                            <asp:Label runat="server" ID="lblOrderDate" Text="20/12/2023" />
                                        </div>
                                        <div style="margin-right: 20px;">
                                            <asp:Label CssClass="shippingStatus" runat="server" ID="lblDeliveryStatus" Text="Delivered" />
                                        </div>
                                    </div>

                                    <!--An item in one box-->
                                    <div class="an-item" style="width: 100%; display: flex; flex-flow: row nowrap;">
                                        <asp:Image ID="image1" runat="server" ImageUrl="/image/book/book12.jpg" AlternateText="PurchaseImage" CssClass="bookImage" Style="width: 120px; margin-left: 30px; margin-top: 15px; float: left;" />
                                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; width: 100%; margin-top: 15px; margin-left: 10px; margin-right: 5px;">
                                            <div class="PurchaseDetails">
                                                <div style="margin-bottom: 10px;">
                                                    <b>
                                                        <asp:Label runat="server" ID="lblBookName1" Text="Suzume" /></b>
                                                </div>
                                                <div>
                                                    x<asp:Label Style="color: #6c6b6b" ID="lblQty" runat="server" Text="1" />
                                                </div>
                                            </div>
                                            <div class="priceLabel">
                                                <asp:Label Style="color: #6c6b6b; margin-top: -30px;" runat="server" ID="lblBookPrice" Text="RM 20.00" />
                                            </div>
                                        </div>
                                    </div>



                                    <div class="an-item" style="width: 100%; display: flex; flex-flow: row nowrap;">
                                        <asp:Image ID="image2" runat="server" ImageUrl="/image/book/book26.jpg" AlternateText="PurchaseImage" CssClass="bookImage" Style="width: 120px; margin-left: 30px; margin-top: 15px; float: left;" />
                                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; width: 100%; margin-top: 15px; margin-left: 10px; margin-right: 5px;">
                                            <div class="PurchaseDetails">
                                                <div style="margin-bottom: 10px;">
                                                    <b>
                                                        <asp:Label runat="server" ID="Label2" Text="Capturing Hope"/></b>
                                                </div>
                                                <div>
                                                    x<asp:Label Style="color: #6c6b6b" ID="Label3" runat="server" Text="1" />
                                                </div>
                                            </div>
                                            <div class="priceLabel">
                                                <asp:Label Style="color: #6c6b6b; margin-top: -30px;" runat="server" ID="Label4" Text="RM 100.00" />
                                            </div>
                                        </div>
                                    </div>


                                    <hr />
                                </div>





                                <div class="bottom-container" style="display: flex; flex-flow: row nowrap; justify-content: space-between;">
                                    <div style="display: flex; flex-flow: row nowrap; align-items: end; margin-bottom: 20px;">
                                        <span style="color: #6c6b6b; font-size: 10px;">Estimated Arrival Date: </span>
                                        <asp:Label runat="server" ID="lblDate" Style="color: #6c6b6b; font-size: 10px; margin-top: -30px;" Text="26/12/2023" />
                                    </div>
                                    <div style="display: flex; flex-flow: column nowrap;">
                                        <div>
                                            <asp:Label runat="server" ID="Label1" Style="font-size: 20px; margin-right: 10px;" Text="Total: RM 120.00" />
                                        </div>
                                        <div style="margin: 15px 10px 15px 0;">
                                            <asp:Button ID="Button1" runat="server" CssClass="RatingButton pull-right ratebtn" Text="Rate" OnClientClick="openModal(); return false;" />
                                        </div>
                                    </div>
                                </div>





                                <!--Rating Model-->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel" style="font-size: 25px;"><b>Product Feedback</b></h5>
                                                <asp:Button ID="btnClose" OnClientClick="return false;" runat="server" class="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3">

                                                    <asp:Label ID="lblRate" runat="server" CssClass="col-form-label" Text="Product Rating: " Style="margin-top: 100px;"></asp:Label>

                                                    <div class="wrap">
                                                        <div class="stars">
                                                            <asp:Label ID="lblRate1" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="rbtRate1" runat="server" value="star1" CssClass="rbtRating" />
                                                                <div class="face"></div>
                                                                <i class="far fa-star star one-star"></i>
                                                            </asp:Label>
                                                            <asp:Label ID="lblRate2" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="rbtRate2" runat="server" value="star2" CssClass="rbtRating" />
                                                                <div class="face"></div>
                                                                <i class="far fa-star star two-star"></i>
                                                            </asp:Label>
                                                            <asp:Label ID="lblRate3" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="rbtRate3" runat="server" value="star3" CssClass="rbtRating" />

                                                                <div class="face"></div>
                                                                <i class="far fa-star star three-star"></i>
                                                            </asp:Label>
                                                            <asp:Label ID="lblRate4" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="rbtRate4" runat="server" value="star4" CssClass="rbtRating" />

                                                                <div class="face"></div>
                                                                <i class="far fa-star star four-star"></i>
                                                            </asp:Label>
                                                            <asp:Label ID="lblRate5" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="rbtRate5" runat="server" value="star5" CssClass="rbtRating" />
                                                                <div class="face"></div>
                                                                <i class="far fa-star star five-star"></i>
                                                            </asp:Label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="mb-3">
                                                    <br />
                                                    <asp:Label ID="lblFeedback" runat="server" Text="Feedback: " CssClass="col-form-label"></asp:Label>
                                                    <asp:TextBox ID="txtFeedback" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-danger" Text="Submit" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End of an order-->




                        <!--An Order-->
                        <div class="w3-panel w3-border-top">
                            <br />
                            <%--assign DataList--%>
                            <br />

                            <div class="row" style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
                                <!--Items in a box-->
                                <div class="items-container row">

                                    <div class="top-container" style="width: 100%; display: flex; justify-content: space-between; margin-left: 20px; margin-top: 25px; margin-bottom: 10px;">
                                        <div class="orderDate" style="color: crimson; font-weight: bold;">
                                            <i class="far fa-clipboard" style="color: crimson"></i>
                                            Order Date :
                                            <asp:Label runat="server" ID="Label5" Text="20/12/2023" />
                                        </div>
                                        <div style="margin-right: 20px;">
                                            <!--Shipping Details Color & Rate Button display is depend on this text value --> 
                                            <asp:Label CssClass="shippingStatus" runat="server" ID="Label6" Text="Shipping" />
                                        </div>
                                    </div>

                                    <!--An item in one box-->
                                    <div class="an-item" style="width: 100%; display: flex; flex-flow: row nowrap;">
                                        <asp:Image ID="image3" runat="server" ImageUrl="/image/book/book12.jpg" AlternateText="PurchaseImage" CssClass="bookImage" Style="width: 120px; margin-left: 30px; margin-top: 15px; float: left;" />
                                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; width: 100%; margin-top: 15px; margin-left: 10px; margin-right: 5px;">
                                            <div class="PurchaseDetails">
                                                <div style="margin-bottom: 10px;">
                                                    <b>
                                                        <asp:Label runat="server" ID="Label7" Text="Suzume" /></b>
                                                </div>
                                                <div>
                                                    x<asp:Label Style="color: #6c6b6b" ID="Label8" runat="server" Text="1" />
                                                </div>
                                            </div>
                                            <div class="priceLabel">
                                                <asp:Label Style="color: #6c6b6b; margin-top: -30px;" runat="server" ID="Label9" Text="RM 20.00" />
                                            </div>
                                        </div>
                                    </div>



                                    <div class="an-item" style="width: 100%; display: flex; flex-flow: row nowrap;">
                                        <asp:Image ID="image4" runat="server" ImageUrl="/image/book/book26.jpg" AlternateText="PurchaseImage" CssClass="bookImage" Style="width: 120px; margin-left: 30px; margin-top: 15px; float: left;" />
                                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; width: 100%; margin-top: 15px; margin-left: 10px; margin-right: 5px;">
                                            <div class="PurchaseDetails">
                                                <div style="margin-bottom: 10px;">
                                                    <b>
                                                        <asp:Label runat="server" ID="Label10" Text="Capturing Hope" /></b>
                                                </div>
                                                <div>
                                                    x<asp:Label Style="color: #6c6b6b" ID="Label11" runat="server" Text="1" />
                                                </div>
                                            </div>
                                            <div class="priceLabel">
                                                <asp:Label Style="color: #6c6b6b; margin-top: -30px;" runat="server" ID="Label12" Text="RM 100.00" />
                                            </div>
                                        </div>
                                    </div>


                                    <hr />
                                </div>





                                <div class="bottom-container" style="display: flex; flex-flow: row nowrap; justify-content: space-between;">
                                    <div style="display: flex; flex-flow: row nowrap; align-items: end; margin-bottom: 20px;">
                                        <span style="color: #6c6b6b; font-size: 10px;">Estimated Arrival Date: </span>
                                        <asp:Label runat="server" ID="Label13" Style="color: #6c6b6b; font-size: 10px; margin-top: -30px;" Text="26/12/2023" />
                                    </div>
                                    <div style="display: flex; flex-flow: column nowrap;">
                                        <div>
                                            <asp:Label runat="server" ID="Label14" Style="font-size: 20px; margin-right: 10px;" Text="Total: RM 120.00" />
                                        </div>
                                        <div style="margin: 15px 10px 15px 0;">
                                            <asp:Button ID="Button2" runat="server" CssClass="RatingButton pull-right ratebtn" Text="Rate" OnClientClick="openModal(); return false;" />
                                        </div>
                                    </div>
                                </div>





                                <!--Rating Model-->
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel" style="font-size: 25px;"><b>Product Feedback</b></h5>
                                                <asp:Button ID="Button3" OnClientClick="return false;" runat="server" class="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3">

                                                    <asp:Label ID="Label15" runat="server" CssClass="col-form-label" Text="Product Rating: " Style="margin-top: 100px;"></asp:Label>

                                                    <div class="wrap">
                                                        <div class="stars">
                                                            <asp:Label ID="Label16" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="RadioButton1" runat="server" value="star1" CssClass="rbtRating" />
                                                                <div class="face"></div>
                                                                <i class="far fa-star star one-star"></i>
                                                            </asp:Label>
                                                            <asp:Label ID="Label17" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="RadioButton2" runat="server" value="star2" CssClass="rbtRating" />
                                                                <div class="face"></div>
                                                                <i class="far fa-star star two-star"></i>
                                                            </asp:Label>
                                                            <asp:Label ID="Label18" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="RadioButton3" runat="server" value="star3" CssClass="rbtRating" />

                                                                <div class="face"></div>
                                                                <i class="far fa-star star three-star"></i>
                                                            </asp:Label>
                                                            <asp:Label ID="Label19" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="RadioButton4" runat="server" value="star4" CssClass="rbtRating" />

                                                                <div class="face"></div>
                                                                <i class="far fa-star star four-star"></i>
                                                            </asp:Label>
                                                            <asp:Label ID="Label20" CssClass="rate" runat="server">
                                                                <asp:RadioButton ID="RadioButton5" runat="server" value="star5" CssClass="rbtRating" />
                                                                <div class="face"></div>
                                                                <i class="far fa-star star five-star"></i>
                                                            </asp:Label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="mb-3">
                                                    <br />
                                                    <asp:Label ID="Label21" runat="server" Text="Feedback: " CssClass="col-form-label"></asp:Label>
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <asp:Button ID="Button4" runat="server" CssClass="btn btn-danger" Text="Submit" />
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

    <script defer>

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

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
