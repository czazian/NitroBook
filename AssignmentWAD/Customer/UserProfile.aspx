<%@ Page Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="AssignmentWAD.Customer.UserProfile" %>

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
                            <p class="heading"
                                style="font-size: 1.1rem; font-weight: bold; color: #fa6464; margin-left: 5px; font-family: Arial, Helvetica, sans-serif">
                                Profile
                            </p>
                            <hr />
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="UserProfileOption" Text="My Purchase" PostBackUrl="~/Customer/OrderTracking.aspx" />
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="UserProfileOption" Text="Logout" PostBackUrl="~/Customer/Logout.aspx" />

                        </div>
                    </div>
                </div>

                <div class="col-8">
                    <div id="row-profile" style="border-style: solid; border-color: #D0D0D0; border-radius: 2px; display:flex; flex-flow :column nowrap;">
                        <div class="row">
                            <h2 class="heading"
                                style="font-size: 1.3rem; font-weight: bold; margin-top: 20px; margin-left: 20px; font-family: Arial, Helvetica, sans-serif">Hi, Jason Tan!</h2>

                        </div>
                        <div class="w3-panel w3-border-top"></div>
                        <div class="row-2" style="height: 150px;">
                            <asp:Image ID="image1" runat="server" ImageUrl="/image/administrator-icon.png" AlternateText="ProfilePic" CssClass="w3-left w3-circle w3-margin-right" Style="width: 150px; margin-left: 50px;" />
                            <asp:HyperLink ID="hrefProfilePic" runat="server" Text="Edit Profile Picture" CssClass="editprofilePic" NavigateUrl="#" onclick="openModal(); return false;" Style="top:160px;"/>

                            <div class="infoCUSTT" style="display: flex; flex-flow: column nowrap; justify-content: center; height: inherit; font-family: Arial, Helvetica, sans-serif">
                                <br />
                                <br />
                                <br />
                                <p style="margin-left: 35px;"><b>Username</b> : Jason_Tan0101</p>
                                <br>
                                <p style="margin-left: 35px;"><b>Name</b> : Jason Tan</p>
                                <br>
                                <p style="margin-left: 35px"><b>E-mail</b> : Jason@gmail.com</p>
                                <br>
                                <p style="margin-left: 35px"><b>Phone Number</b> : 0123456789</p>
                                <br>
                                <p style="margin-left: 35px;"><b>Date Of Birth</b> : 1/1/2004</p>
                                <br>
                                <p style="margin-left: 35px;"><b>Address</b> : 21 Taman Nuri Indah, Jalan Nuri Indah 4, 70100 Seremban, N.S</p>

                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel" style="font-size: 25px;"><b>Edit Profile Picture</b></h5>
                                            <asp:Button ID="Button1" OnClientClick="return false;" runat="server" class="btn-close" data-bs-dismiss="modal" aria-label="Close" />
                                        </div>
                                        <div class="modal-body">

                                            <div class="mb-3">
                                                <br />
                                                <asp:Label ID="Label1" runat="server" Text="Profile Picture: " CssClass="col-form-label"></asp:Label>
                                                <asp:FileUpload ID="FileUpload1" runat="server" />

                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-danger" Text="Save" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <br>
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
