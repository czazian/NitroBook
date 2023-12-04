<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="member.aspx.cs" Inherits="AssignmentWAD.Staff.Member.member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Member</div>
                <div class="search-box">
                    <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..."></asp:TextBox>
                    <asp:LinkButton runat="server" ID="linkBtnSearch"><i class='bx bx-search'></i></asp:LinkButton>
                </div>
            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">

                <div>
                    <button class="form-button"><asp:HyperLink runat="server" ID="memberCreateLink" NavigateUrl="~/Staff/Member/member_create.aspx">Create</asp:HyperLink></button>
                </div>
                <div class="sales-details">

                    <ul class="details">
                        <li class="topic">No.</li>

                        <li><a>1</a></li>



                    </ul>
                    <ul class="details">
                        <li class="topic">Username</li>

                        <li><a href="#">Ali</a></li>


                    </ul>
                    <ul class="details">
                        <li class="topic">Email</li>

                        <li><a href="#">ali@gmail.com</a></li>

                    </ul>
                    <ul class="details">
                        <li class="topic">Operation</li>

                        <li class="txt-center">
                            <li class="txt-center">
                                <asp:HyperLink runat="server" ID="hrefCreate" NavigateUrl="~/Staff/Member/member_view.aspx"><i class='bx bx-show'></i></asp:HyperLink>
                                <asp:HyperLink runat="server" ID="hrefEdit" NavigateUrl="~/Staff/Member/member_edit.aspx"><i class='bx bxs-edit'></i></asp:HyperLink>
                                <asp:HyperLink runat="server" ID="Hyperlink1" NavigateUrl=""><i class='bx bxs-trash'></i></asp:HyperLink>
                            </li>
                        </li>

                    </ul>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
