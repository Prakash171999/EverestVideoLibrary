<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NotBorrowedDVDs.aspx.cs" Inherits="EverestVideoLibrary.NotBorrowedDVDs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">List of member who didn't borrowed DVD</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <%-- Gridview stars from here --%>
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover"  runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="Member_Fname" HeaderText="Member_Fname" SortExpression="Member_Fname" />
                            <asp:BoundField DataField="Member_Lname" HeaderText="Member_Lname" SortExpression="Member_Lname" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="IssuedDate" HeaderText="IssuedDate" SortExpression="IssuedDate" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="TotalDays" HeaderText="TotalDays" SortExpression="TotalDays" ReadOnly="True" />
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
                    <%-- Gridview ends here --%>
                    <%-- Sql data source for above gridview --%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT Member.Member_Fname, Member.Member_Lname, Member.Address,
                        Loan.IssuedDate, DVD.DVD_title, DATEDIFF(day, Loan.IssuedDate, GETDATE()) 
                        AS TotalDays FROM Member JOIN Loan ON 
                        Member.MemberID = Loan.MemberID JOIN DVD_Copy ON
                        DVD_Copy.CopyID = Loan.CopyID JOIN DVD ON
                        DVD.DVD_ID = DVD_Copy.DVD_ID WHERE Loan.IssuedDate &lt;= (GETDATE()-31) AND Loan.MemberID = Member.MemberID
                        GROUP BY Member.Member_Fname, Member.Member_Lname, Member.Address, Loan.IssuedDate, DVD.DVD_title">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

