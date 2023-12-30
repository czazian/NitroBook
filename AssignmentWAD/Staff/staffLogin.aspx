<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeFile="staffLogin.aspx.cs" Inherits="AssignmentWAD.Staff.staffLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="staffLogin.css" rel="stylesheet">
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
            <!-- Login Form -->
            <div class="container">
                <div class="form-container">
                    <div class="staff-forms">
                        <div class="form login">
                            <span class="login-title">
                                Staff Login Page
                            </span>
                            <%--have to add required but it is not available in asp net--%>
                                <div class="input-field">
                                    <asp:TextBox ID="txtStaffId" runat="server" placeholder="Enter Staff Username" class="auto-style1" name="id"/>
                                    <i class="fa-solid fa-user"></i>
                                </div>
                                <asp:Label ID="lblError" runat="server" ForeColor="Red"><%= Session["emailError"] %></asp:Label>
                                <div class="input-field">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="password" placeholder="Enter your password"/>
                                    <i class="fa-solid fa-lock"></i>
                                    <i class="uil uil-eye-slash showHidePw"></i>
                                </div>
                                <asp:Label ID="lblError0" runat="server" ForeColor="Red"><%= Session["passwordError"] %></asp:Label>
                                <div class="input-field button">
                                    <%--redirect to admin page--%>
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"/>
                                </div>

                            <br />
                            

                        </div>
                        </div>
                    </div>
                </div>
        </main>
</asp:Content>