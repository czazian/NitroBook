<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="order_view.aspx.cs" Inherits="AssignmentWAD.Staff.Order.order_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">

        <div class="sales-boxes">
            <!--                        order info-->
            <div class="recent-sales box">
                <div class="title">Customer Info</div>
                </br>
                    <label class="label-field">Full Name:</label></br></br>
                            <asp:TextBox runat="server" ID="txtFullName" CssClass="input-field" Enabled="false"></asp:TextBox>
                <br>
                    <label class="label-field">Member Email:</label></br>
                </br>
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="input-field" Enabled="false"></asp:TextBox>
                <br>
                    <label class="label-field">Phone No:</label></br>
                </br>
                    <asp:TextBox runat="server" ID="txtPhoneNo" CssClass="input-field" Enabled="false"></asp:TextBox>
                <br>
            </div>

            <!--                        customer info-->
            <div class="recent-sales box">
                <div class="title">Order Info</div>
                </br>
                        <label class="label-field">Payment Method: </label>
                </br></br>
                    <asp:TextBox runat="server" ID="txtPayMethod" CssClass="input-field" Enabled="false"></asp:TextBox>
                <br>
                    <label class="label-field">Shipping Address:</label>
                </br>
                </br>
                    <asp:TextBox runat="server" ID="txtShippingAdd" CssClass="input-field" Enabled="false"></asp:TextBox>
                <br>
                    <label class="label-field">Total Amount (RM):</label></br>
                </br>
                    <asp:TextBox runat="server" ID="txtTotalAmount" CssClass="input-field" Enabled="false"></asp:TextBox>
                <br>
                    <label class="label-field">Order Date: </label>
                </br>
                </br>
                    <asp:TextBox runat="server" ID="txtOrderDate" CssClass="input-field" Enabled="false"></asp:TextBox>
                <br>
                    <label class="label-field">Status:</label></br>
                </br>
                    <asp:DropDownList runat="server" ID="ddlStatus" Enabled="false" CssClass="input-field">
                        <asp:ListItem Value="Pending" Selected="False"></asp:ListItem>
                        <asp:ListItem Value="Shipping"></asp:ListItem>
                        <asp:ListItem Value="Delivered"></asp:ListItem>
                    </asp:DropDownList>
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Order/order.aspx" />
                <br>
            </div>

        </div>

        <!--                    order detail-->
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Order Detail</div>

                <div class="sales-details">
                    <asp:Repeater ID="RepeaterNo" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">No.</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Container.ItemIndex + 1 %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterProduct" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Product</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Title") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterQuantity" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Quantity</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Quantity") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterPrice" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Price (RM)</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Price") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>"
                    SelectCommand="SELECT B.Title, B.Price, OD.Quantity
                   FROM [Order] O
                   JOIN OrderDetails OD ON O.OrderID = OD.OrderID
                   JOIN Book B ON OD.BookID = B.BookID
                   WHERE O.OrderID = @OrderID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="OrderID" QueryStringField="OrderID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
</asp:Content>
