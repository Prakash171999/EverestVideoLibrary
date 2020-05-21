<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="loanedDVDList.aspx.cs" Inherits="EverestVideoLibrary.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">List of member who loaned DVD's</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <asp:GridView CssClass="table table-striped table-hover" runat="server" DataSourceID="SqlMemberDVDLoaned" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="DVD_ID">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_ID" HeaderText="DVD_ID" InsertVisible="False" ReadOnly="True" SortExpression="DVD_ID" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:CheckBoxField DataField="IsAgeRestricted" HeaderText="IsAgeRestricted" SortExpression="IsAgeRestricted"></asp:CheckBoxField>
                            <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
                            <asp:BoundField DataField="StandardCharge" HeaderText="StandardCharge" SortExpression="StandardCharge" />
                            <asp:BoundField DataField="PenaltyCharge" HeaderText="PenaltyCharge" SortExpression="PenaltyCharge" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle BackColor="#1a202e" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#0000A9" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#000065" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlMemberDVDLoaned" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [DVD_ID], [DVD_title], [Category], [IsAgeRestricted], [ReleaseDate], [StandardCharge], [PenaltyCharge] FROM [DVD]"></asp:SqlDataSource>
                    <div class="memberID-dropdown" style="margin-top: 30px;">
                        Select MemberID: &nbsp; <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="memberIDDropdown" DataTextField="MemberID" DataValueField="MemberID" Height="29px" Width="130px" Font-Size="Large"></asp:DropDownList>
                        <asp:SqlDataSource ID="memberIDDropdown" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [MemberID] FROM [Member]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
