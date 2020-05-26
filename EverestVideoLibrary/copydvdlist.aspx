<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="copydvdlist.aspx.cs" Inherits="EverestVideoLibrary.copydvdlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="container-fluid" style="margin-left:23em; height:90vh;">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -2%;">DVD Details List</h4>
                <div class="column col-6" style="margin-left: -3%; margin-top: 2%;">
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True" PageSize="5">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="CopiesOnShelf" HeaderText="CopiesOnShelf" SortExpression="CopiesOnShelf" ReadOnly="True" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT DVD.DVD_title, COUNT(DVD_Copy.CopyID) AS CopiesOnShelf FROM DVD_Copy JOIN DVD ON DVD.DVD_ID = DVD_Copy.DVD_ID JOIN CastMember
ON CastMember.DVD_ID = DVD.DVD_ID JOIN Actor ON Actor.ActorID = CastMember.ActorID
WHERE (DVD_Copy.CopyID NOT IN (SELECT Loan.CopyID From Loan) OR DVD_Copy.CopyID IN 
(SELECT Loan.CopyID From Loan where Loan.ReturnedDate IS NOT NULL)) AND Actor.ActorID = '11' GROUP BY DVD.DVD_title"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Actor_Lname" DataValueField="Actor_Lname"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT DISTINCT Actor_Lname FROM Actor"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
