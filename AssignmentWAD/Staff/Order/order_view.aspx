<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="order_view.aspx.cs" Inherits="AssignmentWAD.Staff.Order.order_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">

            <div class="sales-boxes">
                <!--                        order info-->
                <div class="recent-sales box">
                    <div class="title">Customer Info</div>
                    <label class="label-field">Full Name</label></br>
                            <asp:TextBox runat="server" ID="txtFullName" Text="Zi An" CssClass="input-field" Enabled="false"></asp:TextBox>
                    <br>
                        <label class="label-field">Email</label></br>
                    <asp:TextBox runat="server" ID="txtEmail" Text="koyasi@gmail.com" CssClass="input-field" Enabled="false"></asp:TextBox>
                    <br>
                        <label class="label-field">Phone No</label></br>
                    <asp:TextBox runat="server" ID="txtPhoneNo" Text="011 12345678" CssClass="input-field" Enabled="false"></asp:TextBox>
                    <br>
                </div>

                <!--                        customer info-->
                <div class="recent-sales box">
                    <div class="title">Order Info</div>
                    <label class="label-field">Address </label>
                    </br>
                    <asp:TextBox runat="server" ID="txtAddress" Text="no 5, jalan Bunga Raya" CssClass="input-field" Enabled="false"></asp:TextBox>
                    <br>
                        <label class="label-field">Subtotal (RM) </label>
                    </br>
                    <asp:TextBox runat="server" ID="txtSubtotal" Text="300" CssClass="input-field" Enabled="false"></asp:TextBox>
                    <br>
                        <label class="label-field">Shipping Fee (RM)</label></br>
                    <asp:TextBox runat="server" ID="txtShippingFee" Text="4.50" CssClass="input-field" Enabled="false"></asp:TextBox>
                    <br>
                        <label class="label-field">Total Amount (RM)</label></br>
                    <asp:TextBox runat="server" ID="txtTotalAmount" Text="304.50" CssClass="input-field" Enabled="false"></asp:TextBox>
                    <br>
                        <label class="label-field">Order Date: </label>
                    </br>
                    <asp:TextBox runat="server" ID="txtOrderDate" Text="1/12/2023" CssClass="input-field" Enabled="false"></asp:TextBox>
                    <br>
                        <label class="label-field">Status </label>
                    </br>
                    <asp:DropDownList runat="server" ID="ddlStatus" Enabled="false" CssClass="input-field">
                        <asp:ListItem Text="Packing" Value="Packing" Selected="False"></asp:ListItem>
                        <asp:ListItem Text="Shipping" Value="Shipping"></asp:ListItem>
                        <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                    </asp:DropDownList>

                    <br>
                </div>

            </div>

            <!--                    order detail-->
            <div class="sales-boxes">
                <div class="recent-sales box">
                    <div class="title">Order Detail</div>

                    <div class="sales-details">
                        <ul class="details">
                            <li class="topic">No.</li>
                            <li><a>1</a></li>
                            <li><a>2</a></li>
                        </ul>
                        <ul class="details">
                            <li class="topic">Product</li>
                            <li><a>Suzume</a></li>
                            <li><a>book 2</a></li>
                        </ul>
                        <ul class="details">
                            <li class="topic">Price (RM)</li>
                            <li><a>300</a></li>
                            <li><a>400</a></li>
                        </ul>
                        <ul class="details">
                            <li class="topic">Quantity</li>
                            <li><a>1</a></li>
                            <li><a>1</a></li>
                        </ul>
                    </div>

                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Order/order.aspx" />
                </div>
            </div>
</asp:Content>
