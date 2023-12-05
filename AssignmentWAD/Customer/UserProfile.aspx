<%@ Page Language="C#" MasterPageFile="~/Client.Master"  AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="AssignmentWAD.Customer.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	    <link rel="stylesheet" type="text/css" href="customer.css" />

            <section style="background-color: #eee;">
                <div class="container py-5">
                    <%--<div class="row1">
                        <div class="col">

                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="homepage.jsp"
                                                                   style="text-decoration-line: none; color: #00bfff;">Home</a></li>
                                    <li class="breadcrumb-item"><a href="customerProfile.jsp"
                                                                   style="text-decoration-line: none; color: #00bfff;">My Account</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>--%>

                    <div class="row">
                        <div class="col-2">
                            <div id="row-profile" style="border-style:solid; border-color:#D0D0D0; border-radius: 2px;">
<br />
                <div id="list-example" class="list-group">
                                        <p class="heading"
                                        style="font-size: 1.1rem;font-weight: bold; color:#fa6464; margin-left: 5px; font-family:Arial, Helvetica, sans-serif">Profile</p><hr />
                                                <asp:LinkButton ID="lkbMyPurchase" runat="server" CssClass="UserProfileOption" Text="My Purchase" PostBackUrl="~/Customer/OrderTracking.aspx"/>
                                    <asp:LinkButton ID="lkbLogout" runat="server" CssClass="UserProfileOption" Text="Logout" PostBackUrl="~/Customer/Logout.aspx"/>
                                         
                                </div>
                                </div>
                            </div>
                          
                         <div class="col-8">
                            <div id="row-profile" style="border-style:solid; border-color: 	#D0D0D0; border-radius: 2px;">
                                <div class="row">
                                    <h2 class="heading"
                                        style="font-size: 1.3rem;font-weight: bold; margin-top: 20px; margin-left: 20px; font-family:Arial, Helvetica, sans-serif">
                                        Hi, Jason Tan!</h2>

                                </div>
                                <div class="w3-panel w3-border-top"></div>
                                <div class="row-2" style="height:150px;">

                                   <asp:Image ID="imageProfile" runat="server" ImageUrl="/image/administrator-icon.png" AlternateText="ProfilePic" CssClass="w3-left w3-circle w3-margin-right" style="width:150px; margin-left:50px;"/>

                                    <div class="infoCUSTT" style="display:flex; flex-flow: column nowrap; justify-content: center; height:inherit; font-family:Arial, Helvetica, sans-serif"">
                                        <br /><br /><br />
                                        <p style=" margin-left: 35px;"> <b>Username</b> : Jason_Tan0101</p><br>
                                        <p style=" margin-left: 35px;"> <b>Name</b> : Jason Tan</p><br>
                                        <p style=" margin-left: 35px "> <b>E-mail</b> : Jason@gmail.com</p><br>
                                        <p style=" margin-left: 35px "> <b>Phone Number</b> : 0123456789</p><br>
                                        <p style=" margin-left: 35px;"> <b>Date Of Birth</b> : 1/1/2004</p><br>
                                        <p style=" margin-left: 35px;"> <b>Address</b> : 21 Taman Nuri Indah, Jalan Nuri Indah 4, 70100 Seremban, N.S</p><br>

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
