﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="role_edit.aspx.cs" Inherits="AssignmentWAD.Staff.Role.role_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        .form-button:hover {
            cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">Edit Role</div>
                <label class="label-field">Name: </label>
                </br>
                <asp:TextBox runat="server" ID="txtRoleName" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoleName" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Module Permission:</label></br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbProdPermit" CssClass="toggle-checkbox" Text="Product"></asp:CheckBox>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbReportPermit" CssClass="toggle-checkbox" Text="Report"></asp:CheckBox>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbMemberPermit" CssClass="toggle-checkbox" Text="Member"></asp:CheckBox>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbStaffPermit" CssClass="toggle-checkbox" Text="Staff"></asp:CheckBox>
                </label>
                <br>
                <label class="toggle">
                    <asp:CheckBox runat="server" ID="cbRolePermit" CssClass="toggle-checkbox" Text="Role"></asp:CheckBox>
                </label>
                <br>
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click"  />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Role/role.aspx" CausesValidation="False" />
            </div>

        </div>
        <style>
          </style>
</asp:Content>
