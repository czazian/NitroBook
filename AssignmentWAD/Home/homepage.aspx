<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="AssignmentWAD.Home.homepage" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Banners-->
    <div id="promotionSlider" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <asp:ImageButton ImageUrl="~/image/banner1.png" runat="server" ID="imgBtnBanner1" CssClass="d-block w-100" AlternateText="Promotion" meta:resourcekey="imgBtnBanner1Resource1" />
            </div>
            <div class="carousel-item">
                <asp:ImageButton ImageUrl="~/image/banner2.png" runat="server" ID="imgBtnBanner2" CssClass="d-block w-100" AlternateText="Promotion" meta:resourcekey="imgBtnBanner2Resource1" />
            </div>
            <div class="carousel-item">
                <asp:ImageButton ImageUrl="~/image/banner3.png" runat="server" ID="imgBtnBanner3" CssClass="d-block w-100" AlternateText="Promotion" meta:resourcekey="imgBtnBanner3Resource1" />
            </div>
        </div>

        <asp:LinkButton ID="btnPreviousPage" runat="server" CssClass="carousel-control-prev" data-bs-target="#promotionSlider" data-bs-slide="prev" meta:resourcekey="btnPreviousPageResource1">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </asp:LinkButton>

        <asp:LinkButton ID="btnNextPage" runat="server" CssClass="carousel-control-next" data-bs-target="#promotionSlider" data-bs-slide="next" meta:resourcekey="btnNextPageResource1">
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
                    <asp:HyperLink runat="server" ID="hrefB1" CssClass="hrefGrp w3-button w3-block w3-deep-orange w3-hover-red w3-round" Text="View More" NavigateUrl="~/BookCategories/newarrivals.aspx" meta:resourcekey="hrefB1Resource1" />
                </p>
            </div>
            <!-- First Photo Grid-->
            <div class="w3-row-padding w3-center group">
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB1" runat="server" ImageUrl="~/image/book/book12.jpg" CssClass="poster" meta:resourcekey="imgB1Resource1" /><br />
                    <br />
                    <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text="Suzume" meta:resourcekey="lblBookName1Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text="Makoto Shinkai" meta:resourcekey="lblAuthorName1Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice1" runat="server" CssClass="s3" Text="RM 20.00" meta:resourcekey="lblPrice1Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn1" PostBackUrl="~/Product/IndividualProduct.aspx" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn1Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB2" runat="server" ImageUrl="~/image/book/book26.jpg" CssClass="poster" meta:resourcekey="imgB2Resource1" /><br /><br />
                    <asp:Label ID="lblBookName2" runat="server" CssClass="s1" Text="Capturing Hope" meta:resourcekey="lblBookName2Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName2" runat="server" CssClass="s2" Text="Tun Dr Mahathir Mohamad" meta:resourcekey="lblAuthorName2Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice2" runat="server" CssClass="s3" Text="RM 100.00" meta:resourcekey="lblPrice2Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn2" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn2Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB3" runat="server" ImageUrl="~/image/book/book42.jpg" CssClass="poster" meta:resourcekey="imgB3Resource1" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName3" runat="server" CssClass="s1" Text="The Silent Patient" meta:resourcekey="lblBookName3Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName3" runat="server" CssClass="s2" Text="Orion" meta:resourcekey="lblAuthorName3Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice3" runat="server" CssClass="s3" Text="RM 49.90" meta:resourcekey="lblPrice3Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn3" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn3Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB4" runat="server" ImageUrl="~/image/book/book17.jpg" CssClass="poster" meta:resourcekey="imgB4Resource1" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName4" runat="server" CssClass="s1" Text="Harry Potter" meta:resourcekey="lblBookName4Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName4" runat="server" CssClass="s2" Text="J. K. Rowling" meta:resourcekey="lblAuthorName4Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice4" runat="server" CssClass="s3" Text="RM 47.50" meta:resourcekey="lblPrice4Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn4" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn4Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB5" runat="server" ImageUrl="~/image/book/book6.jpg" CssClass="poster" meta:resourcekey="imgB5Resource1" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName5" runat="server" CssClass="s1" Text="Chainsaw Man" meta:resourcekey="lblBookName5Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName5" runat="server" CssClass="s2" Text="Tatsuki Fujimoto" meta:resourcekey="lblAuthorName5Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice5" runat="server" CssClass="s3" Text="RM 49.90" meta:resourcekey="lblPrice5Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn5" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn5Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>

        <!-- MiddleBanner 1 -->
        <div class="w3-padding-16 w3-margin-left w3-margin-right w3-center">
            <asp:Image runat="server" ID="midBanner" CssClass="resize" ImageUrl="~/image/midBanner.jpg" meta:resourcekey="midBannerResource1" />
        </div>

        <!-- Best Fiction Books Content -->
        <div class="w3-padding-16">
            <div class="w3-left subTitlePadding">
                <h2 style="font-size: 28px; padding-bottom: 10px">Best Fiction Books</h2>
            </div>
            <div class="w3-right" style="margin-bottom: -6px;">
                <p>
                    <asp:HyperLink runat="server" ID="hrefFiction" CssClass="hrefGrp w3-button w3-block w3-deep-orange w3-hover-red w3-round" Text="View More" NavigateUrl="~/BookCategories/fiction.aspx" meta:resourcekey="hrefFictionResource1" />
                </p>
            </div>
            <!-- Second Photo Grid-->
            <div class="w3-row-padding w3-padding-16 w3-center group">
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB6" runat="server" ImageUrl="~/image/book/book18.jpg" CssClass="poster" meta:resourcekey="imgB6Resource1" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName6" runat="server" CssClass="s1" Text="The Maze Runner" meta:resourcekey="lblBookName6Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName6" runat="server" CssClass="s2" Text="James Dashner" meta:resourcekey="lblAuthorName6Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice6" runat="server" CssClass="s3" Text="RM 27.00" meta:resourcekey="lblPrice6Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="LinkButton1Resource1">
      Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB7" runat="server" ImageUrl="~/image/book/book5.jpg" CssClass="poster" meta:resourcekey="imgB7Resource1" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName7" runat="server" CssClass="s1" Text="Attack on Titan" meta:resourcekey="lblBookName7Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName7" runat="server" CssClass="s2" Text="Hajime Isayama" meta:resourcekey="lblAuthorName7Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice7" runat="server" CssClass="s3" Text="RM 45.00" meta:resourcekey="lblPrice7Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn7" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn7Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>

                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB8" runat="server" ImageUrl="~/image/book/book22.jpg" CssClass="poster" meta:resourcekey="imgB8Resource1" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName8" runat="server" CssClass="s1" Text="IT" meta:resourcekey="lblBookName8Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName8" runat="server" CssClass="s2" Text="Stephen King" meta:resourcekey="lblAuthorName8Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice8" runat="server" CssClass="s3" Text="RM 19.90" meta:resourcekey="lblPrice8Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn8" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn8Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>

                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB9" runat="server" ImageUrl="~/image/book/book19.jpg" CssClass="poster" meta:resourcekey="imgB9Resource1" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName9" runat="server" CssClass="s1" Text="The Shining" meta:resourcekey="lblBookName9Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName9" runat="server" CssClass="s2" Text="Stephen King" meta:resourcekey="lblAuthorName9Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice9" runat="server" CssClass="s3" Text="RM 56.50" meta:resourcekey="lblPrice9Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn9" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn9Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>

                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB10" runat="server" ImageUrl="~/image/book/book24.jpg" CssClass="poster" meta:resourcekey="imgB10Resource1" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName10" runat="server" CssClass="s1" Text="The Hating Game" meta:resourcekey="lblBookName10Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName10" runat="server" CssClass="s2" Text="Thorne, Sally" meta:resourcekey="lblAuthorName10Resource1"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice10" runat="server" CssClass="s3" Text="RM 52.90" meta:resourcekey="lblPrice10Resource1"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn10" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" meta:resourcekey="linkBtn10Resource1">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
