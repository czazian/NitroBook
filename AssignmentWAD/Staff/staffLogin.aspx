<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeFile="staffLogin.aspx.cs" Inherits="AssignmentWAD.Staff.staffLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="staffLogin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Customer/customer.css" />
    <script src="staffLogin.js"></script>
    <script type="text/javascript">
        var status = '<%= Session["status"] %>';
        if (status === "loginError") {
            lblError.Text = "Invalid email or password";
            lblError.Visible = true;
        }
        if (status === "EmptyEmail") {
            lblError.Text = "Please enter email";
            lblError.Visible = true;
        }
        if (status === "EmptyPass") {
            lblError0.Text = "Please enter password";
            lblError0.Visible = true;
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: -1px;
            height: 584%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <br />
        <br />
        <br />
        <br />
        <div class="loginContent">
            <div id="Loginform">
                <div class="fieldsets">
                    <h2 class="fs-title"><strong>Staff Login</strong></h2>
                    <h3 class="fs-subtitleLogin">Sign in with your username and password.</h3>


                    <div class="form-item" style="text-align: left;">
                        <asp:TextBox ID="txtStaffId" runat="server" placeholder="Enter Staff Username" CssClass="form-style" name="id" /><br />
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

                    </div>

                    <div class="form-item" style="text-align: left;">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-style" placeholder="Enter your password" /><br />
                        <asp:Label ID="lblError0" runat="server" ForeColor="Red"></asp:Label>

                    </div>

                    <div class="form-item">
                        <p class="pull-left">
                            <asp:Button ID="btnSubmit" runat="server" Text="Sign in" CssClass="btnLogin pull-right" />
                        </p>
                        <br />
                        <br />
                        <br />
                        <br />


                        <div class="clear-fix">
                        </div>

                    </div>
                </div>

            </div>

        </div>

    </main>
</asp:Content>
