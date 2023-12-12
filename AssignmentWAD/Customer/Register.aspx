 <%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AssignmentWAD.Customer.Register" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	    <link rel="stylesheet" type="text/css" href="customer.css" />


    <div id="msform">
      
         <!-- fieldsets -->
        <div class="fieldsets">
            <h2 class="fs-title"><strong>Register an account</strong></h2>
            <h3 class="fs-subtitle">Login Info</h3>

            <asp:TextBox ID="txtNewUsername" runat="server" placeholder="Username" CssClass="input"></asp:TextBox>
                                <asp:TextBox ID="txtNewPass" runat="server" placeholder="Password" TextMode="Password" CssClass="input"></asp:TextBox>
                                <asp:TextBox ID="txtConfirmPass" runat="server" placeholder="Confirm Password" TextMode="Password" CssClass="input"></asp:TextBox>
            <hr />
              <h3 class="fs-subtitle">Personal Details</h3>
             <asp:TextBox ID="txtName" runat="server" placeholder="Name" CssClass="input"></asp:TextBox>
             <asp:TextBox ID="txtEmail" runat="server" placeholder="Email (xxx@xxxx.com)" TextMode="Email" CssClass="input"></asp:TextBox>
             <asp:TextBox ID="txtPhoneNum" runat="server" placeholder="Phone Number (without -)" TextMode="Phone" CssClass="input"></asp:TextBox>
                         <asp:TextBox ID="txtDOB" runat="server" placeholder="Date of Birth" TextMode="Date" CssClass="input"></asp:TextBox>
             <asp:TextBox ID="txtAddress" runat="server" placeholder="Address" TextMode="MultiLine" CssClass="input"></asp:TextBox>
            <br /><br />

<asp:LinkButton ID="lbtSubmit" runat="server" CssClass="action-button" style="font-family:'HelveticaNeue','Arial', sans-serif;" Text="Submit" PostBackUrl="~/Customer/customerLogin.aspx"/>   

        </div>
     
        </div>

    

</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
