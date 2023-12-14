<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="member_edit.aspx.cs" Inherits="AssignmentWAD.Staff.Member.member_edit" %>

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

                <div class="title">Edit Member</div>
                <label class="label-field">Username </label>
                </br>
                <asp:TextBox runat="server" ID="txtUsername" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Email</label></br>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Password </label>
                </br>
                <asp:TextBox runat="server" ID="txtPass" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Phone No </label>
                </br>
                <asp:TextBox runat="server" ID="txtPhoneNo" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Date of Birth </label>
                </br>
                <asp:TextBox runat="server" ID="txtDateOfBirth" CssClass="input-field width-25"></asp:TextBox>
                <asp:Calendar runat="server" ID="dateOfBirth" OnSelectionChanged="dateOfBirth_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
                <br>
                    <label class="label-field">Address </label>
                </br>
                <asp:TextBox runat="server" ID="txtAddress" CssClass="input-field"></asp:TextBox>
                <br>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Member/member.aspx" />
            </div>

        </div>
    </div>
</asp:Content>
