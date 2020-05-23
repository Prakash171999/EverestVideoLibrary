<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddNewDVD.aspx.cs" Inherits="EverestVideoLibrary.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">List of member who didn't borrowed DVD</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <asp:GridView  runat="server"  CssClass="table table-striped table-hover" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="DVD_ID" DataSourceID="sqlNewDVD" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_ID" HeaderText="DVD_ID" InsertVisible="False" ReadOnly="True" SortExpression="DVD_ID" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:BoundField DataField="ProducerID" HeaderText="ProducerID" SortExpression="ProducerID" />
                            <asp:BoundField DataField="StudioID" HeaderText="StudioID" SortExpression="StudioID" />
                            <asp:CheckBoxField DataField="IsAgeRestricted" HeaderText="IsAgeRestricted" SortExpression="IsAgeRestricted" />
                            <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
                            <asp:BoundField DataField="StandardCharge" HeaderText="StandardCharge" SortExpression="StandardCharge" />
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
                    <asp:SqlDataSource ID="sqlNewDVD" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [DVD_ID], [DVD_title], [Category], [ProducerID], [StudioID], [IsAgeRestricted], [ReleaseDate], [StandardCharge] FROM [DVD]" DeleteCommand="DELETE FROM [DVD] WHERE [DVD_ID] = @DVD_ID" InsertCommand="INSERT INTO [DVD] ([DVD_title], [Category], [ProducerID], [StudioID], [IsAgeRestricted], [ReleaseDate], [StandardCharge]) VALUES (@DVD_title, @Category, @ProducerID, @StudioID, @IsAgeRestricted, @ReleaseDate, @StandardCharge)" UpdateCommand="UPDATE [DVD] SET [DVD_title] = @DVD_title, [Category] = @Category, [ProducerID] = @ProducerID, [StudioID] = @StudioID, [IsAgeRestricted] = @IsAgeRestricted, [ReleaseDate] = @ReleaseDate, [StandardCharge] = @StandardCharge WHERE [DVD_ID] = @DVD_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="DVD_ID" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DVD_title" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="ProducerID" Type="Int64" />
                            <asp:Parameter Name="StudioID" Type="Int64" />
                            <asp:Parameter Name="IsAgeRestricted" Type="Boolean" />
                            <asp:Parameter DbType="Date" Name="ReleaseDate" />
                            <asp:Parameter Name="StandardCharge" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DVD_title" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="ProducerID" Type="Int64" />
                            <asp:Parameter Name="StudioID" Type="Int64" />
                            <asp:Parameter Name="IsAgeRestricted" Type="Boolean" />
                            <asp:Parameter DbType="Date" Name="ReleaseDate" />
                            <asp:Parameter Name="StandardCharge" Type="Int32" />
                            <asp:Parameter Name="DVD_ID" Type="Int64" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
