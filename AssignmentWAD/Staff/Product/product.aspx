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
                    <asp:LinkButton runat="server" ID="linkBtnSearch" OnClick="linkBtnSearch_Click"><i class='bx bx-search'></i></asp:LinkButton>
                </div>
            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">

                <div>
                    <asp:Button runat="server" ID="createProductBtn" Text="Create" CssClass="form-button" PostBackUrl="~/Staff/Product/product_create.aspx" />
                </div>

                <div class="sales-details">

                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
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

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Title</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("Title") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Price</li>
                        </HeaderTemplate>
                        <ItemTemplate>                           
                            <li>RM <%# Eval("Price") %></li>
                            <hr />
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
                            <hr />
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
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Quantity</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center"><%# Eval("Quantity") %></li>
                            <hr />
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
                                <a href="product_addStock.aspx?bookID=<%# Eval("BookID") %>"><i class='bx bxs-package'></i></a>
                                <asp:LinkButton runat="server" ID="Hyperlink1" OnClientClick='<%# CreateConfirmation(Eval("Title")) %>' OnCommand="delete_click" CommandName="deleteClick" CommandArgument='<%# Eval("BookID")%>'><i class='bx bxs-trash'></i></asp:LinkButton>
                            </li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Book]"></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Book] WHERE ([Title] LIKE '%' + @Title + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtSearch" Name="Title" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </div>
        </div>
    </div>
</asp:Content>
