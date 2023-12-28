    <%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="newarrivals.aspx.cs" Inherits="AssignmentWAD.BookCategories.newarrivals" %>

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

        <div id="box" class="col-2" style="width: 280px; height: 360px; position: fixed; top: 260px;">


            <h1 style="padding-left: 25px; padding-top: 20px; font-size: 20px; color: #fa6464;"><strong>New Arrivals</strong></h1>
            <br />
            <div id="list-example" class="list-group">

                <asp:LinkButton ID="lkbSubCat1" runat="server" Text="Fiction New Arrivals" PostBackUrl="#list-item-1" CssClass="lkbSubCat"></asp:LinkButton><br />
                <asp:LinkButton ID="lkbSubCat2" runat="server" Text="Non-fiction New Arrivals" PostBackUrl="#list-item-2" CssClass="lkbSubCat"></asp:LinkButton><br />
                <asp:LinkButton ID="lkbSubCat3" runat="server" Text="Manga & Light Novel New Arrivals" PostBackUrl="#list-item-3" CssClass="lkbSubCat"></asp:LinkButton><br />
                <asp:LinkButton ID="lkbSubCat4" runat="server" Text="Children's New Arrivals" PostBackUrl="#list-item-4" CssClass="lkbSubCat"></asp:LinkButton>

                <hr />
            </div>



            <h2 style="margin-left: 25px; font-size: 15px;"><strong>Price range</strong></h2>
            <br />
            <div style="display: flex; width: 100%; flex-flow: row nowrap">
                <div class="priceRangeForm" style="width: 100%;">
                    <asp:TextBox ID="txtMinPrice" runat="server" placeholder="Min RM" Width="60px" Style="font-size: 12px;"></asp:TextBox>
                    -
                <asp:TextBox ID="txtMaxPrice" runat="server" placeholder="Max RM" Width="60px" Style="font-size: 12px;"></asp:TextBox>

                    <asp:Button ID="btnPriceRange" runat="server" Text="Apply" CssClass="priceRange" OnClick="btnPriceRange_Click" />
                     <br /><br />
                            <asp:Label ID="lblErrMsg" runat="server" ForeColor="Red" style="font-size:12px;"></asp:Label>
                </div>
            </div>

        </div>




        <!--Start of retriving records-->
        <div class="col-9" style="margin-left: 325px;" id="main">
            <h1 style="padding-left: 15px; font-size: 35px;"><strong>New Arrivals</strong></h1>
            <asp:Label runat="server" ID="lblTotalShow" style="float: right; margin-right: 20px; margin-top: 10px;"></asp:Label>

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
            <h1 id="list-item-1" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Fiction New Arrivals</strong></h1>
            <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                <asp:Label runat="server" ID="lblFNANotFound" />
                <asp:SqlDataSource ID="FNASource" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Book] WHERE Category = 'Fiction' AND (SubCategory = 'General Fictions' OR SubCategory= 'Fantasy' OR SubCategory = 'Horror') AND Price < 45.50 AND Not Quantity = 0;"></asp:SqlDataSource>
                <asp:Repeater ID="FNARepeater" runat="server">
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

                                <asp:LinkButton ID="btnAddToCart" runat="server" PostBackUrl='<%# "~/Order/cart.aspx?bookID=" + Eval("bookiD") + "&qty=" + 1 %>' CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnViewMore" runat="server" PostBackUrl='<%# "~/Product/IndividualProduct.aspx?bookID=" + Eval("bookID") %>' CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                                </asp:LinkButton>
                            </p>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>



            <!-- Photo Grid-->
            <h1 id="list-item-2" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Non-fiction New Arrivals</strong></h1>
            <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                <asp:Label runat="server" ID="lblNFNANotFound" />
                <asp:SqlDataSource ID="NFNASource" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Book] WHERE Category = 'Non-Fiction' AND (SubCategory = 'Marketing & Sales' OR SubCategory= 'Computing & Information Technology' OR SubCategory = 'Food & Drinks') AND Price < 47 AND Not Quantity = 0;"></asp:SqlDataSource>
                <asp:Repeater ID="NFNARepeater" runat="server">
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

                                <asp:LinkButton ID="btnAddToCart" runat="server" PostBackUrl='<%# "~/Order/cart.aspx?bookID=" + Eval("bookiD") + "&qty=" + 1 %>' CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnViewMore" runat="server" PostBackUrl='<%# "~/Product/IndividualProduct.aspx?bookID=" + Eval("bookID") %>' CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                                </asp:LinkButton>
                            </p>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>


            <!-- Photo Grid-->
            <h1 id="list-item-3" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Manga & Light Novel New Arrivals</strong></h1>
            <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                <asp:Label runat="server" ID="lblMangaNANotFound" />
                <asp:SqlDataSource ID="MangaNASource" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Book] WHERE Category = 'Manga & Light Novel' AND (SubCategory = 'Reincarnation' OR SubCategory= 'Action' OR SubCategory = 'Romance' OR SubCategory= 'Slice-of-Life') AND Price < 47 AND Not Quantity = 0;"></asp:SqlDataSource>
                <asp:Repeater ID="MangaNARepeater" runat="server">
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

                                <asp:LinkButton ID="btnAddToCart" runat="server" PostBackUrl='<%# "~/Order/cart.aspx?bookID=" + Eval("bookiD") + "&qty=" + 1 %>' CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnViewMore" runat="server" PostBackUrl='<%# "~/Product/IndividualProduct.aspx?bookID=" + Eval("bookID") %>' CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                                </asp:LinkButton>
                            </p>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>


            <!-- Photo Grid-->
            <h1 id="list-item-4" style="margin-top: 52px; margin-bottom: 20px; padding-left: 15px; font-size: 30px;"><strong>Childred's New Arrivals</strong></h1>
            <div class="w3-row-padding w3-center" style="display: flex; flex-flow: row wrap;">

                <asp:Label runat="server" ID="lblCNANotFound" />
                <asp:SqlDataSource ID="CNASource" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Book] WHERE Category = 'Childrens' AND (SubCategory = 'Character Stories' OR SubCategory= 'Picture Books') AND Price < 40 AND Not Quantity = 0;"></asp:SqlDataSource>
                <asp:Repeater ID="CNARepeater" runat="server">
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

                                <asp:LinkButton ID="btnAddToCart" runat="server" PostBackUrl='<%# "~/Order/cart.aspx?bookID=" + Eval("bookiD") + "&qty=" + 1 %>' CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnAddToCart_Click">
<i data-bs-toggle="tooltip" data-bs-title="Add to Cart" class="fa fa-shopping-cart"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnViewMore" runat="server" PostBackUrl='<%# "~/Product/IndividualProduct.aspx?bookID=" + Eval("bookID") %>' CssClass="mrg btn btn-2 btn-sep icon-cart" OnClick="btnViewMore_Click">
<i data-bs-toggle="tooltip" data-bs-title="View More" class="fa fa-arrows"></i>
                                </asp:LinkButton>
                            </p>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>


            </div>





        </div>

    </div>

</asp:Content>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
