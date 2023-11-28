<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="IndividualProduct.aspx.cs" Inherits="AssignmentWAD.Order.IndividualProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-details container" style="padding: 50px 25px;">
        <div id="row2" class="row outer-cont">
            <div id="product-pic" class="col-4">
                <asp:Image runat="server" ID="imgBook" ImageUrl="~/image/book1.jpg" CssClass="BookImage" />
            </div>
            <div class="product-details col-8">
                <div style="text-align: center;">
                    <asp:Label runat="server" ID="lblBookName" CssClass="s1" Text="Suzume"></asp:Label>
                    <asp:Label runat="server" ID="lblAuthorName" CssClass="s2" Text="Makoto Shinkai"></asp:Label>
                    <asp:Label runat="server" ID="lblPrice" CssClass="s3" Text="RM 20.00"></asp:Label>
                </div>

                <hr>

                <div>
                    <!-- Product languages here -->
                    <div class="details-row row" style="display: flex;">
                        <div class="col-5">
                            <p>Language:</p>
                        </div>
                        <div class="col-7">
                            <asp:Label CssClass="info" runat="server" ID="lblLanguage" Text="Japanese"></asp:Label>
                        </div>
                    </div>

                    <!-- Product availability here -->
                    <div class="details-row row">
                        <div class="col-5">
                            <p>Availability:</p>
                        </div>
                        <div class="col-7">
                            <asp:Label CssClass="info" runat="server" ID="lblAvailability" Text="Only 2 Units Left"></asp:Label>
                        </div>
                    </div>


                    <!-- Product delivery duration here -->
                    <div class="details-row row">
                        <div class="col-5">
                            <p>Delivery duration:</p>
                        </div>
                        <div class="col-7">
                            <asp:Label CssClass="info" runat="server" ID="lblDelivery" Text="3 - 5 Working Days"></asp:Label>
                        </div>
                    </div>

                    <!-- Product description -->
                    <div class="details-row row">
                        <div class="col-5">
                            <p>Description:</p>
                        </div>
                        <div class="col-7">
                            <p>
                                <b>She followed the young man named Souta to an abandoned location in the
                                            forest. But what was there was just an old white door in the middle of the
                                            ruins. As if summoned, Suzume turned the doorknob. But suddenly strange
                                            things
                                            started to happen...
                                </b>
                            </p>
                            <button onclick="myFunction()" id="myBtn" style="background-color: #fa4d4d; border-color: #fa4d4d; color: #ffff;">Read more</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
