<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="customerLogin.aspx.cs" Inherits="AssignmentWAD.Customer.customerLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="customer.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>

        $(document).ready(function () {
            var formInputs = $('input[type="text"], input[type="password"], <%= txtUserName.ClientID %>, <%= txtPassword.ClientID %>');

        formInputs.focus(function () {
            $(this).parent().children('p.formLabel').addClass('formTop');
            $('div#formWrapper').addClass('darken-bg');
            $('div.logo').addClass('logo-active');
        });

        formInputs.focusout(function () {
            if ($.trim($(this).val()).length == 0) {
                $(this).parent().children('p.formLabel').removeClass('formTop');
            }
            $('div#formWrapper').removeClass('darken-bg');
            $('div.logo').removeClass('logo-active');
        });

        $('p.formLabel').click(function () {
            $(this).parent().children('.form-style').focus();
        });
    });

    </script>


    <asp:Label ID="lblSuccRegMsg" runat="server" Text="" CssClass="successReg"></asp:Label>
    <div class="loginContent">
        <div id="Loginform">
            <div class="fieldsets">
                <h2 class="fs-title"><strong>Customer Login</strong></h2>
                <h3 class="fs-subtitleLogin">Create an account if you haven't register</h3>


                <div class="form-item">
                    <p class="formLabel">Username</p>
                    <asp:TextBox Style="width: 100%;"  ID="txtUserName" runat="server" CssClass="form-style" AutoCompleteType="None"></asp:TextBox>
                    <br />
                </div>
                <div class="form-item">
                    <p class="formLabel">Password</p>
                    <asp:TextBox Style="width: 100%;" ID="txtPassword" runat="server" TextMode="Password" CssClass="form-style"></asp:TextBox>

                    <br />
                    <p>
                        <asp:HyperLink runat="server" ID="hrefForgotPassw" CssClass="hlk" Text="Forgot password?" NavigateUrl="~/Customer/ForgotPassword.aspx" />
                        <br />

                    </p>
                </div>
                <div class="form-item">
                    <br />
                    <p class="pull-left">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btnLogin pull-right" PostBackUrl="~/Customer/Register.aspx" />

                    </p>
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btnLogin pull-right" OnClick="btnLogin_Click" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lblLoginErr" runat="server" ForeColor="Red"></asp:Label>


                    <div class="clear-fix">
                    </div>

                </div>
            </div>

        </div>

    </div>



</asp:Content>
