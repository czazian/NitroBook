<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="AssignmentWAD.Staff.Order.order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Order List</div>
                <div class="search-box">
                    <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..."></asp:TextBox>
                    <asp:LinkButton runat="server" ID="linkBtnSearch"><i class='bx bx-search'></i></asp:LinkButton>
                </div>
            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">

                <div class="sales-details">

                    <asp:Repeater ID="RepeaterOrder" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Order ID.</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("OrderID") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterMember" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Member</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# Eval("UserName") %></span></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterPhone" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Phone No</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# Eval("PhoneNo") %></span></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOrderDate" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Order Date</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# String.Format("{0:dd-MM-yyyy}", Eval("OrderDate")) %></span></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterAmountPaid" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Amount Paid (RM)</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><%# Eval("TotalAmount") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterStatus" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Status</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#" class="status"><%# Eval("Status") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOperation" runat="server" DataSourceID="SqlDataSourceOrder">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Operation</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <asp:HyperLink runat="server" ID="hrefView" NavigateUrl='<%# "~/Staff/Order/order_view.aspx?OrderID=" + Eval("OrderID") %>'><i class='bx bx-show'></i></asp:HyperLink>
                                <asp:HyperLink runat="server" ID="hrefEdit" NavigateUrl='<%# "~/Staff/Order/order_edit.aspx?OrderID=" + Eval("OrderID") %>'><i class='bx bxs-edit'></i></asp:HyperLink>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
    </div>

    <style>
        .Packing {
            color: darkblue !important;
        }

        .Shipping {
            color: orange !important;
        }

        .Delivery {
            color: lime !important;
        }
    </style>

    <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT
    U.UserName,
    U.PhoneNo,
    P.PaymentDate AS OrderDate, -- Assuming PaymentDate corresponds to the order date
    P.TotalAmount,
    O.Status,
    O.OrderID
FROM
    [User] U
JOIN
    [Order] O ON U.UserID = O.UserID
JOIN
    Payment P ON O.OrderID = P.OrderID;"></asp:SqlDataSource>
</asp:Content>
