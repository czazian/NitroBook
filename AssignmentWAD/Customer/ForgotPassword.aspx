<%@ Page Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="AssignmentWAD.Customer.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="customer.css" />
     <style type="text/css">
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: 0;
            background: white;
            border-radius: 3px;
            box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
            padding: 20px 30px;
            box-sizing: border-box;
            width: 90%;
            position:relative;
            margin: 0 10%;
            left: -53px;
            top: 0px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="msform">


        <!-- fieldsets -->
        <div class="auto-style1">
            <h2 class="fs-title"><strong>Reset Password</strong></h2>
            <br />

                       <asp:TextBox ID="txtEmail" runat="server" placeholder="Email (xxx@xxxx.com)" TextMode="Email" CssClass="input" Width="257px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtEmail" ForeColor="#FF3300">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email format Required" ControlToValidate="txtEmail" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtNewPass" runat="server" placeholder="New Password" TextMode="Password" CssClass="input" Width="257px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required" ControlToValidate="txtNewPass" ForeColor="#FF3300">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must be at least 8 characters" ControlToValidate="txtNewPass" ForeColor="#FF3300" ValidationExpression="^\w{8,}$">*</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtConfirmPass" runat="server" placeholder="Confirm Password" TextMode="Password" CssClass="input" Width="257px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm Password is Required" ControlToValidate="txtConfirmPass" ForeColor="#FF3300">*</asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm Password not align with Password" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" ForeColor="#FF3300">*</asp:CompareValidator>
            <br />
            <asp:Label ID="lblErrMsg" runat="server" Text="" Style="color: red; font-size: 12px; margin-left:5px;"></asp:Label>
            <br /><br />
            <asp:Button ID="btnConfirm" runat="server" CssClass="action-button" Style="font-family: 'HelveticaNeue','Arial', sans-serif;" Text="Confirm" OnClick="btnConfirm_Click"/>
            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
        </div>
            </div>
</asp:Content>



<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
