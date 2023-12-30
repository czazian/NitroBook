<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="product_addStock.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product_addStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-button:hover {
            cursor: pointer;
        }
    </style>
    <link href="product.css" rel="stylesheet">
    <script src="product.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box width-75">

                <div class="title">Product Details</div>
                <label class="label-field">Title: </label>
                </br>
                <asp:TextBox runat="server" ID="txtTitle" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Description: </label>
                </br>
                <asp:TextBox runat="server" ID="txtDesc" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Author: </label>
                </br>
                <asp:TextBox runat="server" ID="txtAuthor" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAuthor" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Price: (RM XX.XX)</label></br>
                <asp:TextBox runat="server" ID="txtPrice" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Category: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlProductCategory" CssClass="input-field" AutoPostBack="True" OnSelectedIndexChanged="ddlProductCategory_SelectedIndexChanged" Enabled="False">
                    <asp:ListItem Text="New Arrivals" Value="New Arrivals"></asp:ListItem>
                    <asp:ListItem Text="Fiction" Value="Fiction"></asp:ListItem>
                    <asp:ListItem Text="Non-Fiction" Value="Non-Fiction" Selected="True"></asp:ListItem>
                    <asp:ListItem>Children&#39;s</asp:ListItem>
                    <asp:ListItem>Manga &amp; Light Novel</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlProductCategory" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </br>
               <label class="label-field">Sub-Category: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlSubCategory" CssClass="input-field" Enabled="False">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlSubCategory" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </br>
                    <label class="label-field">Image: </label>
                </br>
                <asp:Image runat="server" ID="image" CssClass="width-25" />
                <br>
                <label class="label-field">Language: </label>
                <br>
                <asp:DropDownList runat="server" ID="ddlLanguage" CssClass="input-field" Enabled="false">
                    <asp:ListItem>English</asp:ListItem>
                    <asp:ListItem>Chinese</asp:ListItem>
                    <asp:ListItem>Japanese</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlLanguage" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
            </div>

            <div class="recent-sales box width-25">
                <div class="title">Update Stock</div>
                <label class="label-field">Current Quantity: </label>
                </br>
                <asp:TextBox runat="server" ID="txtCurrentQuantity" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                </br>

                <label class="label-field">Add Quantity: </label>
                </br>
                <asp:TextBox runat="server" ID="txtAddQuantity" CssClass="input-field border-lightsalmon" OnTextChanged="Page_Load">0</asp:TextBox>
                <div>
                    <asp:Button ID="btn10" runat="server" Text="10" CssClass="form-button2" OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                    <asp:Button ID="btn20" runat="server" Text="20" CssClass="form-button2" OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                    <asp:Button ID="btn30" runat="server" Text="30" CssClass="form-button2" OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                    <asp:Button ID="btn40" runat="server" Text="40" CssClass="form-button2" OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                    <asp:Button ID="btn50" runat="server" Text="50" CssClass="form-button2" OnClick="btnShortCutQuantity_Click" CausesValidation="False" />
                </div>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAddQuantity" ErrorMessage="This field is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorQuantity" runat="server"
                    ControlToValidate="txtAddQuantity"
                    ErrorMessage="Please enter a valid numeric format"
                    ValidationExpression="\d+"
                    ForeColor="Red"
                    Display="Dynamic">
                </asp:RegularExpressionValidator>
                <br>
                <br>
                <asp:Button ID="btnCal" runat="server" Text="Calculate" CssClass="form-button2 width-100 mb-10" OnClick="btnCal_Click" />
                <br>

                    <label class="label-field">Latest Quantity: </label>
                </br>
                <asp:TextBox runat="server" ID="txtLatestQuantity" CssClass="input-field" ReadOnly="True"></asp:TextBox>

                <asp:Button runat="server" ID="Button1" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click" />
                <asp:Button runat="server" ID="Button2" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Product/product.aspx" CausesValidation="False" />
            </div>
        </div>
</asp:Content>
