<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="AssignmentWAD.Staff.Order.order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function onEnterKeyPress(event) {
            if (event.keyCode === 13) {
                document.getElementById('<%= linkBtnSearch.ClientID %>').click();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Order List</div>
                <div class="search-box">
                    <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..." ClientIDMode="Static" onkeypress="return onEnterKeyPress(event)"></asp:TextBox>
                    <asp:LinkButton runat="server" ID="linkBtnSearch" OnClick="linkBtnSearch_Click"><i class='bx bx-search'></i></asp:LinkButton>
                </div>
            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">

                <div class="sales-details">

                    <asp:Repeater ID="RepeaterOrder" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Order ID.</li>
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("OrderID") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterMember" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Member</li>
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# Eval("UserName") %></span></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterPhone" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Phone No</li>
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# Eval("PhoneNo") %></span></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOrderDate" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Order Date</li>
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a href="#"><span class="product"><%# String.Format("{0:dd-MM-yyyy}", Eval("OrderDate")) %></span></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterAmountPaid" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Amount Paid</li>
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><a href="#">RM <%# Eval("TotalAmount") %></a></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterStatus" runat="server" OnItemDataBound="RepeaterStatus_ItemDataBound">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Status</li>
                                <br />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>'></asp:Label></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="RepeaterOperation" runat="server">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Operation</li>
                                <br />
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
                    <br />
                </div>
                <asp:Label ID="lblNoRecordsFound" runat="server" Text="No matching records found." CssClass="lblNoRecord"></asp:Label>
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

        .lblNoRecord {
            text-align: center;
            line-height: 100px;
        }
    </style>
</asp:Content>
