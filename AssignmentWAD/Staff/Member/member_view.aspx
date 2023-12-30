<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="member_view.aspx.cs" Inherits="AssignmentWAD.Staff.Member.member_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">View Member</div>
                <label class="label-field">Username </label>
                </br>
                <asp:TextBox runat="server" ID="txtUsername" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Email</label></br>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Password </label>
                </br>
                <asp:TextBox runat="server" ID="txtPass" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Phone No </label>
                </br>
                <asp:TextBox runat="server" ID="txtPhoneNo" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Date of Birth </label>
                </br>
                <asp:TextBox runat="server" ID="txtDateOfBirth" CssClass="input-field width-25" ReadOnly="True"></asp:TextBox>
                <br>
                <label class="label-field">Profile Image:</label></br>
                <asp:Image runat="server" ID="image" CssClass="width-25"/>
                <br>
                    <label class="label-field">Address </label>
                </br>
                <asp:TextBox runat="server" ID="txtAddress" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Member/member.aspx" />
            </div>

        </div>
    </div>
</asp:Content>
