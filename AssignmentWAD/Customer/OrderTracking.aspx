<%@ Page Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="OrderTracking.aspx.cs" Inherits="AssignmentWAD.Customer.OrderTracking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="customer.css" />

    <section style="background-color: #eee;">
        <div class="container py-5">

            <div class="row">
                <div class="col-2">
                    <div id="row-profile" style="border-style: solid; border-color: #D0D0D0; border-radius: 2px;">
                        <br />
                        <div id="list-example" class="list-group">
                            <p class="heading" style="font-size: 1.1rem;font-weight: bold; color:#fa6464; margin-left: 5px; font-family:Arial, Helvetica, sans-serif">Profile</p><hr />
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
    style="font-size: 1.3rem;font-weight: bold; margin-top: 20px; margin-left: 20px; font-family:Arial, Helvetica, sans-serif">
    My Purchase</h2>

                        </div>
                       <div class="w3-panel w3-border-top">
                            <br />
                            <%--assign DataList--%>
                                    <div class="row" style="background-color:white; font-family: Arial, Helvetica, sans-serif;">
                                   <asp:Image ID="imagePurchase" runat="server" ImageUrl="/image/book4.jpg" AlternateText="PurchaseImage" CssClass="bookImage" style="width:120px; margin-left:30px; margin-top:15px; float: left;"/>
                                        <div class="shippingStatus">
                                        <p>To Receive</p>
                                            </div>
                                        <div class="PurchaseDetails">
                                        <p><b>Harry Potter</b></p><br />
                                        <p style="color:#6c6b6b; font-size:15px;">x2</p>
                                            </div>
                                        <div class="priceLabel">
                                        <p style="color:#6c6b6b; margin-top:-30px;">RM 20.00</p>
                                         <hr />
                                        <h2 style="font-size:20px;"><b>Total: RM 40.00</b></h2><br />
                                            </div>
                                        <p style="color:#6c6b6b; font-size:10px; margin-top:-30px;">Estimated Arrival Date: 22/12/2023</p>

                                        
</div><br />

                                                               <div class="row" style="background-color:white; font-family: Arial, Helvetica, sans-serif;
">
                                   <asp:Image ID="image1" runat="server" ImageUrl="/image/book2.jpg" AlternateText="PurchaseImage" CssClass="bookImage" style="width:120px; margin-left:30px; margin-top:15px; float: left;"/>
                                        <div class="shippingStatus">
                                        <p>To Ship</p>
                                            </div>
                                        <div class="PurchaseDetails">
                                        <p><b>Capturing Hope</b></p><br />
                                        <p style="color:#6c6b6b; font-size:15px;">x1</p>
                                            </div>
                                        <div class="priceLabel">
                                        <p style="color:#6c6b6b; margin-top:-30px;">RM 100.00</p>
                                         <hr />
                                        <h2 style="font-size:20px;"><b>Total: RM 100.00</b></h2><br />
                                            </div>
                                        <p style="color:#6c6b6b; font-size:10px; margin-top:-30px;">Estimated Arrival Date: 26/12/2023</p>

                                        
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
