<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="role_view.aspx.cs" Inherits="AssignmentWAD.Staff.Role.role_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">View Role</div>
                <label class="label-field">Name: </label>
                </br>
                <asp:TextBox runat="server" ID="txtRoleName" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Module Permission:</label></br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbProdPermit" CssClass="toggle-checkbox" Text="Product" Enabled="False"></asp:CheckBox>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbReportPermit" CssClass="toggle-checkbox" Text="Report" Enabled="False"></asp:CheckBox>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbMemberPermit" CssClass="toggle-checkbox" Text="Member" Enabled="False"></asp:CheckBox>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbStaffPermit" CssClass="toggle-checkbox" Text="Staff" Enabled="False"></asp:CheckBox>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbRolePermit" CssClass="toggle-checkbox" Text="Role" Enabled="False"></asp:CheckBox>
                </label>
                <br>
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Role/role.aspx" />
            </div>

        </div>
    s
</asp:Content>
