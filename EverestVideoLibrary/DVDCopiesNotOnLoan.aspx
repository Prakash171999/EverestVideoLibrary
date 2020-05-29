<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DVDCopiesNotOnLoan.aspx.cs" Inherits="EverestVideoLibrary.DVDCopiesNotOnLoan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">List of DVDs with no copies on loan</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <%-- Gridview for DVD copies not on loan starts from here --%>
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="DVD_ID" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_ID" HeaderText="DVD_ID" InsertVisible="False" ReadOnly="True" SortExpression="DVD_ID" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" DataFormatString="{0: dd/MM/yyyy}" />
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
                    <%-- SqlDataSource for the above gridview --%>
                    <asp:SqlDataSource ID="SqlDataSource1"  runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT DVD.DVD_ID, DVD.DVD_title, DVD.Category, DVD.ReleaseDate FROM DVD WHERE DVD.DVD_ID NOT IN
                        (SELECT DVD_Copy.DVD_ID FROM DVD_Copy WHERE DVD_Copy.CopyID IN
                        (SELECT Loan.CopyID FROM Loan WHERE Loan.IssuedDate &gt;= (GETDATE() - 31))) ">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

