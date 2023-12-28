<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="product_edit.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product_edit" %>

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

    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">Edit Product</div>
                <label class="label-field">Title: </label>
                </br>
                <asp:TextBox runat="server" ID="txtTitle" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Description: </label>
                </br>
                <asp:TextBox runat="server" ID="txtDesc" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Author: </label>
                </br>
                <asp:TextBox runat="server" ID="txtAuthor" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAuthor" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Price: (RM XX.XX)</label></br>
                <asp:TextBox runat="server" ID="txtPrice" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <label class="label-field">Category: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlProductCategory" CssClass="input-field" AutoPostBack="True" OnSelectedIndexChanged="ddlProductCategory_SelectedIndexChanged">
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
                <asp:DropDownList runat="server" ID="ddlSubCategory" CssClass="input-field">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlSubCategory" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                 </br>
                <label class="label-field">Quantity: </label>
                </br>
                <asp:TextBox runat="server" ID="txtQuantity" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtQuantity" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </br>
                     <label class="label-field">New Image: (Upload image to replace Default Image)</label></br>
                <asp:FileUpload runat="server" ID="newImgProd" CssClass="input-field" />
                <br>
                    <label class="label-field">Default Image: </label>
                </br>
                <asp:Image runat="server" ID="image"/>
                <br>
                <label class="label-field">Language: </label>
                <br>
                <asp:DropDownList runat="server" ID="ddlLanguage" CssClass="input-field">
                    <asp:ListItem>English</asp:ListItem>
                    <asp:ListItem>Chinese</asp:ListItem>
                    <asp:ListItem>Japanese</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlLanguage" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button"  OnClick="btnSubmit_Click"/>
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Product/product.aspx" CausesValidation="False" />
            </div>

        </div>
</asp:Content>
