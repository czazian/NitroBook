<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="product.css" rel="stylesheet">
    <script src="product.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Product</div>
                <div class="search-box">
                    <input type="text" name="searchValue" placeholder="Search...">
                    <button type="submit" value="submit"><i class='bx bx-search'></i></button>
                </div>
            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">

                <div>
                    <button class="form-button"><asp:HyperLink runat="server" ID="productCreateLink" NavigateUrl="~/Staff/Product/product_create.aspx">Create</asp:HyperLink></button>
                </div>

                <div class="sales-details">

                    <ul class="details">
                        <li class="topic">No.</li>
                        <li><a>1</a></li>
                        <li><a>2</a></li>
                        <li><a>3</a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Name</li>
                        <li><a href="#"><span class="product">Book 1</span></a></li>
                        <li><a href="#"><span class="product">Book 2</span></a></li>
                        <li><a href="#"><span class="product">Book 3</span></a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Price (RM)</li>
                        <li><a href="#">300</a></li>
                        <li><a href="#">400</a></li>
                        <li><a href="#">500</a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Category</li>
                        <li><a href="#">Comedy</a></li>
                        <li><a href="#">Horror</a></li>
                        <li><a href="#">Yellow</a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Operation</li>
                        <li class="txt-center">
                            <a><i class='bx bx-show'></i></a>
                            <a><i class='bx bxs-edit'></i></a>
                            <a><i class='bx bxs-trash'></i></a>
                        </li>
                        <li class="txt-center">
                            <a><i class='bx bx-show'></i></a>
                            <a><i class='bx bxs-edit'></i></a>
                            <a><i class='bx bxs-trash'></i></a>
                        </li>
                        <li class="txt-center">
                            <a><i class='bx bx-show'></i></a>
                            <a><i class='bx bxs-edit'></i></a>
                            <a><i class='bx bxs-trash'></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
