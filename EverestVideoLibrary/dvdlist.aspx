<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="dvdlist.aspx.cs" Inherits="EverestVideoLibrary.dvdlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="container-fluid" style="margin-left:23em; height:90vh;">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -2%;">DVD Details List</h4>
                <div class="column col-6" style="margin-left: -3%; margin-top: 2%;">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="DVD_ID" DataSourceID="Sqlgridview" GridLines="Vertical" AllowPaging="True" PageSize="5">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_ID" HeaderText="DVD_ID" InsertVisible="False" ReadOnly="True" SortExpression="DVD_ID" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
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
                    </asp:GridView><br />
                    <asp:SqlDataSource ID="Sqlgridview" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [DVD_ID], [DVD_title] FROM [DVD]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="Sqldropdown" DataTextField="Actor_Lname" DataValueField="Actor_Lname"></asp:DropDownList>
                    <asp:SqlDataSource ID="Sqldropdown" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT DISTINCT Actor_Lname FROM Actor"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
