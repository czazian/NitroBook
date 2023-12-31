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
                    <asp:LinkButton runat="server" ID="linkBtnSearch" OnClick="linkBtnSearch_Click"><i class='bx bx-search'></i></asp:LinkButton>
                </div>
            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">

                <div>
                    <asp:Button runat="server" ID="createMemberBtn" Text="Create" CssClass="form-button" PostBackUrl="~/Staff/Member/member_create.aspx" />
                </div>
                <div class="sales-details">

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">No</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Container.ItemIndex + 1 %>.</li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Username</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("UserName") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Email</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("UserEmail") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Phone No</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("PhoneNo") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <hr />
                                <li class="topic">Operation</li>
                                <hr />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <%--still trying make it query string send and retrieve work--%>
                                <a href="member_view.aspx?userID=<%# Eval("UserID") %>"><i class='bx bx-show'></i></a>
                                <a href="member_edit.aspx?userID=<%# Eval("UserID") %>"><i class='bx bxs-edit'></i></a>
                                <asp:LinkButton runat="server" ID="Hyperlink1" OnClientClick='<%# CreateConfirmation(Eval("UserName")) %>' OnCommand="delete_click" CommandName="deleteClick" CommandArgument='<%# Eval("UserID")%>'><i class='bx bxs-trash'></i></asp:LinkButton>
                            </li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                </div>

            </div>
        </div>
    </div>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [User] WHERE ([UserName] LIKE '%' + @UserName + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="UserName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
