<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="EverestVideoLibrary.ManageUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">Manage Users</h4>
                <div class="column col-6" style="margin-left: -3%; height: 820px;"">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="UserID" DataSourceID="SqlDataSource1" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="Gainsboro" />
                        <Columns>
                            <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="UserType" HeaderText="UserType" SortExpression="UserType" />
                            <asp:CommandField ButtonType="Button" HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True" ControlStyle-Width="70px" >
                            <ControlStyle BackColor="#000046" BorderColor="#000046" ForeColor="White" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#1a202e" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [Users] ([UserName], [Password], [UserType]) VALUES (@UserName, @Password, @UserType)" SelectCommand="SELECT [UserID], [UserName], [Password], [UserType] FROM [Users]" UpdateCommand="UPDATE [Users] SET [UserName] = @UserName, [Password] = @Password, [UserType] = @UserType WHERE [UserID] = @UserID">
                        <DeleteParameters>
                            <asp:Parameter Name="UserID" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="UserType" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="Password" Type="String" />
                            <asp:Parameter Name="UserType" Type="String" />
                            <asp:Parameter Name="UserID" Type="Int64" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <div class="addUserForm" style="margin-top: 3%;">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="SqlDataSource1">
                        <InsertItemTemplate>
                            UserName:
                            <asp:TextBox ID="UserNameTextBox" class="form-control" runat="server" Text='<%# Bind("UserName") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="UserNameTextBox" ForeColor="Red" runat="server" ErrorMessage="Enter the username!"></asp:RequiredFieldValidator>
                            <br />
                            Password:
                            <asp:TextBox ID="PasswordTextBox" class="form-control" runat="server" Text='<%# Bind("Password") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="PasswordTextBox" ForeColor="Red" runat="server" ErrorMessage="Enter the password!"></asp:RequiredFieldValidator>
                            <br />
                            UserType:
                            <asp:DropDownList ID="UserTypeDropDown" class="form-control" runat="server" Text='<%# Bind("UserType") %>' DataSourceID="SqlUserType" DataTextField="UserType" DataValueField="UserType"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlUserType" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT DISTINCT UserType FROM Users"></asp:SqlDataSource>
                            <br />
                            <div class="addUsers">
                                <button style="background-color: #000046; border-color: #000046; width:73px; text-align: center; vertical-align:middle">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ForeColor="White" Height="30px" Width="42px" />
                                </button>
                                <button style="background-color: maroon; margin-left:10px; border-color: maroon; text-align: center; vertical-align:middle;">
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="White" Height="30px" />
                                </button>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                             <button style="background-color: maroon; border-color: maroon; margin-top: 8%;">
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add User" BackColor="maroon" ForeColor="White" BorderColor="maroon" width="75px" Height="30px" />
                             </button>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </div>
  </div>
</asp:Content>
