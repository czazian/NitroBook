<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="role_view.aspx.cs" Inherits="AssignmentWAD.Staff.Role.role_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">View Role</div>
                <label class="label-field">Name </label>
                </br>
                <asp:TextBox runat="server" ID="txtName" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Module Permission</label></br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbProdPermit" CssClass="toggle-checkbox" Enabled="False"></asp:CheckBox>
                    <div class="toggle-switch"></div>
                    <span class="toggle-label">Product</span>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbMemberPermit" CssClass="toggle-checkbox"></asp:CheckBox>
                    <div class="toggle-switch"></div>
                    <span class="toggle-label">Member</span>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbReportPermit" CssClass="toggle-checkbox" Enabled="False"></asp:CheckBox>
                    <div class="toggle-switch"></div>
                    <span class="toggle-label">Report</span>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbStaffPermit" CssClass="toggle-checkbox" Enabled="False"></asp:CheckBox>
                    <div class="toggle-switch"></div>
                    <span class="toggle-label">Staff</span>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbRolePermit" CssClass="toggle-checkbox" Enabled="False"></asp:CheckBox>
                    <div class="toggle-switch"></div>
                    <span class="toggle-label">Role</span>
                </label>
                <br>
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Role/role.aspx" />
            </div>

        </div>

</asp:Content>
<style>
    .toggle {
        cursor: pointer;
        display: inline-block;
        margin-bottom: 10px;
    }

    .toggle-switch {
        display: inline-block;
        background: #ccc;
        border-radius: 16px;
        width: 58px;
        height: 32px;
        position: relative;
        vertical-align: middle;
        transition: background 0.25s;
    }
    .toggle-switch:before, .toggle-switch:after {
        content: "";
    }
    .toggle-switch:before {
        display: block;
        background: linear-gradient(to bottom, #fff 0%, #eee 100%);
        border-radius: 50%;
        box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.25);
        width: 24px;
        height: 24px;
        position: absolute;
        top: 4px;
        left: 4px;
        transition: left 0.25s;
    }
    .toggle:hover .toggle-switch:before {
        background: linear-gradient(to bottom, #fff 0%, #fff 100%);
        box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.5);
    }
    .toggle-checkbox:checked + .toggle-switch {
        background: #56c080;
    }
    .toggle-checkbox:checked + .toggle-switch:before {
        left: 30px;
    }

    .toggle-checkbox {
        position: absolute;
        visibility: hidden;
    }

    .toggle-label {
        margin-left: 5px;
        position: relative;
        top: 2px;
    }
</style>
