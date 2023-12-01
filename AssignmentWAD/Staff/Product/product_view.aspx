<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeFile="product_view.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">View Product</div>
                <label class="label-field">Name: </label>
                </br>
                <asp:TextBox runat="server" ID="txtName" CssClass="input-field" Text="Suzume" Enabled="False"></asp:TextBox>
                <br>
                    <label class="label-field">Price: (RM XX.XX)</label></br>
                <%--                <input type="text" name="price" value="" class="input-field" pattern="(\d+\.\d{1,2})" required>--%>
                <asp:TextBox runat="server" ID="txtPrice" CssClass="input-field" Text="300" Enabled="False"></asp:TextBox>
                <br>
                    <label class="label-field">Description: </label>
                </br>
                <asp:TextBox runat="server" ID="txtDesc" CssClass="input-field" Text="Nice Book haha~" Enabled="False"></asp:TextBox>
                <br>
                    <label class="label-field">Category: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlProductCategory" CssClass="input-field" Enabled="False">
                    <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                    <asp:ListItem Text="Yellow" Value="Yellow"></asp:ListItem>
                    <asp:ListItem Text="Comedy" Value="Comedy" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <br>
                    <label class="label-field">Image: </label>
                </br>
                <asp:Image runat="server" ID="imgProd" ImageUrl="~/image/book1.jpg" CssClass="img-file"/>

                <br>
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button"/>
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Product/product.aspx"/>
            </div>

        </div>
</asp:Content>
