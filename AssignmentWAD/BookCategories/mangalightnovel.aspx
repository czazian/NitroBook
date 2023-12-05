<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="mangalightnovel.aspx.cs" Inherits="AssignmentWAD.BookCategories.manga_lightnovel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link rel="stylesheet" type="text/css" href="BookCategories.css" />
    <script>
        window.addEventListener("scroll", function () {
            let box = document.getElementById("box");
            var elementTarget = document.getElementById("btnCartPage");
            if (window.scrollY > (elementTarget.offsetTop + elementTarget.offsetHeight)) {
                box.style.top = 0;
            } else {
                box.style.top = "32vh";
            }
        });
    </script>

    <!-- Temporary Book Content -->
    <div class="row" id="content" style="position: relative;">

        <div id="box" class="col-2" style="width: 280px; height: 42vh; position: fixed; top: 32vh;">
            <!-- Category Name -->
            <h1 style="padding-left: 25px; padding-top: 20px; font-size: 20px; color: #fa6464;"><strong>Manga & Light Novel</strong></h1>
            <br />
            <div id="list-example" class="list-group">

                <asp:LinkButton ID="lkbSubCat1" runat="server" Text="Reincarnation" PostBackUrl="#list-item-1" CssClass="lkbSubCat"></asp:LinkButton><br />
                <asp:LinkButton ID="lkbSubCat2" runat="server" Text="Action" PostBackUrl="#list-item-2" CssClass="lkbSubCat"></asp:LinkButton><br />
                <asp:LinkButton ID="lkbSubCat3" runat="server" Text="Romance" PostBackUrl="#list-item-3" CssClass="lkbSubCat"></asp:LinkButton><br />
                <asp:LinkButton ID="lkbSubCat4" runat="server" Text="Slice-of-Life" PostBackUrl="#list-item-4" CssClass="lkbSubCat"></asp:LinkButton>


                <hr />
            </div>

            <h2 style="margin-left: 25px; font-size: 15px;"><strong>Price range</strong></h2>
            <br />
            <div style="display: flex; width: 100%; flex-flow: row nowrap">
                <div class="priceRangeForm" style="width: 100%;">
                    <asp:TextBox ID="txtMinPrice" runat="server" placeholder="Min RM" Width="60px" Style="font-size: 12px;"></asp:TextBox>
                    -
                <asp:TextBox ID="txtMaxPrice" runat="server" placeholder="Max RM" Width="60px" Style="font-size: 12px;"></asp:TextBox>

                    <asp:Button ID="btnPriceRange" runat="server" Text="Apply" CssClass="priceRange" />
                </div>
            </div>

        </div>

        <div>


            <!--Start of retriving records-->
            <div class="col-9" style="margin-left: 325px;" id="main">

                <!-- Sub Category Name -->
                <h1 style="padding-left: 15px; font-size: 35px;"><strong>Manga & Light Novel</strong></h1>
                <p style="float: right; margin-right: 20px; margin-top: 10px;">Showing 1 - 4</p>

                <!-- Start Filter Bar -->
                <div style="float: right; margin-right: 150px; padding-bottom: 10px;">

                    <asp:DropDownList ID="ddlFilter" runat="server" CssClass="ddlFilter" AutoPostBack="True">
                        <asp:ListItem Value="0">Price Low to High</asp:ListItem>
                        <asp:ListItem Value="1">Price High to Low</asp:ListItem>
                        <asp:ListItem Value="2">Book Name A-Z</asp:ListItem>
                        <asp:ListItem Value="3">Book Name Z-A</asp:ListItem>
                    </asp:DropDownList>


                </div>
                <!-- End Filter Bar -->


                <!-- Photo Grid-->
                <h1 id="list-item-1" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Reincarnation</strong></h1>
                <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB1" runat="server" ImageUrl="~/image/book/book12.jpg" CssClass="poster" /><br />
                        <br />
                        <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text="Suzume"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text="Makoto Shinkai"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice1" runat="server" CssClass="s3" Text="RM 20.00"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus" runat="server" CssClass="status" Text="In stock"></asp:Label><br />
                        <br />
                        <p>

                            <asp:LinkButton ID="btnAddToCart" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnBuyNow" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnViewMore" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>

                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB2" runat="server" ImageUrl="~/image/book/book26.jpg" CssClass="poster" /><br />
                        <br />
                        <asp:Label ID="lblBookName2" runat="server" CssClass="s1" Text="Capturing Hope"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthorName2" runat="server" CssClass="s2" Text="Tun Dr Mahathir Mohamad"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice2" runat="server" CssClass="s3" Text="RM 100.00"></asp:Label><br />
                        <br />
                        <asp:Label ID="Label1" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB3" runat="server" ImageUrl="~/image/book/book42.jpg" CssClass="poster" />
                        <br />
                        <br />
                        <asp:Label ID="lblBookName3" runat="server" CssClass="s1" Text="The Silent Patient"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthorName3" runat="server" CssClass="s2" Text="Orion"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice3" runat="server" CssClass="s3" Text="RM 49.90"></asp:Label><br />
                        <br />
                        <asp:Label ID="Label2" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB4" runat="server" ImageUrl="~/image/book/book17.jpg" CssClass="poster" />
                        <br />
                        <br />
                        <asp:Label ID="lblBookName4" runat="server" CssClass="s1" Text="Harry Potter"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthorName4" runat="server" CssClass="s2" Text="J. K. Rowling"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice4" runat="server" CssClass="s3" Text="RM 47.50"></asp:Label><br />
                        <br />
                        <asp:Label ID="Label3" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton7" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton8" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton9" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>


                </div>



                <!-- Photo Grid-->
                <h1 id="list-item-2" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Action</strong></h1>
                <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB5" runat="server" ImageUrl="~/image/book/book12.jpg" CssClass="poster" /><br />
                        <br />
                        <asp:Label ID="lblBookName5" runat="server" CssClass="s1" Text="Suzume"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor5" runat="server" CssClass="s2" Text="Makoto Shinkai"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice5" runat="server" CssClass="s3" Text="RM 20.00"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus5" runat="server" CssClass="status" Text="In stock"></asp:Label><br />
                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton10" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton11" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton12" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>

                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB6" runat="server" ImageUrl="~/image/book/book26.jpg" CssClass="poster" /><br />
                        <br />
                        <asp:Label ID="lblBookName6" runat="server" CssClass="s1" Text="Capturing Hope"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor6" runat="server" CssClass="s2" Text="Tun Dr Mahathir Mohamad"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice6" runat="server" CssClass="s3" Text="RM 100.00"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus6" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton13" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton14" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton15" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="ImageB7" runat="server" ImageUrl="~/image/book/book42.jpg" CssClass="poster" />
                        <br />
                        <br />
                        <asp:Label ID="lblBookName7" runat="server" CssClass="s1" Text="The Silent Patient"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor7" runat="server" CssClass="s2" Text="Orion"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice7" runat="server" CssClass="s3" Text="RM 49.90"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus7" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton16" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton17" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton18" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB8" runat="server" ImageUrl="~/image/book/book17.jpg" CssClass="poster" />
                        <br />
                        <br />
                        <asp:Label ID="lblBookName8" runat="server" CssClass="s1" Text="Harry Potter"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor8" runat="server" CssClass="s2" Text="J. K. Rowling"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice8" runat="server" CssClass="s3" Text="RM 47.50"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus8" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton19" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton20" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton21" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>


                </div>


                <!-- Photo Grid-->
                <h1 id="list-item-3" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Romance</strong></h1>
                <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB9" runat="server" ImageUrl="~/image/book/book12.jpg" CssClass="poster" /><br />
                        <br />
                        <asp:Label ID="lblBookName9" runat="server" CssClass="s1" Text="Suzume"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor9" runat="server" CssClass="s2" Text="Makoto Shinkai"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice9" runat="server" CssClass="s3" Text="RM 20.00"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus9" runat="server" CssClass="status" Text="In stock"></asp:Label><br />
                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton22" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton23" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton24" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>

                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB10" runat="server" ImageUrl="~/image/book/book26.jpg" CssClass="poster" /><br />
                        <br />
                        <asp:Label ID="lblBookName10" runat="server" CssClass="s1" Text="Capturing Hope"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor10" runat="server" CssClass="s2" Text="Tun Dr Mahathir Mohamad"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice10" runat="server" CssClass="s3" Text="RM 100.00"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus10" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton25" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton26" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton27" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB11" runat="server" ImageUrl="~/image/book/book42.jpg" CssClass="poster" />
                        <br />
                        <br />
                        <asp:Label ID="lblBookName11" runat="server" CssClass="s1" Text="The Silent Patient"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor11" runat="server" CssClass="s2" Text="Orion"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice11" runat="server" CssClass="s3" Text="RM 49.90"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus11" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton28" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton29" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton30" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB12" runat="server" ImageUrl="~/image/book/book17.jpg" CssClass="poster" />
                        <br />
                        <br />
                        <asp:Label ID="lblBookName12" runat="server" CssClass="s1" Text="Harry Potter"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor12" runat="server" CssClass="s2" Text="J. K. Rowling"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice12" runat="server" CssClass="s3" Text="RM 47.50"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus12" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton31" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton32" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton33" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>


                </div>


                <!-- Photo Grid-->
                <h1 id="list-item-4" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Slice-of-Life</strong></h1>
                <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB13" runat="server" ImageUrl="~/image/book/book12.jpg" CssClass="poster" /><br />
                        <br />
                        <asp:Label ID="lblBookName13" runat="server" CssClass="s1" Text="Suzume"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor13" runat="server" CssClass="s2" Text="Makoto Shinkai"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice13" runat="server" CssClass="s3" Text="RM 20.00"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus13" runat="server" CssClass="status" Text="In stock"></asp:Label><br />
                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton34" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton35" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton36" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>

                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB14" runat="server" ImageUrl="~/image/book/book26.jpg" CssClass="poster" /><br />
                        <br />
                        <asp:Label ID="lblBookName14" runat="server" CssClass="s1" Text="Capturing Hope"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuhtor14" runat="server" CssClass="s2" Text="Tun Dr Mahathir Mohamad"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice14" runat="server" CssClass="s3" Text="RM 100.00"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus14" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton37" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton38" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton39" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB15" runat="server" ImageUrl="~/image/book/book42.jpg" CssClass="poster" />
                        <br />
                        <br />
                        <asp:Label ID="lblBookName15" runat="server" CssClass="s1" Text="The Silent Patient"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor15" runat="server" CssClass="s2" Text="Orion"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice15" runat="server" CssClass="s3" Text="RM 49.90"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus15" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton40" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton41" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton42" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>
                    <div class="w3-quarter displayborder sContainers" style="width: 25%;">
                        <asp:Image ID="imgB16" runat="server" ImageUrl="~/image/book/book17.jpg" CssClass="poster" />
                        <br />
                        <br />
                        <asp:Label ID="lblBookName16" runat="server" CssClass="s1" Text="Harry Potter"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblAuthor16" runat="server" CssClass="s2" Text="J. K. Rowling"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblPrice16" runat="server" CssClass="s3" Text="RM 47.50"></asp:Label><br />
                        <br />
                        <asp:Label ID="lblStatus16" runat="server" CssClass="status" Text="In stock"></asp:Label><br />

                        <br />
                        <p>

                            <asp:LinkButton ID="LinkButton43" runat="server" PostBackUrl="~/Order/cart.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton44" runat="server" PostBackUrl="~/Order/checkout.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnBuyNow_Click">
<i data-bs-toggle="tooltip" data-bs-title="Buy Now" class="fa fa-shopping-bag"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="LinkButton45" runat="server" PostBackUrl="~/Product/IndividualProduct.aspx" CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                            </asp:LinkButton>
                        </p>
                    </div>


                </div>

            </div>



        </div>
    </div>
    <%--<script type="text/javascript">
    function AddHoverClass(buttonText, event) {
        var btn = event.target;  // The element that triggered the event
        btn.classList.add("hover-effect");
        btn.innerText = buttonText;  // Set the text based on the parameter
    }

    function RemoveHoverClass(iconClass, event) {
        var btn = event.target;  // The element that triggered the event
        btn.classList.remove("hover-effect");
        // Set the content to the respective <i> element
        btn.innerHTML = `<i class="fa ${iconClass}"></i>`;
    }
</script>--%>
</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
