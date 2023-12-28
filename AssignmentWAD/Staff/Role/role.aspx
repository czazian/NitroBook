<%@ Page Title="" Language="C#" MasterPageFile="~/Admin2.Master" AutoEventWireup="true" CodeBehind="role.aspx.cs" Inherits="AssignmentWAD.Staff.Role.role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home-content">
        <div class="sales-boxes">
            <div class="recent-sales box">
                <div class="title">Role</div>
                <div class="search-box">
                    <asp:TextBox runat="server" ID="txtSearch" placeholder="Search..."></asp:TextBox>
                    <asp:LinkButton runat="server" ID="linkBtnSearch"><i class='bx bx-search'></i></asp:LinkButton>
                </div>

            </div>

        </div>

        <div class="sales-boxes">
            <div class="recent-sales box">
                <div>
                    <!--                            not nessasary redirect to servlet-->
                    <button class="form-button">
                        <asp:HyperLink runat="server" ID="roleCreateLink" NavigateUrl="~/Staff/Role/role_create.aspx">Create</asp:HyperLink></button>
                </div>
                <div class="sales-details">

                    <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">No</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Container.ItemIndex + 1 %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Role</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><%# Eval("RoleName") %></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Product</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box"><input type="hidden" value="<%# Eval("ProductPermission") %>" class="hiddenF"><i class="icon "></i></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Report</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box"><input type="hidden" value="<%# Eval("ReportPermission") %>" class="hiddenF"><i class="icon "></i></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Member</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box"><input type="hidden" value="<%# Eval("MemberPermission") %>" class="hiddenF"><i class="icon "></i></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Staff</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box"><input type="hidden" value="<%# Eval("StaffPermission") %>" class="hiddenF"><i class="icon "></i></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Role</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="box"><input type="hidden" value="<%# Eval("RolePermission") %>" class="hiddenF"><i class="icon "></i></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource1">
                        <HeaderTemplate>
                            <ul class="details">
                                <li class="topic">Operation</li>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="txt-center">
                                <%--still trying make it query string send and retrieve work--%>
                                <a href="role_view.aspx?roleID=<%# Eval("RoleID") %>"><i class='bx bx-show'></i></a>
                                <a href="role_edit.aspx?roleID=<%# Eval("RoleID") %>"><i class='bx bxs-edit'></i></a>
                                <asp:LinkButton runat="server" ID="Hyperlink1" OnClientClick='<%# CreateConfirmation(Eval("RoleName")) %>' OnCommand="delete_click" CommandName="deleteClick" CommandArgument='<%# Eval("RoleID")%>'><i class='bx bxs-trash'></i></asp:LinkButton>
                            </li>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NitroBooks %>" SelectCommand="SELECT * FROM [Role]"></asp:SqlDataSource>

    <script>
        //display true or false for each repeater item 
        $(document).ready(function () {
            //$('.ic').each(function () {
            //    $(this).addclass('bx bxs-check-circle');
            //});
            $('.box').each(function () {
                var value = parseInt($(this).find('.hiddenF').val()); // Get the value, modify selector based on your Label's structure
                var icon = $(this).find('.icon'); // Select the icon element

                // Use conditions to change the icon based on the value
                if (value == 0) {
                    icon.addClass('bx bxs-x-circle');
                } else if (value == 1) {
                    icon.addClass('bx bxs-check-circle');           
                }
            });
        });


    </script>
</asp:Content>
