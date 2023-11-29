<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="IndividualProduct.aspx.cs" Inherits="AssignmentWAD.Order.IndividualProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="IndividualProductPage.css" rel="stylesheet" />
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-details container" style="padding: 50px 25px; width: 75%; height: 75%; border: 1px solid gray; border-radius: 10px">
        <div id="row2" class="row outer-cont">
            <div id="product-pic" class="col-4">
                <asp:Image ID="imgBook" runat="server" ImageUrl="~/image/book1.jpg" Width="100%" />
            </div>
            <div class="product-details col-8">
                <div class="title" style="text-align: center;">
                    <asp:Label runat="server" ID="lblBookName" CssClass="s1" Text="Suzume" Style="font-size: 20px; font-weight: bold"></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="lblAuthorName" CssClass="s2" Text="Makoto Shinkai"></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="lblPrice" CssClass="s3 info" Text="RM 20.00"></asp:Label>
                    <br />
                </div>

                <hr>

                <div>
                    <!-- Product languages here -->
                    <div class="details-row row" style="display: flex;">
                        <div class="col-3">
                            <p style="font-weight: bold; text-align: right;">Language:</p>
                        </div>
                        <div class="col-9">
                            <asp:Label runat="server" ID="lblLanguage" Text="Japanese"></asp:Label>
                        </div>
                        <br />
                        <br />
                    </div>

                    <!-- Product availability here -->
                    <div class="details-row row">
                        <div class="col-3">
                            <p style="font-weight: bold; text-align: right;">Availability:</p>
                        </div>
                        <div class="col-9">
                            <asp:Label runat="server" ID="lblAvailability" Text="2 Units Left"></asp:Label><br />
                            <br />
                        </div>
                    </div>


                    <!-- Product delivery duration here -->
                    <div class="details-row row">
                        <div class="col-3">
                            <p style="font-weight: bold; text-align: right;">Delivery duration:</p>
                        </div>
                        <div class="col-9">
                            <asp:Label runat="server" ID="lblDelivery" Text="3 - 5 Working Days"></asp:Label><br />
                            <br />
                        </div>
                    </div>

                    <!-- Product description -->
                    <div class="details-row row">
                        <div class="col-3">
                            <p style="font-weight: bold; text-align: right; margin-top: 4px;">Description:</p>
                        </div>
                        <div class="col-9" style="line-height: 25px; text-align: justify">
                            <asp:Label ID="lblDescription" runat="server" Text="She followed the young man named Souta to an abandoned location in the forest. But what was there was just an old white door in the middle things started to happen...">
                            </asp:Label><br />
                            <br />
                        </div>
                    </div>

                    <br />

                    <!-- Input product quantity here -->
                    <div class="row details-row">
                        <div class="col-3">
                            <p style="font-weight: bold; text-align: right; margin-top: 2px;">Quantity:</p>
                        </div>
                        <div class="col-9">
                            <div class="input-group">
                                <!--Minus 1-->
                                <span class="input-group-btn">
                                    <asp:LinkButton OnClientClick="return false" runat="server" ID="btnMinus" CssClass="quantity-left-minus btn btn-danger btn-number" data-type="minus" data-field="">
                                        <i class="fa-solid fa-minus"></i>
                                    </asp:LinkButton>
                                </span>
                                <!--Display Qty-->
                                <asp:TextBox AutoPostBack="true" Text="1" ID="txtQuantity" runat="server" Style="border-color: #f0f0f0; text-align: center;" type="text" TextMode="Number" min="1" max="100" CssClass="noSpinners quantity" />
                                <!--Add 1-->
                                <span class="input-group-btn">
                                    <span class="input-group-btn">
                                        <asp:LinkButton OnClientClick="return false" runat="server" ID="btnAdd" CssClass="quantity-right-plus btn btn-danger btn-number" data-type="plus" data-field="">
                                            <i class="fa-solid fa-plus"></i>
                                        </asp:LinkButton>
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <br />

                    <!-- Add to card button here -->
                    <div class="row details-row" style="justify-content: center;">
                        <div class="col-6" style="display: flex;">
                            <asp:Button PostBackUrl="~/Order/cart.aspx" runat="server" ID="btnCart" CssClass="btn btn-danger" Style="background-color: #cc3300; width: 100%; margin-top: 15px;" Text="Add to cart"/>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>



<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
    <script type="text/javascript" src="IndividualProductPage.js"></script>
</asp:Content>
