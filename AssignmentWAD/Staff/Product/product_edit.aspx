<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeFile="product_edit.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product_edit" %>

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
                <br>
                    <label class="label-field">Description: </label>
                </br>
                <asp:TextBox runat="server" ID="txtDesc" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Author: </label>
                </br>
                <asp:TextBox runat="server" ID="txtAuthor" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Price: (RM XX.XX)</label></br>
                <%--                <input type="text" name="price" value="" class="input-field" pattern="(\d+\.\d{1,2})" required>--%>
                <asp:TextBox runat="server" ID="txtPrice" CssClass="input-field"></asp:TextBox>
                <br>
                    <label class="label-field">Category: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlProductCategory" CssClass="input-field">
                    <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                    <asp:ListItem Text="Yellow" Value="Yellow"></asp:ListItem>
                    <asp:ListItem Text="Comedy" Value="Comedy" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                </br>
                <label class="label-field">Quantity: </label>
                </br>
                <asp:TextBox runat="server" ID="txtQuantity" CssClass="input-field"></asp:TextBox>
                </br>
                     <label class="label-field">New Image: (Upload image to replace Default Image)</label></br>
                <asp:FileUpload runat="server" ID="newImgProd" CssClass="input-field" />
                <br>
                    <label class="label-field">Default Image: </label>
                </br>
                <asp:Image runat="server" ID="imgProd" ImageUrl="~/image/title-logo.png"/>
                <br>
                <label class="label-field">Language: </label>
                <br>
                <asp:DropDownList runat="server" ID="ddlLanguage" CssClass="input-field">
                    <asp:ListItem>English</asp:ListItem>
                    <asp:ListItem>Chinese</asp:ListItem>
                    <asp:ListItem>Japanese</asp:ListItem>
                </asp:DropDownList>
                <br>
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Product/product.aspx" />
            </div>

        </div>
</asp:Content>
