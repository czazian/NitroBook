<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="AssignmentWAD.Home.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Banners-->
    <div id="promotionSlider" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <asp:ImageButton ImageUrl="~/image/banner1.png" runat="server" ID="imgBtnBanner1" CssClass="d-block w-100" AlternateText="Promotion" />
            </div>
            <div class="carousel-item">
                <asp:ImageButton ImageUrl="~/image/banner2.png" runat="server" ID="imgBtnBanner2" CssClass="d-block w-100" AlternateText="Promotion" />
            </div>
            <div class="carousel-item">
                <asp:ImageButton ImageUrl="~/image/banner3.png" runat="server" ID="imgBtnBanner3" CssClass="d-block w-100" AlternateText="Promotion" />
            </div>
        </div>

        <asp:LinkButton ID="btnPreviousPage" runat="server" CssClass="carousel-control-prev" data-bs-target="#promotionSlider" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </asp:LinkButton>

        <asp:LinkButton ID="btnNextPage" runat="server" CssClass="carousel-control-next" data-bs-target="#promotionSlider" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </asp:LinkButton>
    </div>



    <!--Temporary Book Content-->
    <div class="w3-main w3-content" style="max-width: 1200px; margin-top: 20px">
        <!-- New Arrivals Content -->
        <div class="w3-padding-16">
            <div class="w3-left subTitlePadding">
                <h2 style="font-size: 28px; padding-bottom: 16px">New Arrivals</h2>
            </div>
            <div class="w3-right" style="margin-bottom: 16px;">
                <p>
                    <asp:HyperLink runat="server" ID="hrefB1" CssClass="hrefGrp w3-button w3-block w3-deep-orange w3-hover-red w3-round" Text="View More" NavigateUrl="~/BookCategories/newarrivals.aspx" />
                </p>
            </div>
            <!-- First Photo Grid-->

            <!---->
            <div class="w3-row-padding w3-center group">
                <asp:Repeater runat="server" ID="Repeater1">
                    <ItemTemplate>
                        <div class="w3-quarter displayborder sContainers">
                            <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="poster" /><br />
                            <br />
                            <asp:Label ID="lblTitle" runat="server" CssClass="s1" Text='<%# Eval("Title") %>'></asp:Label><br />
                            <br />
                            <asp:Label ID="lblAuthor" runat="server" CssClass="s2" Text='<%# Eval("Author") %>'></asp:Label><br />
                            <br />
                            <asp:Label ID="lblPrice" runat="server" CssClass="s3" Text='<%# "RM " + Eval("Price") %>'></asp:Label><br />
                            <br />
                            <p>
                                <asp:LinkButton ID="lbBOOKS" PostBackUrl='<%# "~/Product/IndividualProduct.aspx?bookID=" + Eval("bookID") %>' runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                                </asp:LinkButton>
                            </p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <asp:SqlDataSource runat="server" ID="ds1"
                ConnectionString='<%$ ConnectionStrings:NitroBooks %>'
                SelectCommand="
                SELECT TOP 5 * 
                FROM Book
                WHERE NOT Quantity = 0 
                ORDER BY NEWID()" />
            <!---->

            <!-- MiddleBanner 1 -->
            <div class="w3-padding-16 w3-margin-left w3-margin-right w3-center">
                <asp:Image runat="server" ID="midBanner" CssClass="resize" ImageUrl="~/image/midBanner.jpg" />
            </div>

            <!-- Best Fiction Books Content -->
            <div class="w3-padding-16">
                <div class="w3-left subTitlePadding">
                    <h2 style="font-size: 28px; padding-bottom: 10px">Best Fiction Books</h2>
                </div>
                <div class="w3-right" style="margin-bottom: -6px;">
                    <p>
                        <asp:HyperLink runat="server" ID="hrefFiction" CssClass="hrefGrp w3-button w3-block w3-deep-orange w3-hover-red w3-round" Text="View More" NavigateUrl="~/BookCategories/fiction.aspx" />
                    </p>
                </div>
                <!-- Second Photo Grid-->
                <div class="w3-row-padding w3-padding-16 w3-center group">
                    <!---->
                    <div class="w3-row-padding w3-center group">
                        <asp:Repeater runat="server" ID="Repeater2">
                            <ItemTemplate>
                                <div class="w3-quarter displayborder sContainers">
                                    <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="poster" /><br />
                                    <br />
                                    <asp:Label ID="lblTitle" runat="server" CssClass="s1" Text='<%# Eval("Title") %>'></asp:Label><br />
                                    <br />
                                    <asp:Label ID="lblAuthor" runat="server" CssClass="s2" Text='<%# Eval("Author") %>'></asp:Label><br />
                                    <br />
                                    <asp:Label ID="lblPrice" runat="server" CssClass="s3" Text='<%# "RM " + Eval("Price") %>'></asp:Label><br />
                                    <br />
                                    <p>
                                        <asp:LinkButton ID="lbBOOKS" PostBackUrl='<%# "~/Product/IndividualProduct.aspx?bookID=" + Eval("bookID") %>' runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round">
                      Add to cart <i class="fa fa-shopping-cart"></i>
                                        </asp:LinkButton>
                                    </p>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <asp:SqlDataSource runat="server" ID="ds2"
                        ConnectionString='<%$ ConnectionStrings:NitroBooks %>'
                        SelectCommand="
                            SELECT TOP 5 * 
                            FROM Book
                            WHERE Category = 'Fiction' AND NOT Quantity = 0 
                            ORDER BY NEWID()" />
                    <!---->
                </div>
            </div>
        </div>
</asp:Content>
