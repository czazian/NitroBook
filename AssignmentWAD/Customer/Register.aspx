<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AssignmentWAD.Customer.Register" %>


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
            width: 100%;
            margin: 0 10%;
            /*stacking fieldsets above each other*/ position: relative;
            left: -53px;
            top: 0px;
        }

        .auto-style2 {
            width: 350px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="msform">

        <!-- fieldsets -->
        <div class="auto-style1">
            <h2 class="fs-title"><strong>Register an Account</strong></h2>
            <h3 class="fs-subtitle">Login Info</h3>
            <br />


            <asp:TextBox ID="txtUserName" runat="server" placeholder="Username" CssClass="input" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required" ControlToValidate="txtUserName" ForeColor="#FF3300">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="No space between username" ControlToValidate="txtUserName" ForeColor="#FF3300" ValidationExpression="^\S*$">*</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtNewPass" runat="server" placeholder="Password" TextMode="Password" CssClass="input" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required" ControlToValidate="txtNewPass" ForeColor="#FF3300">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must be at least 8 characters" ControlToValidate="txtNewPass" ForeColor="#FF3300" ValidationExpression="\w+\w{8,}">*</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtConfirmPass" runat="server" placeholder="Confirm Password" TextMode="Password" CssClass="input" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Confirm Password is Required" ControlToValidate="txtConfirmPass" ForeColor="#FF3300">*</asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm Password not align with Password" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" ForeColor="#FF3300">*</asp:CompareValidator>
            <hr class="auto-style2" />
            <h3 class="fs-subtitle">Personal Details</h3>
            <br />

            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email (xxx@xxxx.com)" TextMode="Email" CssClass="input" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Email is Required" ControlToValidate="txtEmail" ForeColor="#FF3300">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email format Required" ControlToValidate="txtEmail" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtPhoneNum" runat="server" placeholder="Phone Number (without -)" TextMode="Phone" CssClass="input" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Phone Number is Required" ControlToValidate="txtPhoneNum" ForeColor="#FF3300">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Phone number format Required" ControlToValidate="txtPhoneNum" ForeColor="#FF3300" ValidationExpression="^\d{10,11}$">*</asp:RegularExpressionValidator>
            <asp:TextBox ID="txtDOB" runat="server" placeholder="Date of Birth" TextMode="Date" CssClass="input" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Date of Birth is Required" ControlToValidate="txtDOB" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
            &nbsp;
            <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" TextMode="MultiLine" CssClass="input" Width="300px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Address is Required" ControlToValidate="txtAddress" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
            &nbsp;
            <br />
            <asp:Label ID="lblFailReg" runat="server" Text="" style="color:red; font-size:12px;"></asp:Label>
            <br /><br />
            <asp:LinkButton ID="lbtSubmit" runat="server" CssClass="action-button" Style="font-family: 'HelveticaNeue','Arial', sans-serif;" Text="Submit" OnClick="lbtSubmit_Click"/>
            <br />
            <br />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
        </div>

    </div>



</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
