<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DVDCopyDetails.aspx.cs" Inherits="EverestVideoLibrary.DVDCopyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">DVD Copy Details</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover"  runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CopyID,MemberID" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="CopyID" HeaderText="CopyID" SortExpression="CopyID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Member_Fname" HeaderText="Member_Fname" SortExpression="Member_Fname" />
                            <asp:BoundField DataField="Member_Lname" HeaderText="Member_Lname" SortExpression="Member_Lname" />
                            <asp:BoundField DataField="IssuedDate" DataFormatString="{0: dd/MM/yyyy}" HeaderText="IssuedDate" SortExpression="IssuedDate" />
                            <asp:BoundField DataField="DueDate" DataFormatString="{0: dd/MM/yyyy}" HeaderText="DueDate" SortExpression="DueDate" />
                            <asp:BoundField DataField="ReturnedDate" DataFormatString="{0: dd/MM/yyyy}" HeaderText="ReturnedDate" SortExpression="ReturnedDate" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT DVD.DVD_title, DVD_Copy.CopyID, Member.MemberID, Member.Member_Fname, Member.Member_Lname, Loan.IssuedDate, 
Loan.DueDate, Loan.ReturnedDate FROM Member INNER JOIN Loan ON Member.MemberID = Loan.MemberID JOIN DVD_Copy 
ON Loan.CopyID = DVD_Copy.CopyID JOIN DVD ON DVD_Copy.DVD_ID = DVD.DVD_ID WHERE (@CopyID = DVD_Copy.CopyID) 
GROUP BY DVD.DVD_title, DVD_Copy.CopyID, Member.MemberID, Member.Member_Fname, Member.Member_Lname, Loan.IssuedDate, Loan.DueDate, Loan.ReturnedDate 
Having(Loan.IssuedDate= (Select MAX(IssuedDate) from LatestIssuedDateView where @CopyID = CopyID) Or IssuedDate is null)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="3000" Name="CopyID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="memberID-dropdown" style="margin-top: 30px; width: 35%;">
                        Select DVD CopyID:<asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="CopyID" DataValueField="CopyID" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [CopyID] FROM [DVD_Copy]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
