<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="product_view.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">View Product</div>
                <label class="label-field">Title: </label>
                </br>
                <asp:TextBox runat="server" ID="txtTitle" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Description: </label>
                </br>
                <asp:TextBox runat="server" ID="txtDesc" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Author: </label>
                </br>
                <asp:TextBox runat="server" ID="txtAuthor" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Price: (RM XX.XX)</label></br>
                <%--                <input type="text" name="price" value="" class="input-field" pattern="(\d+\.\d{1,2})" required>--%>
                <asp:TextBox runat="server" ID="txtPrice" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                <br>
                    <label class="label-field">Category: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlProductCategory" CssClass="input-field" Enabled="False">
                    <asp:ListItem Text="New Arrivals" Value="New Arrivals"></asp:ListItem>
                    <asp:ListItem Text="Fiction" Value="Fiction"></asp:ListItem>
                    <asp:ListItem Text="Non-Fiction" Value="Non-Fiction" Selected="True"></asp:ListItem>
                    <asp:ListItem>Children&#39;s</asp:ListItem>
                    <asp:ListItem>Manga &amp; Light Novel</asp:ListItem>
                </asp:DropDownList>
                </br>
                    <label class="label-field">Sub-Category: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlSubCategory" CssClass="input-field" Enabled="False">
                    <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                    <asp:ListItem Text="Yellow" Value="Yellow"></asp:ListItem>
                    <asp:ListItem Text="Comedy" Value="Comedy" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                </br>
                <label class="label-field">Quantity: </label>
                </br>
                <asp:TextBox runat="server" ID="txtQuantity" CssClass="input-field" ReadOnly="True"></asp:TextBox>
                </br>
                     <label class="label-field">Image:</label></br>
                <asp:Image runat="server" ID="image" CssClass="width-25"/>
                <br>
                    <label class="label-field">Language: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlLanguage" CssClass="input-field" Enabled="false">
                    <asp:ListItem>English</asp:ListItem>
                    <asp:ListItem>Chinese</asp:ListItem>
                    <asp:ListItem>Japanese</asp:ListItem>
                </asp:DropDownList>
                </br>

                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Product/product.aspx" />
                <br />
            </div>

        </div>
</asp:Content>
