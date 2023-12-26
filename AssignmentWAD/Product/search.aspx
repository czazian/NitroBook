<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="AssignmentWAD.Search.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="margin-top: -25px;">
        <div>
            <h2 style="padding-left: 45px; font-size: 25px"><strong>Search Result</strong></h2>
            <p style="padding-left: 45px; padding-top: 6px; margin-bottom: 20px;">There are <b><asp:Label runat="server" ID="noOfBooks" Text=""/>&nbsp;</b>Search Results was found</p>




            <div class="w3-row-padding w3-center group">



                <asp:Repeater ID="BookRepeater" runat="server">
                    <ItemTemplate>
                        <div class="w3-quarter displayborder sContainers">
                            <asp:Image ID="imgB1" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="poster" /><br />
                            <br />
                            <asp:Label ID="lblBookName1" runat="server" CssClass="s1" Text='<%# Eval("Title") %>'></asp:Label><br />
                            <br />
                            <asp:Label ID="lblAuthorName1" runat="server" CssClass="s2" Text='<%# Eval("Author") %>'></asp:Label><br />
                            <br />
                            <asp:Label ID="lblPrice1" runat="server" CssClass="s3" Text='<%# "RM " + Eval("Price") %>'></asp:Label><br />
                            <br />
                            <p>
                                <asp:LinkButton CommandArgument='<%# Eval("BookID") %>' OnCommand="linkBtn1_Command" ID="linkBtn1" runat="server" CssClass="mrg w3-button w3-block w3-deep-orange w3-hover-red w3-round">
                      Add to cart <i class="fa fa-shopping-cart"></i>
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
