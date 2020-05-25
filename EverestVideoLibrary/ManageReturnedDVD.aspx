<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageReturnedDVD.aspx.cs" Inherits="EverestVideoLibrary.ManageReturnedDVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title" style="margin-left:3%;">
                <h4 style="margin-top:4%; margin-left: -1.5%;">Manage Returned DVD Copies</h4>
                <div class="column col-6" style="margin-left: -3%; height: 800px;" >
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="LoanID" HeaderText="LoanID" InsertVisible="False" ReadOnly="True" SortExpression="LoanID" />
                            <asp:BoundField DataField="CopyID" HeaderText="CopyID" InsertVisible="False" ReadOnly="True" SortExpression="CopyID" />
                            <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                            <asp:BoundField DataField="LoanTypeID" HeaderText="LoanTypeID" InsertVisible="False" ReadOnly="True" SortExpression="LoanTypeID" />
                            <asp:BoundField DataField="LoanType" HeaderText="LoanType" SortExpression="LoanType" />
                            <asp:BoundField DataField="TypeSpan" HeaderText="TypeSpan" SortExpression="TypeSpan" />
                            <asp:BoundField DataField="IssuedDate" HeaderText="IssuedDate" SortExpression="IssuedDate" />
                            <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                            <asp:BoundField DataField="ReturnedDate" HeaderText="ReturnedDate" SortExpression="ReturnedDate" />
                            <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" />
                            <asp:BoundField DataField="Fine" HeaderText="Fine" ReadOnly="True" SortExpression="Fine" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT Loan.LoanID, DVD_Copy.CopyID, Member.MemberID, LoanType.LoanTypeID, LoanType.LoanType, LoanType.LoanDuration AS TypeSpan, Loan.IssuedDate, Loan.DueDate, Loan.ReturnedDate, Loan.TotalDays AS Days, (SELECT CASE WHEN (DVD.PenaltyCharge * ((Loan.TotalDays) - (LoanType.LoanDuration))) &lt; 0 THEN 0 ELSE (DVD.PenaltyCharge * ((Loan.TotalDays) - (LoanType.LoanDuration))) END AS Expr1) AS Fine FROM Member INNER JOIN Loan ON Member.MemberID = Loan.MemberID INNER JOIN DVD_Copy ON Loan.CopyID = DVD_Copy.CopyID INNER JOIN DVD ON DVD.DVD_ID = DVD_Copy.DVD_ID INNER JOIN LoanType ON LoanType.LoanTypeID = Loan.LoanTypeID"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [CopyID] FROM [DVD_Copy]"></asp:SqlDataSource>
                    <div style="margin-left: 5%; margin-top:3%">
                        <h5 style="margin-left: 8em;">
                            <asp:Label ID="Label1" runat="server" Text="Update Returned Date"></asp:Label>
                        </h5>
                        <div class="form-group row" style="margin-top: 5%;">
                          <label for="releasedate" class="col-md-4 col-form-label text-md-right">Copy ID</label>
                          <div class="col-md-6">
                             <asp:DropDownList ID="DropDownList1" Width="" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="CopyID" DataValueField="CopyID"></asp:DropDownList> 
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="releasedate" class="col-md-4 col-form-label text-md-right">Release Date</label>
                          <div class="col-md-6">
                             <input type="date" id="releasedate" class="form-control" name="releasedate" required >
                          </div>
                        </div>
                        <div class="updateBtn" style="margin-left: 18.5em">
                            <asp:Button ID="Button1" runat="server" Text="Update" BackColor="maroon" ForeColor="White" BorderColor="maroon" width="90px" Height="35px"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

