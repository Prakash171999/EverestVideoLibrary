<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberBorrowedDVDs.aspx.cs" Inherits="EverestVideoLibrary.MemberBorrowedDVDs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">List of member who borrowed DVD</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <asp:GridView ID="GridView1"  CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="Member_Fname" HeaderText="Member_Fname" SortExpression="Member_Fname" />
                            <asp:BoundField DataField="Member_Lname" HeaderText="Member_Lname" SortExpression="Member_Lname" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                            <asp:BoundField DataField="MemberCategory" HeaderText="MemberCategory" SortExpression="MemberCategory" />
                            <asp:BoundField DataField="LoanNumber" HeaderText="LoanNumber" SortExpression="LoanNumber" ReadOnly="True" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT Member.Member_Fname, Member.Member_Lname, Member.Address, Member.Age, MemberCategory.MemberCategory, (SELECT CASE WHEN Loan.ReturnedDate IS NULL THEN COUNT(Loan.LoanID) ELSE '0' END AS Expr1) AS LoanNumber FROM MemberCategory INNER JOIN Member ON Member.MemberCategoryID = MemberCategory.MemberCategoryID LEFT OUTER JOIN Loan ON Loan.MemberID = Member.MemberID GROUP BY Member.Member_Fname, Member.Member_Lname, Member.Address, Member.Age, MemberCategory.MemberCategory, Loan.ReturnedDate"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

