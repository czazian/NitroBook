<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeFile="staffLogin.aspx.cs" Inherits="AssignmentWAD.Staff.staffLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="staffLogin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../Customer/customer.css" />
    <script src="staffLogin.js"></script>
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
        <div class="loginContent" >
            <div id="Loginform">
                <div class="fieldsets" style="margin-bottom: 50px;">
                    <h2 class="fs-title"><strong>Staff Login</strong></h2>
                    <h3 class="fs-subtitleLogin">Sign in with your username and password.</h3>


                    <div class="form-item" style="text-align: left; width: 100%; ">
                        <asp:TextBox Style="width: 100%;" ID="txtStaffId" runat="server" placeholder="Enter Staff Username" CssClass="form-style" name="id" /><br />
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>

                    </div>

                    <div class="form-item" style="text-align: left; width: 100%;">
                        <asp:TextBox TextMode="Password" Style="width: 100%;" ID="txtPassword" runat="server" CssClass="form-style" placeholder="Enter your password" /><br />
                        <asp:Label ID="lblError0" runat="server" ForeColor="Red"></asp:Label>

                    </div>

                    <div class="form-item">

                        <div style="display: flex; width: 100%;">
                            <asp:Button Style="width: 100%;" ID="btnSubmit" runat="server" Text="Sign in" CssClass="btnLogin pull-right" />
                        </div>

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
