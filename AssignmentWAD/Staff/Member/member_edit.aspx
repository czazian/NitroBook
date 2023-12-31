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
                <label class="label-field">Username: </label>
                </br></br>
                <asp:TextBox runat="server" ID="txtUsername" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br></br>
                    <label class="label-field">Email:</label></br>
                <asp:TextBox runat="server" ID="txtEmail" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Enter a valid email address(eg. XX@XX.XXX)" ForeColor="Red" Display="Dynamic"
                    ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b"></asp:RegularExpressionValidator>
                <br></br></br>
                    <label class="label-field">Password: </label>
                </br></br>
                <asp:TextBox runat="server" ID="txtPass" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPass" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br></br>
                    <label class="label-field">Phone No: </label>
                </br></br>
                <asp:TextBox runat="server" ID="txtPhoneNo" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhoneNo" ErrorMessage="Phone number is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorPhone" runat="server" ControlToValidate="txtPhoneNo"
                    ErrorMessage="Enter a valid phone number(eg. XXXXXXXXXX)" ForeColor="Red" Display="Dynamic"
                    ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                <br></br></br>
                    <label class="label-field">Date of Birth: </label>
                </br></br>
                <asp:TextBox runat="server" ID="txtDateOfBirth" CssClass="input-field width-25"></asp:TextBox>
                <asp:Calendar runat="server" ID="dateOfBirth" OnSelectionChanged="dateOfBirth_SelectionChanged" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
                </br>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br></br>
                    <label class="label-field">New Profile Image: (Upload image to replace Default Profile Image)</label></br></br>
                <asp:FileUpload runat="server" ID="newProfileImg" CssClass="input-field" />
                <br></br>
                    <label class="label-field">Default Profile Image: </label>
                </br></br>
                <asp:Image runat="server" ID="profileImg" CssClass="width-25" />
                <br></br>
                    <label class="label-field">Address: </label>
                </br></br>
                <asp:TextBox runat="server" ID="txtAddress" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Member/member.aspx" CausesValidation="False" />
            </div>

        </div>
    </div>
</asp:Content>
