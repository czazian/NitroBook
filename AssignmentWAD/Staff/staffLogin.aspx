<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="staffLogin.aspx.cs" Inherits="AssignmentWAD.Home.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="staffLogin.css" rel="stylesheet">
    <script src="staffLogin.js"></script>
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: -1px;
            height: 584%;
        }
        .auto-style2 {
            left: 0px;
            top: 246px;
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
                                    <asp:Textbox ID="staffId" runat="server" placeholder="Enter Staff ID" class="auto-style1" name="id"/>
                                    <i class="fa-solid fa-user"></i>                       
                                </div>
                                <div class="input-field">
                                    <asp:TextBox ID="password" runat="server" TextMode="Password" class="password" placeholder="Enter your password"/>
                                    <i class="fa-solid fa-lock"></i>
                                    <i class="uil uil-eye-slash showHidePw"></i>
                                </div>
                                <div class="input-field button">
<%--                                    redirect to admin page--%>
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" PostBackUrl="~/Staff/Dashboard/dashboard.aspx" />
                                </div>

                        </div>
                    </div>
                </div>
                </div>
        </main>
</asp:Content>
