<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="IndividualProduct.aspx.cs" Inherits="AssignmentWAD.Order.IndividualProduct" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="IndividualProductPage.css" rel="stylesheet" />
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-details container" style="padding: 50px 25px; width: 75%; height: 75%; border: 1px solid gray; border-radius: 10px">
        <div id="row2" class="row outer-cont">
            <div id="product-pic" class="col-4">
                <asp:Image ID="imgBook" runat="server" Width="100%" />
            </div>
            <div class="product-details col-8">
                <div class="title" style="text-align: center;">
                    <asp:Label runat="server" ID="lblBookName" CssClass="s1" Text="" Style="font-size: 20px; font-weight: bold"></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="lblAuthorName" CssClass="s2" Text=""></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="lblPrice" CssClass="s3 info" Text=""></asp:Label>
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
                            <asp:Label runat="server" ID="lblLanguage" Text=""></asp:Label>
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
                            <asp:Label runat="server" ID="lblAvailability" Text=""></asp:Label>&nbsp;Units Left<br />
                            <br />
                        </div>
                    </div>


                    <!-- Product category here -->
                    <div class="details-row row">
                        <div class="col-3">
                            <p style="font-weight: bold; text-align: right;">Category:</p>
                        </div>
                        <div class="col-9">
                            <asp:Label runat="server" ID="lblCategory"></asp:Label><br />
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
                            <asp:Label ID="lblDescription" runat="server" Text="">
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
                                    <asp:LinkButton ValidationGroup="grp" OnClientClick="return false" runat="server" ID="btnMinus" CssClass="quantity-left-minus btn btn-danger btn-number" data-type="minus" data-field="">
                                        <i class="fa-solid fa-minus"></i>
                                    </asp:LinkButton>
                                </span>
                                <!--Display Qty-->
                                <%--<script>
                                    alert(document.getElementById('<%= hdnAvailableQty.ClientID %>').value)
                                </script>--%>
                                <asp:TextBox ValidationGroup="grp" AutoPostBack="true" Text="1" ID="txtQuantity" runat="server" Style="border-color: #f0f0f0; text-align: center;" type="text" TextMode="Number" min="1" max="100" CssClass="noSpinners quantity" />
                                <!--Add 1-->
                                <span class="input-group-btn">
                                    <span class="input-group-btn">
                                        <asp:LinkButton ValidationGroup="grp" OnClientClick="return false;" runat="server" ID="btnAdd" CssClass="quantity-right-plus btn btn-danger btn-number" data-type="plus" data-field="">
                                            <i class="fa-solid fa-plus"></i>
                                        </asp:LinkButton>
                                    </span>
                                </span>
                            </div>
                            <div style="display: flex; align-items: center; flex-flow: row nowrap; margin-top: 5px;">
                                <asp:RangeValidator ID="rangevalidator" Type="Integer" SetFocusOnError="true" ForeColor="Red" ErrorMessage="Quantity must not be more than available unit." runat="server" ControlToValidate="txtQuantity" MinimumValue="1" />
                            </div>
                        </div>
                    </div>

                    <br />


                    <!-- Add to card button here -->
                    <div class="row details-row" style="justify-content: center;">
                        <div class="col-6" style="display: flex;">
                            <asp:Button OnClick="btnCart_Click" runat="server" ID="btnCart" CssClass="btn btn-danger" Style="background-color: #cc3300; width: 100%; margin-top: 5px;" Text="Add to cart" />
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
                            <div class="stars" style="margin-bottom: 13px; font-size: 20px; text-shadow: 1px 1px grey">
                                <asp:Label runat="server" ID="ranking" />
                            </div>
                            <div class="noOfPeople">
                                <asp:Label runat="server" ID="people" />
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
                                    <div class="bar-5" id="bar5"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblFiveStar" />
                                </div>
                            </div>
                            <div class="side">
                                <div>4 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-4" id="bar4"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblFourStar" />
                                </div>
                            </div>
                            <div class="side">
                                <div>3 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-3" id="bar3"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblThreeStar" />
                                </div>
                            </div>
                            <div class="side">
                                <div>2 <i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-2" id="bar2"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblTwoStar" />
                                </div>
                            </div>
                            <div class="side">
                                <div>1 &nbsp;<i class="fa-solid fa-star" style="color: lightcoral"></i></div>
                            </div>
                            <div class="middle">
                                <div class="bar-container">
                                    <div class="bar-1" id="bar1"></div>
                                </div>
                            </div>
                            <div class="side right">
                                <div>
                                    <asp:Label runat="server" ID="lblOneStar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    if (CommentRepeater.Controls.Count == 0)
                    {
                        emptyComment.Visible = true;
                        emptyComment.Text = "No comment";
                    }
                    else
                    {
                        emptyComment.Visible = false;
                        emptyComment.Text = "";
                    }
                %>

                <div class="comment-container" style="width: 100%;">
                    <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; margin-bottom: 10px;">
                        <h1 style="font-size: 22px; margin-bottom: 20px; color: dimgrey; font-weight: bold;">Comments</h1>
                        <asp:DropDownList Style="font-size: 15px; height: 30px; margin-top: 5px;" runat="server" ID="ddlFilter" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Selected="True" Value="0">Sort by Star (1-5)</asp:ListItem>
                            <asp:ListItem Value="1">Sort by Star (5-1)</asp:ListItem>
                            <asp:ListItem Value="2">Sort by Latest</asp:ListItem>
                            <asp:ListItem Value="3">Sort by Oldest</asp:ListItem>
                            <asp:ListItem Value="4">Show Only 1 Star</asp:ListItem>
                            <asp:ListItem Value="5">Show Only 2 Star</asp:ListItem>
                            <asp:ListItem Value="6">Show Only 3 Star</asp:ListItem>
                            <asp:ListItem Value="7">Show Only 4 Star</asp:ListItem>
                            <asp:ListItem Value="8">Show Only 5 Star</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Label Style="padding: 10px; padding-top: 20px; padding-bottom: 20px; border: 1.5px grey solid; color: dimgray; font-size: 1.2rem; text-align: center; width: 100%; display: flex; flex-flow: row nowrap; justify-content: center; margin-top: 5px;" runat="server" ID="emptyComment" />

                    <!--Comment Repeater-->
                    <asp:Repeater runat="server" ID="CommentRepeater">
                        <ItemTemplate>
                            <div class="one-comment" style="padding: 10px; margin-bottom: 20px;">
                                <div style="display: flex;">
                                    <div class="photo">
                                        <asp:Image runat="server" ID="Image1" Width="80" Height="80" Style="border-radius: 10px; border: 3px outset crimson" ImageUrl='<%# Eval("ProfileImage") %>' />
                                    </div>
                                    <div class="info" style="display: flex; justify-content: space-between; width: 100%;">
                                        <div class="personal-info" style="margin-left: 10px; display: flex; flex-flow: column nowrap; justify-content: center; gap: 15px;">
                                            <div class="name">
                                                <asp:Label Style="font-size: 19px; color: dodgerblue; font-weight: bold;" runat="server" ID="Label1" Text='<%# Eval("UserName") %>' />
                                            </div>

                                            <div class="star starBox" id="starID">
                                                <input type="hidden" value='<%# Eval("RateStar")%>' class="starHidden">
                                            </div>
                                        </div>
                                        <div class="date" style="margin-right: 10px;">
                                            <asp:Label Style="font-size: 15px;" runat="server" ID="Label2" Text='<%#  DateTime.Parse(Eval("CommentDate").ToString()).ToString("dd MMM yyyy") %>' />
                                        </div>
                                    </div>
                                </div>

                                <div class="long-comment" style="width: 100%; line-height: 18px; margin-top: 6px;">
                                    <asp:Label runat="server" ID="Label3" Text='<%# Eval("Comment") %>' />
                                </div>
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>


        </div>
    </div>
