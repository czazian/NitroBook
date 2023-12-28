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
                box.style.top = "260px";
            }
        });
    </script>

    <!-- Temporary Book Content -->
    <div class="row" id="content" style="position: relative;">

        <div id="box" class="col-2" style="width: 280px; height: 340px; position: fixed; top: 260px;">
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

                    <asp:Button ID="btnPriceRange" runat="server" Text="Apply" CssClass="priceRange" OnClick="btnPriceRange_OnClick" />
                     <br /><br />
                            <asp:Label ID="lblErrMsg" runat="server" ForeColor="Red" style="font-size:12px;"></asp:Label>
                </div>
            </div>

        </div>

        <div>


            <!--Start of retriving records-->
            <div class="col-9" style="margin-left: 325px;" id="main">

                <!-- Sub Category Name -->
                <h1 style="padding-left: 15px; font-size: 35px;"><strong>Manga & Light Novel</strong></h1>
                <asp:Label runat="server" ID="lblTotalShow" Style="float: right; margin-right: 20px; margin-top: 10px;"></asp:Label>

                <!-- Start Filter Bar -->
                <div style="float: right; margin-right: 150px; padding-bottom: 10px;">

                    <asp:DropDownList ID="ddlFilter" runat="server" CssClass="ddlFilter" AutoPostBack="True" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
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

                    <asp:Label runat="server" ID="lblReinNotFound" />
                    <asp:SqlDataSource ID="ReinSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Reincarnation';"></asp:SqlDataSource>
                    <asp:Repeater ID="ReinRepeater" runat="server">
                        <ItemTemplate>
                            <div class="w3-quarter displayborder bookContainer">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="poster" /><br />
                                <br />

                                <br />
                                <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text='<%#Eval("Title") %>'></asp:Label><br />

                                <br />
                                <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text='<%#Eval("Author") %>'></asp:Label><br />
                                <br />
                                <asp:Label ID="lblPrice" runat="server" CssClass="s3" Text='<%# "RM " + Eval("Price") %>'></asp:Label><br />

                                <br />
                                <asp:Label ID="lblStatus" runat="server" CssClass="status" Text='<%# Eval("Quantity").ToString() == "0" ? "Out of Stock" : "In Stock" %>'></asp:Label><br />
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
                        </ItemTemplate>
                    </asp:Repeater>

                </div>



                <!-- Photo Grid-->
                <h1 id="list-item-2" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Action</strong></h1>
                <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                    <asp:Label runat="server" ID="lblActionNotFound" />
                    <asp:SqlDataSource ID="ActionSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Action';"></asp:SqlDataSource>
                    <asp:Repeater ID="ActionRepeater" runat="server">
                        <ItemTemplate>
                            <div class="w3-quarter displayborder bookContainer">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="poster" /><br />
                                <br />

                                <br />
                                <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text='<%#Eval("Title") %>'></asp:Label><br />

                                <br />
                                <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text='<%#Eval("Author") %>'></asp:Label><br />
                                <br />
                                <asp:Label ID="lblPrice" runat="server" CssClass="s3" Text='<%# "RM " + Eval("Price") %>'></asp:Label><br />

                                <br />
                                <asp:Label ID="lblStatus" runat="server" CssClass="status" Text='<%# Eval("Quantity").ToString() == "0" ? "Out of Stock" : "In Stock" %>'></asp:Label><br />
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
                        </ItemTemplate>
                    </asp:Repeater>


                </div>


                <!-- Photo Grid-->
                <h1 id="list-item-3" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Romance</strong></h1>
                <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                    <asp:Label runat="server" ID="lblRomanceNotFound" />
                    <asp:SqlDataSource ID="RomanceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Romance';"></asp:SqlDataSource>
                    <asp:Repeater ID="RomanceRepeater" runat="server">
                        <ItemTemplate>
                            <div class="w3-quarter displayborder bookContainer">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="poster" /><br />
                                <br />

                                <br />
                                <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text='<%#Eval("Title") %>'></asp:Label><br />

                                <br />
                                <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text='<%#Eval("Author") %>'></asp:Label><br />
                                <br />
                                <asp:Label ID="lblPrice" runat="server" CssClass="s3" Text='<%# "RM " + Eval("Price") %>'></asp:Label><br />

                                <br />
                                <asp:Label ID="lblStatus" runat="server" CssClass="status" Text='<%# Eval("Quantity").ToString() == "0" ? "Out of Stock" : "In Stock" %>'></asp:Label><br />
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
                        </ItemTemplate>
                    </asp:Repeater>


                </div>


                <!-- Photo Grid-->
                <h1 id="list-item-4" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Slice-of-Life</strong></h1>
                <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                    <asp:Label runat="server" ID="lblSliceNotFound" />
                    <asp:SqlDataSource ID="SliceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND SubCategory = 'Slice-of-Life';"></asp:SqlDataSource>
                    <asp:Repeater ID="SliceRepeater" runat="server">
                        <ItemTemplate>
                            <div class="w3-quarter displayborder bookContainer">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="poster" /><br />
                                <br />

                                <br />
                                <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text='<%#Eval("Title") %>'></asp:Label><br />

                                <br />
                                <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text='<%#Eval("Author") %>'></asp:Label><br />
                                <br />
                                <asp:Label ID="lblPrice" runat="server" CssClass="s3" Text='<%# "RM " + Eval("Price") %>'></asp:Label><br />

                                <br />
                                <asp:Label ID="lblStatus" runat="server" CssClass="status" Text='<%# Eval("Quantity").ToString() == "0" ? "Out of Stock" : "In Stock" %>'></asp:Label><br />
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
                        </ItemTemplate>
                    </asp:Repeater>


                </div>

            </div>



        </div>
    </div>

</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
