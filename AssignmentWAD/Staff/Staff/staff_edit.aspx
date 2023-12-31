<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="staff_edit.aspx.cs" Inherits="AssignmentWAD.Staff.Staff.staff_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">Edit Staff</div>
                <label class="label-field">Username: </label>
                </br>
                <asp:TextBox runat="server" ID="txtUsername" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Previous Password</label></br>
                <asp:TextBox runat="server" ID="txtPrevPassw" CssClass="input-field" AutoPostBack="True" OnTextChanged="txtPrevPassw_TextChanged"></asp:TextBox>
                <asp:Label ID="lblPrevPassErrorMsg" runat="server" ForeColor="#FF3300"></asp:Label>
                <asp:HiddenField ID="prevPasswHashed" runat="server" />
                <br />
                <br>
                    <label class="label-field">New Password</label></br>
                <asp:TextBox runat="server" ID="txtNewPassw" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqValiNewPassw" runat="server" ErrorMessage="New Password is require to change password" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                <br />
                    <label class="label-field">Role </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlRole" CssClass="input-field" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleID">
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Manager" Value="Manager"></asp:ListItem>
                    <asp:ListItem Text="Crew" Value="Crew"></asp:ListItem>
                </asp:DropDownList>
                <br>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Staff/staff.aspx" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource>
                <br />
            </div>

        </div>
</asp:Content>