</asp:Content>



<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <!--Rating Star-->
    <script>
        $(document).ready(function () {
            //Each Comment will be Loop
            $(".starBox").each(function () {
                let starBox = $(this);
                let numberOfStar = parseInt($(this).find('.starHidden').val()); //Able to get no of star for each comment

                //Know the number of star of each comment
                for (let i = 0; i < numberOfStar; i++) {
                    var element = document.createElement("i");
                    element.classList.add("fa-solid", "fa-star");
                    element.style.color = "crimson";
                    starBox.append(element.cloneNode());
                }
            })

            //set the progress bar length of each rate star 
            var one = <%= this.percentageOfOne %>;
            var two = <%= this.percentageOfTwo %>;
            var three = <%= this.percentageOfThree %>;
            var four = <%= this.percentageOfFour %>;
            var five = <%= this.percentageOfFive %>;

            document.getElementById('bar1').style.width = one + "%";
            document.getElementById('bar2').style.width = two + "%";
            document.getElementById('bar3').style.width = three + "%";
            document.getElementById('bar4').style.width = four + "%";
            document.getElementById('bar5').style.width = five + "%";


            //Set the color of the ranking
            var rank = document.getElementById('<%=ranking.ClientID%>').innerHTML;
            var rankItem = document.getElementById('<%=ranking.ClientID%>');
            console.log(rank);
            if (rank == "Excellent") {
                rankItem.style.color = "lawngreen";
            } else if (rank == "Good") {
                rankItem.style.color = "#ffc654";
            } else if (rank == "Unsatisfied") {
                rankItem.style.color = "#f53d3d";
            } else {
                rankItem.style.color = "#bdbdbd";
            }
        })
    </script>
    <script type="text/javascript" src="IndividualProductPage.js"></script>
</asp:Content>
