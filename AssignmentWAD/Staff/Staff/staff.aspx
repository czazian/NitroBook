<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="staff.aspx.cs" Inherits="AssignmentWAD.Staff.Staff.staff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="home-content">
        <div class="sales-boxes">

            <div class="recent-sales box">
                <div class="title">Staff</div>
                <div class="search-box">
                    <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..."></asp:TextBox>
                    <asp:LinkButton runat="server" ID="linkBtnSearch" OnClick="linkBtnSearch_Click"><i class='bx bx-search'></i></asp:LinkButton>
                </div>
            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">
                <div>
                    <asp:Button runat="server" ID="createStaffBtn" Text="Create" CssClass="form-button" PostBackUrl="~/Staff/Staff/staff_create.aspx" />
                </div>
                <div class="sales-details">

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">No</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Container.ItemIndex + 1 %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Username</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("StaffName") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Role</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("RoleName") %></li>
                            <hr />
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Operation</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <%--still trying make it query string send and retrieve work--%>
                                <a href="staff_view.aspx?staffID=<%# Eval("StaffID") %>"><i class='bx bx-show'></i></a>
                                <a href="staff_edit.aspx?staffID=<%# Eval("StaffID") %>"><i class='bx bxs-edit'></i></a>
                                <asp:LinkButton runat="server" ID="Hyperlink1" OnClientClick='<%# CreateConfirmation(Eval("StaffName")) %>' OnCommand="delete_click" CommandName="deleteClick" CommandArgument='<%# Eval("StaffID")%>'><i class='bx bxs-trash'></i></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT Staff.StaffID, Staff.StaffName, Role.RoleName  FROM [Staff], [Role] WHERE Staff.RoleID = Role.RoleID"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Staff], [Role] WHERE Staff.RoleID = Role.RoleID AND ([Staff].[StaffName] LIKE '%' + @StaffName + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="StaffName" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
