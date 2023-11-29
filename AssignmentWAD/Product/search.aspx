<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="AssignmentWAD.Search.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top: -25px;">
        <div>
            <h2 style="padding-left: 45px; font-size: 25px"><strong>Search Result</strong></h2>
            <p style="padding-left: 45px; padding-top: 6px; margin-bottom: 20px;">There are <b>3 </b>Search Results was found</p>
            <div class="w3-row-padding w3-center group">
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB1" runat="server" ImageUrl="~/image/book1.jpg" CssClass="poster" /><br />
                    <br />
                    <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text="Suzume"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text="Makoto Shinkai"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice1" runat="server" CssClass="s3" Text="RM 20.00"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton PostBackUrl="~/Product/IndividualProduct.aspx" ID="linkBtn1" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round">
                      Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB2" runat="server" ImageUrl="~/image/book2.jpg" CssClass="poster" /><br />
                    <br />
                    <asp:Label ID="lblBookName2" runat="server" CssClass="s1" Text="Capturing Hope"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName2" runat="server" CssClass="s2" Text="Tun Dr Mahathir Mohamad"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice2" runat="server" CssClass="s3" Text="RM 100.00"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn2" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round">
                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
                <div class="w3-quarter displayborder sContainers">
                    <asp:Image ID="imgB3" runat="server" ImageUrl="~/image/book3.jpg" CssClass="poster" />
                    <br />
                    <br />
                    <asp:Label ID="lblBookName3" runat="server" CssClass="s1" Text="The Silent Patient"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblAuthorName3" runat="server" CssClass="s2" Text="Orion"></asp:Label><br />
                    <br />
                    <asp:Label ID="lblPrice3" runat="server" CssClass="s3" Text="RM 49.90"></asp:Label><br />
                    <br />
                    <p>
                        <asp:LinkButton ID="linkBtn3" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round">
                  Add to cart <i class="fa fa-shopping-cart"></i>
                        </asp:LinkButton>
                    </p>
                </div>
            </div>

        </div>
    </div>
</asp:Content>


<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="jsScript">
    <script type="text/javascript" src="../Home/home.js"></script>
</asp:Content>
