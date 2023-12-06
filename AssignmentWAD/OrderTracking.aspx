<%@ Page Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="OrderTracking.aspx.cs" Inherits="AssignmentWAD.Customer.OrderTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="customer.css" />

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section style="background-color: #eee;">
        <div class="container py-5">

            <div class="row">
                <div class="col-2">
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

                <div class="col-8">
                    <div id="row-profile" style="border-style: solid; border-color: #D0D0D0; border-radius: 2px;">
                        <div class="row">
                            <h2 class="heading"
                                style="font-size: 1.3rem; font-weight: bold; margin-top: 20px; margin-left: 20px; font-family: Arial, Helvetica, sans-serif">My Purchase</h2>

                        </div>
                        <div class="w3-panel w3-border-top">
                            <br />
                            <%--assign DataList--%>
                            <div class="row" style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
                                <asp:Image ID="imagePurchase" runat="server" ImageUrl="/image/book4.jpg" AlternateText="PurchaseImage" CssClass="bookImage" Style="width: 120px; margin-left: 30px; margin-top: 15px; float: left;" />
                                <div class="shippingStatus">
                                    <p>To Receive</p>
                                </div>
                                <div class="PurchaseDetails">
                                    <p><b>Harry Potter</b></p>
                                    <br />
                                    <p style="color: #6c6b6b; font-size: 15px;">x2</p>
                                </div>
                                <div class="priceLabel">
                                    <p style="color: #6c6b6b; margin-top: -30px;">RM 20.00</p>
                                    <hr />
                                    <h2 style="font-size: 20px;"><b>Total: RM 40.00</b></h2>
                                    <br />
                                </div>
                                <p style="color: #6c6b6b; font-size: 10px; margin-top: -30px;">Estimated Arrival Date: 22/12/2023</p>
                                <asp:Button ID="btnRating1" runat="server" CssClass="RatingButton pull-right" Text="Rate" OnClientClick="openModal(); return false;" />

                            </div>
                            <br />

                            <div class="row" style="background-color: white; font-family: Arial, Helvetica, sans-serif;">
                                <asp:Image ID="image1" runat="server" ImageUrl="/image/book2.jpg" AlternateText="PurchaseImage" CssClass="bookImage" Style="width: 120px; margin-left: 30px; margin-top: 15px; float: left;" />
                                <div class="shippingStatus">
                                    <p>Delivered</p>
                                </div>
                                <div class="PurchaseDetails">
                                    <p><b>Capturing Hope</b></p>
                                    <br />
                                    <p style="color: #6c6b6b; font-size: 15px;">x1</p>
                                </div>
                                <div class="priceLabel">
                                    <p style="color: #6c6b6b; margin-top: -30px;">RM 100.00</p>
                                    <hr />
                                    <h2 style="font-size: 20px;"><b>Total: RM 100.00</b></h2>
                                    <br />
                                </div>
                                <p style="color: #6c6b6b; font-size: 10px; margin-top: -30px;">Estimated Arrival Date: 26/12/2023</p>

                                <asp:Button ID="btnRating2" runat="server" CssClass="RatingButton pull-right" Text="Rate" OnClientClick="openModal(); return false;" />


                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel" style="font-size:25px;"><b>Product Feedback</b></h5>
                                                <asp:Button ID="btnClose" runat="server" class="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <asp:Image ID="ImageRateProd" runat="server" ImageUrl="/image/book2.jpg" AlternateText="RatingProd" Style="width: 18%; border-radius: 50%; margin-top: 5px; margin-bottom: -8px; height:80px; margin-left:15px;" />
                                                    <p style="margin-left:120px; margin-top:-65px; font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; font-size:20px;">Capturing Hope</p>



                                                    <br /><br /><br /><br />
                                                    <asp:Label ID="lblRate" runat="server" CssClass="col-form-label" Text="Product Quality" style="margin-top:100px;"></asp:Label>

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
                                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                              


                            </div>


                        </div>


                    </div>
                </div>
            </div>
    </section>

</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
