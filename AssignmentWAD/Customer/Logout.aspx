<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="AssignmentWAD.Customer.Logout" %>

<link rel="stylesheet" type="text/css" href="customer.css" />

<body style="overflow:hidden">
    <div class="loginContent">
        <div id="Logutform" style="height: 85vh; display: flex; justify-content: center; align-items: center;">
            <div class="fieldsets">
                <asp:Image ID="imageLogo" runat="server" AlternateText="Nitro-Books Logo" ImageUrl="/image/title-logo.png" />
                <br />
                <h2 class="fs-title"><strong>You have Logged Out your account</strong></h2>
                <h3 class="fs-subtitleLogin">Thanks for having our services. Have a great day!</h3>


                <div class="form-item">
                    <br />
                    <br />
                    <p>
                        <asp:HyperLink runat="server" ID="hrefLoginAgain" NavigateUrl="~/Customer/customerLogin.aspx" CssClass="LoginAgain" Text="Login Again" />
                        <br />
                    </p>
                </div>

            </div>

        </div>

    </div>
</body>
