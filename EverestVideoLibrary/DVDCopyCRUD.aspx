<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DVDCopyCRUD.aspx.cs" Inherits="EverestVideoLibrary.DVDCopyCRUD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title" style="margin-left: 5%;">
                <h4 style="margin-top:4%; margin-left: -1.5%;">Manage DVD Copies</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CopyID" GridLines="Vertical" AllowPaging="True" PageSize="6" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="sqlOldCopies">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="CopyID" HeaderText="CopyID" InsertVisible="False" ReadOnly="True" SortExpression="CopyID" />
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="deleteBtn" runat="server" CssClass="btn btn-danger" OnClick="OldDVDDelete_Click">Delete</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderTemplate>
                                    Action
                                </HeaderTemplate>
                            </asp:TemplateField>
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
                    <asp:SqlDataSource ID="sqlOldCopies" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="select DVD.DVD_ID, DVD_title, DVD_Copy.CopyID, DVD.ReleaseDate from DVD join DVD_Copy on DVD.DVD_ID = DVD_Copy.DVD_ID left join Loan on DVD_Copy.CopyID = loan.CopyID where DVD.ReleaseDate &lt; GETDATE() - 356 and DVD_Copy.CopyID not in (select CopyID from loan)" DeleteCommand="DELETE FROM [DVD_Copy] WHERE [CopyID] = @CopyID" InsertCommand="INSERT INTO [DVD] ([DVD_title], [Category]) VALUES (@DVD_title, @Category)" UpdateCommand="UPDATE [DVD] SET [DVD_title] = @DVD_title, [Category] = @Category WHERE [DVD_ID] = @DVD_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="CopyID" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DVD_title" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DVD_title" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="DVD_ID" Type="Int64" />
                        </UpdateParameters>
                    </asp:SqlDataSource>                   
                </div>
            </div>
        </div>
    </div>
</asp:Content>

