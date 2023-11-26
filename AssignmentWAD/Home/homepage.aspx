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
        <button class="carousel-control-prev" type="button" data-bs-target="#promotionSlider" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#promotionSlider" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


</asp:Content>
