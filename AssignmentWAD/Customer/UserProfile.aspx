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
                    <div id="row-profile" style="border-style: solid; border-color: #D0D0D0; border-radius: 2px; display: flex; flex-flow: column nowrap;">
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

                <div class="col-10">
                    <div id="row-profile" style="border-style: solid; border-color: #D0D0D0; border-radius: 2px; display: flex; flex-flow: column nowrap;">
                        <div class="row">
                            <asp:Label runat="server" ID="lblWelcomeMsg" class="heading"
                                Style="font-size: 1.3rem; font-weight: bold; margin-top: 20px; margin-left: 20px; font-family: Arial, Helvetica, sans-serif"></asp:Label>

                        </div>
                        <div class="w3-panel w3-border-top"></div>
                        <div class="row-2" style="height: 200px; display: flex; flex-flow: row nowrap;" id="container">
                            <div style="display: flex; gap: 5px; flex-flow: row nowrap; border-radius: 50%; margin-right: 10px; justify-content:center;">
                                <asp:Image ID="image1" runat="server" AlternateText="ProfilePic" CssClass="w3-left w3-circle w3-margin-right" Style=" border-radius: 50%; height :140px; width: 140px; border: 2px outset crimson" />
                                <asp:HyperLink ID="hrefProfilePic" runat="server" Text="Edit Profile Picture" CssClass="editprofilePic" NavigateUrl="#" onclick="openModal(); return false;" Style="top: 160px; height: 30px; justify-content:center;" />
                            </div>
                            <div>

                                <div class="infoCUSTT" style="margin-top: -20px; display: flex; flex-flow: column nowrap; justify-content: center; height: inherit; font-family: Arial, Helvetica, sans-serif">
                                    <br />
                                    <br />
                                    <br />
                                    <p style="margin-left: 35px;">
                                        <b>Username</b> :
                                    <asp:Label ID="lblUname" runat="server" Text="Label"></asp:Label>
                                    </p>
                                    <br>
                                    <p style="margin-left: 35px">
                                        <b>E-mail</b> :
                                    <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                                    </p>
                                    <br>
                                    <p style="margin-left: 35px">
                                        <b>Phone Number</b> :
                                    <asp:Label ID="lblPhoneNo" runat="server" Text="Label"></asp:Label>
                                    </p>
                                    <br>
                                    <p style="margin-left: 35px;">
                                        <b>Date Of Birth</b> :
                                    <asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label>
                                    </p>
                                    <br>
                                    <p style="margin-left: 35px;"><b>Address</b> :<asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label></p>

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
                                                    <asp:Label ID="lblmsg" runat="server" />
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-danger" Text="Save" OnClick="btnSave_Click" />
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

        </div>


    </section>








</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
