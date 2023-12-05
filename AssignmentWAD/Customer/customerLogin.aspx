<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="customerLogin.aspx.cs" Inherits="AssignmentWAD.Customer.customerLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" type="text/css" href="customer.css" />
    <script>
        $(document).ready(function () {
            var formInputs = $('input[type="text"], input[type="password"], <%= txtUsername.ClientID %>, <%= txtPassword.ClientID %>');

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

    <div class="loginContent">
        <div id="Loginform">
            <div class="fieldsets">

                <h2 class="fs-title"><strong>Customer Login</strong></h2>
                <h3 class="fs-subtitleLogin">Create an account if you haven't register</h3>


                <div class="form-item">
                    <p class="formLabel">Username</p>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-style" AutoCompleteType="None"></asp:TextBox>
                    <br />
                </div>
                <div class="form-item">
                    <p class="formLabel">Password</p>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-style"></asp:TextBox>
                    <!-- You can include the eye icon for password visibility if needed -->
                    <%--                     <div class="pw-view"><i class="fa fa-eye"></i></div> --%>
                    <br />
                    <p>
                        <asp:HyperLink runat="server" ID="hrefForgotPass" NavigateUrl="~/Customer/ForgotPassword.aspx" CssClass="hlk" Text="Forgot password?"/>
                        <br />

                    </p>
                </div>
                <div class="form-item">
                    <br />
                    <p class="pull-left">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btnLogin pull-right" PostBackUrl="~/Customer/Register.aspx" />

                    </p>
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btnLogin pull-right" OnClick="btnLogin_Click" PostBackUrl="~/Home/homepage.aspx" />
                    <div class="clear-fix"></div>
                </div>
            </div>

        </div>

    </div>



</asp:Content>
