﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="AssignmentWAD.Staff.Dashboard.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="dashboard.css" rel="stylesheet">
    <script src="dashboard.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">

        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Welcome to Staff Portal</div>
            </div>
        </div>

        <div class="sales-boxes" style="font-size: medium">

            <div class="recent-sales box">
                <div class="title" style="font-weight: bold; font-style: italic; font-variant: normal;">Recent Order</div>
                <br />

                <div class="sales-details">

                    <asp:Repeater ID="RepeaterOrder" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Order ID</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><%# Eval("OrderID") %>.</li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterMember" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Member</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><%# Eval("UserName") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOrderDate" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Order Date</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><%# String.Format("{0:dd-MM-yyyy}", Eval("OrderDate")) %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterAmountPaid" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Amount Paid</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">RM <%# Eval("TotalAmount") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterStatus" runat="server" DataSourceID="SqlDataSourceOrder" OnItemDataBound="RepeaterStatus_ItemDataBound">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Status</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>'></asp:Label>

                            </li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOperation" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Operation</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <asp:HyperLink runat="server" ID="hrefView" NavigateUrl='<%# "~/Staff/Order/order_view.aspx?OrderID=" + Eval("OrderID") %>'><i class='bx bx-show'></i></asp:HyperLink>
                                <asp:HyperLink runat="server" ID="hrefEdit" NavigateUrl='<%# "~/Staff/Order/order_edit.aspx?OrderID=" + Eval("OrderID") %>'><i class='bx bxs-edit'></i></asp:HyperLink>
                            </li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div class="sales-boxes">

            <div class="recent-sales box" style="font-size: large">
                <div class="title" style="font-weight: bold; font-style: italic; font-variant: normal;">Low Stock Product</div>
                <br />
                <div class="sales-details">
                    <asp:Panel ID="pnlLowStock" runat="server" Visible='<%# HasLowStockProducts() %>'>

                        <asp:Repeater ID="RepeaterImage" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Image</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li>
                                    <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="poster" Height="90" Width="70" /><br />
                                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="Panel1" runat="server" Visible='<%# HasLowStockProducts() %>'>

                        <asp:Repeater ID="RepeaterProduct" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Product</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>

                                <li>
                                    <%# Eval("Title") %>
                                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul> 
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Visible='<%# HasLowStockProducts() %>'>

                        <asp:Repeater ID="RepeaterPrice" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Price</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="txt-center">RM <%# Eval("Price") %>
                                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="Panel3" runat="server" Visible='<%# HasLowStockProducts() %>'>
                        <asp:Repeater ID="RepeaterQuantity" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Stock</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="txt-center">
                                    <%# Eval("Quantity") %>
                                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <asp:Panel ID="Panel4" runat="server" Visible='<%# HasLowStockProducts() %>'>
                        <asp:Repeater ID="RepeaterOperationLow" runat="server" DataSourceID="SqlDataSourceLowStock">
                            <HeaderTemplate>
                                <ul class="details">
                                    <hr />
                                    <li class="topic">Operation</li>
                                    <hr />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="txt-center">
                                    <a href="../Product/product_addStock.aspx?bookID=<%# Eval("BookID") %>"><i class='bx bxs-package'">Add</i></a>
                                </li>
                                <br />
                                <br />
                                <br />
                                <br />
                                <hr />
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>

                    </asp:Panel>

                </div>
                <br />
                <!-- Display message if no low stock products -->
                <asp:Panel ID="pnlNoLowStock" runat="server">
                    <p>No low stock product records.</p>
                </asp:Panel>
                <br />
            </div>
            <asp:SqlDataSource ID="SqlDataSourceLowStock" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>"
                SelectCommand="SELECT TOP 5 BookID, Image, Title, Price, Quantity FROM [Book] WHERE Quantity < 10 ORDER BY Quantity ASC;"></asp:SqlDataSource>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="
        SELECT TOP 5
            U.UserName,
            P.PaymentDate AS OrderDate,
            P.TotalAmount,
            O.Status,
            O.OrderID
        FROM
            [User] U
        JOIN
            [Order] O ON U.UserID = O.UserID
        JOIN
            Payment P ON O.OrderID = P.OrderID
        ORDER BY
            O.OrderID DESC,
            P.PaymentDate DESC;"></asp:SqlDataSource>

</asp:Content>

