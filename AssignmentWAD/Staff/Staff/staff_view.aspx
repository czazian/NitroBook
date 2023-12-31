<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeFile="staff_view.aspx.cs" Inherits="AssignmentWAD.Staff.Staff.staff_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">View Staff</div>
                <label class="label-field">Username </label>
                </br>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Role </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlRole" CssClass="input-field" Enabled="False" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleID">
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                    <asp:ListItem Text="Crew" Value="Crew"></asp:ListItem>
                </asp:DropDownList>
                <br>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Staff/staff.aspx" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource>
            </div>

        </div>
</asp:Content>
