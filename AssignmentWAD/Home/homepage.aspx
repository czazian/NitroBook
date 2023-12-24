<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="AssignmentWAD.Home.homepage"  %>

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

        <asp:LinkButton ID="btnNextPage" runat="server" CssClass="carousel-control-next" data-bs-target="#promotionSlider" data-bs-slide="next" >
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
                    <asp:HyperLink runat="server" ID="hrefB1" CssClass="hrefGrp w3-button w3-block w3-deep-orange w3-hover-red w3-round" Text="View More" NavigateUrl="~/BookCategories/newarrivals.aspx"  />
                </p>
            </div>
            <!-- First Photo Grid-->
            <div class="w3-row-padding w3-center group">
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB1" runat="server" ImageUrl="~/image/book/book12.jpg" CssClass="poster" /><br />
                    <br />
                    <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text="Suzume"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text="Makoto Shinkai"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice1" runat="server" CssClass="s3" Text="RM 20.00" ></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn1" PostBackUrl="~/Product/IndividualProduct.aspx?bookID=12" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" >
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB2" runat="server" ImageUrl="~/image/book/book26.jpg" CssClass="poster" /><br /><br />
                    <asp:Label ID="lblBookName2" runat="server" CssClass="s1" Text="Capturing Hope"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName2" runat="server" CssClass="s2" Text="Tun Dr Mahathir Mohamad"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice2" runat="server" CssClass="s3" Text="RM 100.00"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=26" ID="linkBtn2" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" >
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB3" runat="server" ImageUrl="~/image/book/book42.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName3" runat="server" CssClass="s1" Text="The Silent Patient" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName3" runat="server" CssClass="s2" Text="Orion" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice3" runat="server" CssClass="s3" Text="RM 49.90" ></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=42" ID="linkBtn3" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB4" runat="server" ImageUrl="~/image/book/book17.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName4" runat="server" CssClass="s1" Text="Harry Potter" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName4" runat="server" CssClass="s2" Text="J. K. Rowling" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice4" runat="server" CssClass="s3" Text="RM 47.50" ></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=17" ID="linkBtn4" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" >
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB5" runat="server" ImageUrl="~/image/book/book6.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName5" runat="server" CssClass="s1" Text="Chainsaw Man" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName5" runat="server" CssClass="s2" Text="Tatsuki Fujimoto" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice5" runat="server" CssClass="s3" Text="RM 49.90"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=6" ID="linkBtn5" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" >
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>

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
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB6" runat="server" ImageUrl="~/image/book/book18.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName6" runat="server" CssClass="s1" Text="The Maze Runner" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName6" runat="server" CssClass="s2" Text="James Dashner" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice6" runat="server" CssClass="s3" Text="RM 27.00" ></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=18" ID="LinkButton1" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" >
      Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB7" runat="server" ImageUrl="~/image/book/book5.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName7" runat="server" CssClass="s1" Text="Attack on Titan" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName7" runat="server" CssClass="s2" Text="Hajime Isayama" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice7" runat="server" CssClass="s3" Text="RM 45.00" ></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=5" ID="linkBtn7" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" >
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>

                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB8" runat="server" ImageUrl="~/image/book/book22.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName8" runat="server" CssClass="s1" Text="IT" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName8" runat="server" CssClass="s2" Text="Stephen King" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice8" runat="server" CssClass="s3" Text="RM 19.90"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=22" ID="linkBtn8" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" >
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>

                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB9" runat="server" ImageUrl="~/image/book/book19.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName9" runat="server" CssClass="s1" Text="The Shining"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName9" runat="server" CssClass="s2" Text="Stephen King"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice9" runat="server" CssClass="s3" Text="RM 56.50" ></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=19" ID="linkBtn9" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round" >
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>

                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB10" runat="server" ImageUrl="~/image/book/book24.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName10" runat="server" CssClass="s1" Text="The Hating Game"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName10" runat="server" CssClass="s2" Text="Thorne, Sally" ></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice10" runat="server" CssClass="s3" Text="RM 52.90" ></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton  PostBackUrl="~/Product/IndividualProduct.aspx?bookID=24" ID="linkBtn10" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round">
                                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
