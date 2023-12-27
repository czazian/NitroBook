<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="product_create.aspx.cs" Inherits="AssignmentWAD.Staff.Product.product_create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="product.css" rel="stylesheet">
    <script src="product.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">

                <div class="title">Create Product</div>
                <label class="label-field">Title: </label>
                </br>
                <asp:TextBox runat="server" ID="txtTitle" CssClass="input-field" AutoPostBack="True" EnableTheming="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                    <br />
                    <label class="label-field">Description: </label>
                </br>
                <asp:TextBox runat="server" ID="txtDesc" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
               </br>
                    <label class="label-field">Author: </label>
                </br>
                <asp:TextBox runat="server" ID="txtAuthor" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAuthor" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                </br>
                    <label class="label-field">Price: (RM XX.XX)</label></br>
                <%--                <input type="text" name="price" value="" class="input-field" pattern="(\d+\.\d{1,2})" required>--%>
                <asp:TextBox runat="server" ID="txtPrice" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
                </br>
                    <label class="label-field">Category: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlProductCategory" CssClass="input-field">
                    <asp:ListItem Text="Horror" Value="Horror"></asp:ListItem>
                    <asp:ListItem Text="Yellow" Value="Yellow"></asp:ListItem>
                    <asp:ListItem Text="Comedy" Value="Comedy" Selected="True"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlProductCategory" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </br>
                 </br>
                <label class="label-field">Quantity: </label>
                </br>
                <asp:TextBox runat="server" ID="txtQuantity" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtQuantity" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </br>
                 </br>
                     <label class="label-field">Image:</label></br>
                <asp:FileUpload runat="server" ID="newImgProd" CssClass="input-field" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="newImgProd" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br>
               </br>
                    <label class="label-field">Language: </label>
                </br>
                <asp:DropDownList runat="server" ID="ddlLanguage" CssClass="input-field">
                    <asp:ListItem>English</asp:ListItem>
                    <asp:ListItem>Chinese</asp:ListItem>
                    <asp:ListItem>Japanese</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlLanguage" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </br>
                 </br>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click" />
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="form-button" PostBackUrl="~/Staff/Product/product.aspx" CausesValidation="False" OnClick="btnBack_Click" />
            </div>

        </div>
</asp:Content>
