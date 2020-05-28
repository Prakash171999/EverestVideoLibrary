<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="loanedDVDList.aspx.cs" Inherits="EverestVideoLibrary.loanedDVDList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">List of member who loaned DVD's</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <asp:GridView CssClass="table table-striped table-hover" runat="server" DataSourceID="SqlMemberDVDLoaned" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataKeyNames="CopyID" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="CopyID" HeaderText="CopyID" SortExpression="CopyID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="MemberName" HeaderText="MemberName" SortExpression="MemberName" ReadOnly="True" />
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
                    <asp:SqlDataSource ID="SqlMemberDVDLoaned" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT DVD.DVD_title, DVD_Copy.CopyID, CONCAT(Member.Member_Fname, ' ', Member.Member_Lname) AS MemberName FROM DVD JOIN DVD_Copy 
ON DVD.DVD_ID = DVD_Copy.DVD_ID JOIN Loan 
ON DVD_Copy.CopyID = Loan.CopyID JOIN Member
On Loan.MemberID = Member.MemberID
WHERE Loan.IssuedDate &gt;= (GETDATE() - 31)  AND @MemberID = Member.MemberID">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="6000" Name="MemberID" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="memberID-dropdown" style="margin-top: 30px; width: 35%;">
                        Select MemberID: &nbsp; <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="memberIDDropdown" DataTextField="MemberID" DataValueField="MemberID"  Font-Size="Large" AutoPostBack="True"></asp:DropDownList>
                        <asp:SqlDataSource ID="memberIDDropdown" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [MemberID] FROM [Member]"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
