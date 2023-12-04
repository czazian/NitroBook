<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="AssignmentWAD.Staff.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">

        <div class="sales-boxes">

            <div class="recent-sales box">
                <div class="title">Profile</div>
                <label class="label-field">Username </label>
                </br>
                            <asp:TextBox runat="server" ID="txtUsername" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Password</label></br>
                <asp:TextBox runat="server" ID="txtPass" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Role </label>
                </br>
s
                <!--                            edit role is not allow in profile-->
                <asp:DropDownList runat="server" ID="ddlRole" CssClass="input-field" Enabled="False">
                    <asp:ListItem Text="Admin" Value="Admin" Selected="False"></asp:ListItem>
                    <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                    <asp:ListItem Text="Crew" Value="Crew"></asp:ListItem>
                </asp:DropDownList>
                <br>

                <asp:Button runat="server" ID="btnSubmit" Text="Update" CssClass="form-button" />
            </div>

        </div>
</asp:Content>
