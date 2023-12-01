<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeFile="product_create.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product_create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="product.css" rel="stylesheet">
    <script src="product.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">Create Product</div>
                <label class="label-field">Name: </label>
                </br>
                            <input type="text" name="name" value="" class="input-field" required>
                <br>
                    <label class="label-field">Price: (RM XX.XX)</label></br>
                <input type="text" name="price" value="" class="input-field" pattern="(\d+\.\d{1,2})" required>
                <br>
                    <label class="label-field">Description: </label>
                </br>
                <input type="text" name="description" value="" class="input-field" required>
                <br>
                    <label class="label-field">Category: </label>
                </br>
                <select name="product_category" class="input-field" required>
                    <option value="">Horror</option>
                    <option value="">Yellow</option>
                    <option value="">Comedy</option>
                </select>
                <br>
                    <label class="label-field">Image: </label>
                </br>
                <input type="file" name="image" class="input-field" required>
                <!--                            <img src="../img/" class="img-file">-->
                <br>
                <button type="submit" class="form-button" value="submit" onclick="return confirm('Are you sure to create product?')">Submit</button>
                <button class="form-button"><asp:HyperLink runat="server" ID="productLink" NavigateUrl="~/Staff/Product/product.aspx">Back</asp:HyperLink></button>
            </div>

        </div>
</asp:Content>
