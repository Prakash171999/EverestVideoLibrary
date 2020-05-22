<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageDVDBooking.aspx.cs" Inherits="EverestVideoLibrary.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:2%; margin-left: -1.5%;">Manage DVD Booking</h4>
                <div class="column col-6" style="margin-left: -3%; top: 2px; left: 3px; height: 940px;">
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="DVD_ID" DataSourceID="SqlDataSource1">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_ID" HeaderText="DVD_ID" InsertVisible="False" ReadOnly="True" SortExpression="DVD_ID" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
                            <asp:BoundField DataField="StandardCharge" HeaderText="StandardCharge" SortExpression="StandardCharge" />
                            <asp:CommandField ButtonType="Button" HeaderText="Action" ShowEditButton="True" ShowDeleteButton="True" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [DVD_ID], [DVD_title], [Category], [ReleaseDate], [StandardCharge] FROM [DVD]" DeleteCommand="DELETE FROM [DVD] WHERE [DVD_ID] = @DVD_ID" InsertCommand="INSERT INTO [DVD] ([DVD_title], [Category], [ReleaseDate], [StandardCharge]) VALUES (@DVD_title, @Category, @ReleaseDate, @StandardCharge)" UpdateCommand="UPDATE [DVD] SET [DVD_title] = @DVD_title, [Category] = @Category, [ReleaseDate] = @ReleaseDate, [StandardCharge] = @StandardCharge WHERE [DVD_ID] = @DVD_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="DVD_ID" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DVD_title" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter DbType="Date" Name="ReleaseDate" />
                            <asp:Parameter Name="StandardCharge" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DVD_title" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter DbType="Date" Name="ReleaseDate" />
                            <asp:Parameter Name="StandardCharge" Type="Int32" />
                            <asp:Parameter Name="DVD_ID" Type="Int64" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <div class="check-restriction" style="margin-top: 5%">
                        <h5><asp:Label ID="Label1" runat="server" Text="Check Age Restriction"></asp:Label></h5><br />
                        <h6>Member ID: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlMemberID" DataTextField="MemberID" DataValueField="MemberID"></asp:DropDownList></h6>
                        <asp:SqlDataSource ID="SqlMemberID" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [MemberID] FROM [Member]"></asp:SqlDataSource><br />
                        <h6>DVD Title: <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDVDTitle" DataTextField="DVD_title" DataValueField="DVD_title"></asp:DropDownList></h6>
                        <asp:SqlDataSource ID="SqlDVDTitle" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [DVD_title] FROM [DVD]"></asp:SqlDataSource>
                        <div class="checkBtn" style="margin-top: 5%;">
                            <asp:Button ID="Button1" runat="server" Text="Check" BackColor="#1aa50d" ForeColor="white" Height="35px" Width="87px" BorderColor="#1aa50d" />

                        </div>
                    </div>
                    <div class="addBookDetails" style="margin-top:4%;">
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DVD_ID" DataSourceID="SqlDataSource1" Height="10px">
                        <InsertItemTemplate>
                            DVD_title:
                            <asp:TextBox ID="DVD_titleTextBox" class="form-control" runat="server" Text='<%# Bind("DVD_title") %>' />
                            <br />
                            Category:
                            <asp:TextBox ID="CategoryTextBox" class="form-control" runat="server" Text='<%# Bind("Category") %>' />
                            <br />
                            ReleaseDate:
                            <asp:TextBox ID="ReleaseDateTextBox" class="form-control" runat="server" Text='<%# Bind("ReleaseDate") %>' />
                            <br />
                            StandardCharge:
                            <asp:TextBox ID="StandardChargeTextBox" class="form-control" runat="server" Text='<%# Bind("StandardCharge") %>' />
                            <br />
                            <button style="background-color: #1aa50d; border-color: #1aa50d;"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ForeColor="white" Height="30px" /></button>
                            <button style="background-color: brown; border-color: brown;">&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Height="30px" ForeColor="white" /></button>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <button style="background-color: brown; border-color: brown; margin-top: 7%; "> &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Height="30px"  Text="Add New" ForeColor="white" BackColor="brown" BorderColor="brown" /></button>
                        </ItemTemplate>
                    </asp:FormView>
                    </div>
                </div>
                </div>
            </div>
        </div>
</asp:Content>

