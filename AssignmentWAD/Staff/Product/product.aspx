<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Product</div>
                <div class="search-box">
                    <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..."></asp:TextBox>
                    <asp:LinkButton runat="server" ID="linkBtnSearch"><i class='bx bx-search'></i></asp:LinkButton>
                </div>
            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">

                <div>
                    <button class="form-button">
                        <asp:HyperLink runat="server" ID="productCreateLink" NavigateUrl="~/Staff/Product/product_create.aspx">Create</asp:HyperLink></button>
                </div>

                <div class="sales-details">

                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">No</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# DataBinder.Eval(Container, "ItemIndex", "")%></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Title</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Title") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
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

                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Category</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Category") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Language</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Language") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater6_ItemCommand">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Operation</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <%--still trying make it query string send and retrieve work--%>
                                <a href="product_view.aspx?bookID=<%# Eval("BookID") %>"><i class='bx bx-show'></i></a>
                                <a href="product_edit.aspx?bookID=<%# Eval("BookID") %>"><i class='bx bxs-edit'></i></a>
                                <asp:HyperLink runat="server" ID="Hyperlink1" NavigateUrl=""><i class='bx bxs-trash'></i></asp:HyperLink>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [BookID], [Title], [Description], [Author], [Price], [Category], [Quantity], [Language] FROM [Book]"></asp:SqlDataSource>
                <br />
                <br />
            </div>
        </div>
    </div>
</asp:Content>
