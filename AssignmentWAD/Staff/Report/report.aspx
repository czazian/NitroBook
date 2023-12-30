<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="AssignmentWAD.Staff.Report.report" %>

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
                    <div class="number">
                        <asp:Label ID="lblTotalOrder" runat="server">0</asp:Label>
                    </div>
                    <div class="indicator">
                        <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                                <span class="text">Up from yesterday</span>-->
                    </div>
                </div>
                <i class='bx bx-cart-alt cart'></i>
            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Quantity Sold</div>
                    <div class="number">
                        <asp:Label ID="lblQuanSales" runat="server">0</asp:Label>
                    </div>
                    <div class="indicator">
                        <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                                <span class="text">Up from yesterday</span>-->
                    </div>
                </div>
                <i class='bx bxs-cart-add cart two'></i>
            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Sales Profit</div>
                    <div class="number">
                        RM 
                        <asp:Label ID="lblSalesProfit" runat="server">0</asp:Label>
                    </div>
                    <div class="indicator">
                        <!--                                <i class='bx bx-up-arrow-alt'></i>
                                                                <span class="text">Up from yesterday</span>-->
                    </div>
                </div>
                <i class='bx bxs-cart-add cart three'></i>
            </div>
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Profit</div>
                    <div class="number">
                        RM
                        <asp:Label ID="lblTotalProfit" runat="server">0</asp:Label>
                    </div>
                    <div class="indicator">
                    </div>
                </div>
                <i class='bx bx-cart cart three'></i>
            </div>
        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Sales Report</div>

                <asp:DropDownList runat="server" ID="timeFilter" OnSelectedIndexChanged="timeFilter_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="All Time" Value="all" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="This Year" Value="year"></asp:ListItem>
                    <asp:ListItem Text="This Month" Value="month"></asp:ListItem>
                    <asp:ListItem Text="Today" Value="today"></asp:ListItem>
                </asp:DropDownList>


                <div class="sales-details">

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">No</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Container.ItemIndex + 1 %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Product</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Title") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Pirce</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>RM <%# Eval("Price") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Sold</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><%# Eval("Quantity Sold") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Total</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>RM <%# Eval("Total Price") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                </br>
                </br>
                 <asp:Label ID="lblNoRecord" runat="server"></asp:Label>
            </div>
            <div class="top-sales box">

                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource2">
                    <HeaderTemplate>
                        <div class="title">Top 10 Product</div>
                        <div style="display:flex;justify-content:space-between; height:25px;">
                            <div>Rank</div>
                            <div>Sold</div>
                        </div>
                        <ul class="top-sales-details">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <a href="../Product/product_view.aspx?bookID=<%# Eval("BookID") %>">
                                <span class="product mr-20 ml-10"><%# Container.ItemIndex + 1 %></span>
                                <img src="../../<%# Eval("Image").ToString().Substring(1) %>">
                                <span class="product"><%# Eval("Title") %></span>
                            </a>
                            &nbsp;<span class="quantitySold"><%# Eval("Quantity Sold") %></span></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
                </br>
                <asp:Label ID="lblTop" runat="server"></asp:Label>
            </div>

            <div class="top-sales box">

                <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource3">
                    <HeaderTemplate>
                        <div class="title">Least 10 Product</div>
                        <div style="display:flex;justify-content:space-between; height:25px;">
                            <div>Rank</div>
                            <div>Sold</div>
                        </div>
                        <ul class="top-sales-details">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <a href="~/Staff/Product/product_view.aspx?bookID=<%# Eval("BookID") %>">
                                <span class="product mr-20 ml-10"><%# Container.ItemIndex + 1 %></span>
                                <img src="<%# Eval("Image").ToString().Substring(1) %>">
                                <span class="product"><%# Eval("Title") %></span>
                            </a>
                            &nbsp;<span class="quantitySold"><%# Eval("Quantity Sold") %></span></li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
                </br>
                <asp:Label ID="lblLeast" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>"></asp:SqlDataSource>
</asp:Content>


