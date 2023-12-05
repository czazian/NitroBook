<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="IndividualProduct.aspx.cs" Inherits="AssignmentWAD.Order.IndividualProduct" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="IndividualProductPage.css" rel="stylesheet" />
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-details container" style="padding: 50px 25px; width: 75%; height: 75%; border: 1px solid gray; border-radius: 10px">
        <div id="row2" class="row outer-cont">
            <div id="product-pic" class="col-4">
                <asp:Image ID="imgBook" runat="server" ImageUrl="~/image/book/book12.jpg" Width="100%" />
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
                            <asp:Button PostBackUrl="~/Order/cart.aspx" runat="server" ID="btnCart" CssClass="btn btn-danger" Style="background-color: #cc3300; width: 100%; margin-top: 15px;" Text="Add to cart" />
                        </div>
                    </div>


                </div>

            </div>

            <!--Addtional Feature Product Rating-->
            <hr style="margin-top: 40px; padding: 0px;">
            <div class="rating-container" style="width: 100%;">
                <h1 style="font-size: 25px; color: crimson; margin-top: 10px; font-weight: bold;">Customer Reviews</h1>
                <div style="display: flex; justify-content: space-between; align-items: center; flex-flow: row wrap; padding: 40px;">
                    <div style="display: flex; margin-left: 20px; margin-right: 20px;">
                        <div style="border: 1px solid white; padding: 30px 20px 30px 20px; border-radius: 100px; background-color: #fa6464; color: white">
                            <asp:Label runat="server" ID="lblRate" Text="4.3" Style="font-size: 50px; margin-top: 3px;" />
                        </div>
                        <div style="margin-left: 30px; display: flex; flex-flow: column nowrap; justify-content: center;">
                            <div class="stars" style="margin-bottom: 13px;">
                                <i class="fa-solid fa-star" style="color: crimson"></i>
                                <i class="fa-solid fa-star" style="color: crimson"></i>
                                <i class="fa-solid fa-star" style="color: crimson"></i>
                                <i class="fa-solid fa-star" style="color: crimson"></i>
                                <i class="fa-solid fa-star" style="color: darkgray"></i>
                            </div>
                            <div class="noOfPeople">
                                <asp:Label runat="server" ID="people" Text="10 Peoples Rated" />
                            </div>
                        </div>
                    </div>

                    <div class="rating" style="flex: 0 1 500px;">
                        <div class="row">
                            <div class="side">
                                <div>5 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-5"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>150</div>
                            </div>
                            <div class="side">
                                <div>4 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-4"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>63</div>
                            </div>
                            <div class="side">
                                <div>3 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-3"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>15</div>
                            </div>
                            <div class="side">
                                <div>2 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-2"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>6</div>
                            </div>
                            <div class="side">
                                <div>1 &nbsp;<i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-1"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>20</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="comment-container" style="width: 100%;">
                    <h1 style="font-size: 22px; margin-bottom: 20px; color: dimgrey; font-weight: bold;">Comments</h1>


                    <!--Person 1-->
                    <div class="one-comment" style="padding: 10px; margin-bottom: 20px;">
                        <div style="display: flex;">
                            <div class="photo">
                                <asp:Image runat="server" ID="imgUser1" Width="80" Height="80" Style="border-radius: 10px; border: 3px outset crimson" ImageUrl="~/image/user.jpg" />
                            </div>
                            <div class="info" style="display: flex; justify-content: space-between; width: 100%;">
                                <div class="personal-info" style="margin-left: 10px; display: flex; flex-flow: column nowrap; justify-content: center; gap: 15px;">
                                    <div class="name">
                                        <asp:Label Style="font-size: 19px; color: dodgerblue; font-weight: bold;" runat="server" ID="lblName1" Text="Koyasu An" />
                                    </div>
                                    <div class="star">
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: dimgrey"></i>
                                    </div>
                                </div>
                                <div class="date" style="margin-right: 10px;">
                                    <asp:Label Style="font-size: 15px;" runat="server" ID="lblDate" Text="31 Dec 2023" />
                                </div>
                            </div>
                        </div>

                        <div class="long-comment" style="width: 100%; line-height: 18px; margin-top: 6px;">
                            <asp:Label runat="server" ID="lblComment1" Text="This book is talking about &quot; Suzume followed the young man named Souta to an abandoned location in the forest. But what was there was just an old white door in the middle things started to happen... &quot;" />
                        </div>

                    </div>


                    <!--Person 2-->
                    <div class="one-comment" style="padding: 10px; margin-bottom: 20px;">
                        <div style="display: flex;">
                            <div class="photo">
                                <asp:Image runat="server" ID="imgUser2" Width="80" Height="80" Style="border-radius: 10px; border: 3px outset crimson" ImageUrl="~/image/leonard.jpg" />
                            </div>
                            <div class="info" style="display: flex; justify-content: space-between; width: 100%;">
                                <div class="personal-info" style="margin-left: 10px; display: flex; flex-flow: column nowrap; justify-content: center; gap: 15px;">
                                    <div class="name">
                                        <asp:Label Style="font-size: 19px; color: dodgerblue; font-weight: bold;" runat="server" ID="lblName2" Text="Leonard仔" />
                                    </div>
                                    <div class="star">
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                    </div>
                                </div>
                                <div class="date" style="margin-right: 10px;">
                                    <asp:Label Style="font-size: 15px;" runat="server" ID="lblDate2" Text="31 Dec 2023" />
                                </div>
                            </div>
                        </div>

                        <div class="long-comment" style="width: 100%; line-height: 18px; margin-top: 6px;">
                            <asp:Label runat="server" ID="lblComment2" Text="This book is talking about &quot; Suzume followed the young man named Souta to an abandoned location in the forest. But what was there was just an old white door in the middle things started to happen... &quot;" />
                        </div>

                    </div>


                    <!--Person 3-->
                    <div class="one-comment" style="padding: 10px; margin-bottom: 20px;">
                        <div style="display: flex;">
                            <div class="photo">
                                <asp:Image runat="server" ID="imgUser3" Width="80" Height="80" Style="border-radius: 10px; border: 3px outset crimson" ImageUrl="~/image/administrator-icon.png" />
                            </div>
                            <div class="info" style="display: flex; justify-content: space-between; width: 100%;">
                                <div class="personal-info" style="margin-left: 10px; display: flex; flex-flow: column nowrap; justify-content: center; gap: 15px;">
                                    <div class="name">
                                        <asp:Label Style="font-size: 19px; color: dodgerblue; font-weight: bold;" runat="server" ID="lblName3" Text="Hello" />
                                    </div>
                                    <div class="star">
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: crimson"></i>
                                        <i class="fa-solid fa-star" style="color: dimgrey"></i>
                                        <i class="fa-solid fa-star" style="color: dimgrey"></i>
                                        <i class="fa-solid fa-star" style="color: dimgrey"></i>
                                    </div>
                                </div>
                                <div class="date" style="margin-right: 10px;">
                                    <asp:Label Style="font-size: 15px;" runat="server" ID="lblDate3" Text="31 Dec 2023" />
                                </div>
                            </div>
                        </div>

                        <div class="long-comment" style="width: 100%; line-height: 18px; margin-top: 6px;">
                            <asp:Label runat="server" ID="lblComment3" Text="This book is talking about &quot; Suzume followed the young man named Souta to an abandoned location in the forest. But what was there was just an old white door in the middle things started to happen... &quot;" />
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
