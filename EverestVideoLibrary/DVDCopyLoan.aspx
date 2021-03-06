﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DVDCopyLoan.aspx.cs" Inherits="EverestVideoLibrary.DVDCopyLoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">List of DVD copies on loan</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <%-- Gridview starts from here --%>
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="LoanID" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="LoanID" HeaderText="LoanID" InsertVisible="False" ReadOnly="True" SortExpression="LoanID" />
                            <asp:BoundField DataField="CopyID" HeaderText="CopyID" SortExpression="CopyID" />
                            <asp:BoundField DataField="IssuedDate" HeaderText="IssuedDate" SortExpression="IssuedDate" />
                            <asp:BoundField DataField="TotalLoansInIssuedDate" HeaderText="TotalLoansInIssuedDate" ReadOnly="True" SortExpression="TotalLoansInIssuedDate" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="MemberName" HeaderText="MemberName" ReadOnly="True" SortExpression="MemberName" />
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
                    <%-- SqlDataSource for above gridview --%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT Loan.LoanID, Loan.CopyID, Loan.IssuedDate, C.TotalLoansInIssuedDate, DVD_title, 
                        CONCAT(Member.Member_Fname, ' ', Member.Member_Lname) AS MemberName FROM Member JOIN Loan ON Member.MemberID = Loan.MemberID INNER JOIN 
                        (SELECT IssuedDate,Count(IssuedDate) as TotalLoansInIssuedDate FROM Loan GROUP BY IssuedDate) AS C 
                        ON Loan.IssuedDate = C.IssuedDate JOIN DVD_Copy ON DVD_Copy.CopyID = Loan.CopyID JOIN DVD ON 
                        DVD.DVD_ID = DVD_Copy.DVD_ID WHERE Loan.ReturnedDate IS NULL GROUP BY Loan.CopyID, Loan.IssuedDate, C.TotalLoansInIssuedDate,
                        DVD.DVD_title, Member.Member_Fname, Member.Member_Lname, Loan.LoanID ORDER BY Loan.IssuedDate, DVD.DVD_title">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
