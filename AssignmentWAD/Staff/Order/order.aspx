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

                    <ul class="details">
                        <li class="topic">No.</li>
                        <li><a>1</a></li>
                        <li><a>2</a></li>
                        <li><a>3</a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Member</li>
                        <li><a href="#"><span class="product">Zi An</span></a></li>
                        <li><a href="#"><span class="product">Angeline</span></a></li>
                        <li><a href="#"><span class="product">Kyan</span></a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Phone No</li>
                        <li><a href="#"><span class="product">011 12345678</span></a></li>
                        <li><a href="#"><span class="product">012 12345645</span></a></li>
                        <li><a href="#"><span class="product">045 45612378</span></a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Order Date</li>
                        <li><a href="#"><span class="product">1/12/2023</span></a></li>
                        <li><a href="#"><span class="product">1/12/2023</span></a></li>
                        <li><a href="#"><span class="product">2/12/2023</span></a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Amount Paid (RM)</li>
                        <li><a href="#">300</a></li>
                        <li><a href="#">400</a></li>
                        <li><a href="#">500</a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Status</li>
                        <li><a href="#" class="Packing">Packing</a></li>
                        <li><a href="#" class="Shipping">Shipping</a></li>
                        <li><a href="#" class="Delivery">Delivered</a></li>
                    </ul>
                    <ul class="details">
                        <li class="topic">Operation</li>
                        <li class="txt-center">
                            <asp:HyperLink runat="server" ID="hrefCreate" NavigateUrl="~/Staff/Order/order_view.aspx"><i class='bx bx-show'></i></asp:HyperLink>
                            <asp:HyperLink runat="server" ID="hrefEdit" NavigateUrl="~/Staff/Order/order_edit.aspx"><i class='bx bxs-edit'></i></asp:HyperLink>
                        </li>
                        <li class="txt-center">
                            <a><i class='bx bx-show'></i></a>
                            <a><i class='bx bxs-edit'></i></a>
                        </li>
                        <li class="txt-center">
                            <a><i class='bx bx-show'></i></a>
                            <a><i class='bx bxs-edit'></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <style>
    .Packing {
        color:darkblue!important;
    }
    .Shipping {
        color:orange!important;
    }
    .Delivery{
        color:lime!important;
    }
</style>
</asp:Content>
