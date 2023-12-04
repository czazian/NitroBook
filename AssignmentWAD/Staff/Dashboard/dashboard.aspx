<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="AssignmentWAD.Staff.Dashboard.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="dashboard.css" rel="stylesheet">
    <script src="dashboard.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">

        <div class="sales-boxes">
            <div class="recent-sales box">
                <h1>Welcome to Staff Portal</h1>
                <br>
                <p>This portal allow you to do everything u want </p>
            </div>
            <div class="recent-sales box">
                <asp:Image ID="Image1" runat="server"
                    AlternateText="Nitro-Books Logo"
                    ImageUrl="/image/title-logo.png" class="img-file" />
            </div>
        </div>
    </div>

</asp:Content>

