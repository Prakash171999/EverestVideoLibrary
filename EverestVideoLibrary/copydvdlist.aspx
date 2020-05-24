<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="copydvdlist.aspx.cs" Inherits="EverestVideoLibrary.copydvdlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="container-fluid" style="margin-left:23em; height:90vh;">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -2%;">DVD Details List</h4>
                <div class="column col-6" style="margin-left: -3%; margin-top: 2%;">
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="DVD_ID" DataSourceID="SqlDataSource1" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_ID" HeaderText="DVD_ID" InsertVisible="False" ReadOnly="True" SortExpression="DVD_ID" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:CheckBoxField DataField="IsAgeRestricted" HeaderText="IsAgeRestricted" SortExpression="IsAgeRestricted" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [DVD_ID], [DVD_title], [Category], [IsAgeRestricted] FROM [DVD]"></asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Actor_Lname" DataValueField="Actor_Lname"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT DISTINCT Actor_Lname FROM Actor"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
