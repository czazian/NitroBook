<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="staff_create.aspx.cs" Inherits="AssignmentWAD.Staff.Staff.staff_create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">Create Staff</div>
                <label class="label-field">Username </label>
                </br>
                <asp:TextBox runat="server" ID="txtUsername" CssClass="input-field"></asp:TextBox>
                <br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br /></br>
                    <label class="label-field">Password</label></br>
                <asp:TextBox runat="server" ID="txtPass" CssClass="input-field"></asp:TextBox>
                <br>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPass" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br /></br>
                    <label class="label-field">Role </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlRole" CssClass="input-field" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleID">
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                    <asp:ListItem Text="Crew" Value="Crew"></asp:ListItem>
                </asp:DropDownList>
                <br>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Staff/staff.aspx" CausesValidation="False"/>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource>
            </div>

        </div>
</asp:Content>
