<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="AssignmentWAD.Staff.Report.report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="report.css" rel="stylesheet">
    <script src="report.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">

        <div class="overview-boxes">
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Order</div>
                    <div class="number">3</div>
                    <div class="indicator">
                        <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                                <span class="text">Up from yesterday</span>-->
                    </div>
                </div>
                <i class='bx bx-cart-alt cart'></i>
            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">PRODUCT SALES</div>
                    <div class="number">5</div>
                    <div class="indicator">
                        <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                                <span class="text">Up from yesterday</span>-->
                    </div>
                </div>
                <i class='bx bxs-cart-add cart two'></i>
            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Quantity Sales</div>
                    <div class="number">20</div>
                    <div class="indicator">
                        <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                                <span class="text">Up from yesterday</span>-->
                    </div>
                </div>
                <i class='bx bxs-cart-add cart two'></i>
            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Profit</div>
                    <div class="number">RM 700</div>
                    <div class="indicator">
                        <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                                <span class="text">Up from yesterday</span>-->
                    </div>
                </div>
                <i class='bx bx-cart cart three'></i>
            </div>
        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Sales Report</div>

                <asp:DropDownList runat="server" ID="timeFilter">
                    <asp:ListItem Text="All" Value="all"></asp:ListItem>
                    <asp:ListItem Text="Today" Value="today"></asp:ListItem>
                    <asp:ListItem Text="Month" Value="month"></asp:ListItem>
                    <asp:ListItem Text="Year" Value="year"></asp:ListItem>
                </asp:DropDownList>


                <div class="sales-details">

                    <ul class="details">
                        <li class="topic">No.</li>

                        <li><a href="#">1</a></li>

                    </ul>
                    <ul class="details">
                        <li class="topic">Product</li>

                        <li><a href="">Suzume</a></li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Staff/Product/product.aspx"></asp:HyperLink>

                    </ul>
                    <ul class="details">
                        <li class="topic">Price</li>
                        <li><a href="#">RM 300</a></li>

                    </ul>
                    <ul class="details txt-center">
                        <li class="topic">Sold</li>

                        <li><a href="#">3</a></li>

                    </ul>
                    <ul class="details">
                        <li class="topic">Total</li>

                        <li><a href="#">RM 900</a></li>

                    </ul>
                </div>

            </div>
            <div class="top-sales box">
                <div class="title">Top 5 Product</div>
                <span>Quantity Sold</span>
                <ul class="top-sales-details">

                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Staff/Product/product.aspx">
                                <asp:Image runat="server" ImageUrl="~/image/book1.jpg" />
                                <span runat="server" class="product">Suzume</span>
                        </asp:HyperLink>
                        <span runat="server" class="quantitySold">3</span>
                    </li>

                </ul>
            </div>
            <div class="top-sales box">
                <div class="title">Least 5 Product</div>
                <span>Quantity Sold</span>
                <ul class="top-sales-details">

                    <li>
                        <asp:HyperLink runat="server" NavigateUrl="~/Staff/Product/product.aspx">
                                <asp:Image runat="server" ImageUrl="~/image/book1.jpg" />
                                <span runat="server" class="product">Suzume</span>
                        </asp:HyperLink>
                        <span runat="server" class="quantitySold">3</span>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</asp:Content>


