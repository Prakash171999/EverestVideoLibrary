<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageDVDBooking.aspx.cs" Inherits="EverestVideoLibrary.ManageDVDBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:2%; margin-left: -4%;">Manage DVD Booking</h4>
                <div class="column col-6" style="margin-left: -5.5%; top: 2px; left: 3px; height: 1450px;">
                    <%-- Gridview starts from here --%>
                    <%-- Gridviw displays the details of the DVDs on loan --%>
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="LoanID" HeaderText="LoanID" InsertVisible="False" ReadOnly="True" SortExpression="LoanID" />
                            <asp:BoundField DataField="CopyID" HeaderText="CopyID" InsertVisible="False" ReadOnly="True" SortExpression="CopyID" />
                            <asp:BoundField DataField="MemberID" HeaderText="MemberID" InsertVisible="False" ReadOnly="True" SortExpression="MemberID" />
                            <asp:BoundField DataField="LoanTypeID" HeaderText="LoanTypeID" InsertVisible="False" ReadOnly="True" SortExpression="LoanTypeID" />
                            <asp:BoundField DataField="LoanType" HeaderText="LoanType" SortExpression="LoanType" />
                            <asp:BoundField DataField="TypeSpan" HeaderText="TypeSpan" SortExpression="TypeSpan" />
                            <asp:BoundField DataField="IssuedDate" HeaderText="IssuedDate" SortExpression="IssuedDate" DataFormatString="{0: dd/MM/yyyy}" />
                            <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" DataFormatString="{0: dd/MM/yyyy}" />
                            <asp:BoundField DataField="ReturnedDate" HeaderText="ReturnedDate" SortExpression="ReturnedDate" DataFormatString="{0: dd/MM/yyyy}" />
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
                    <%-- Gridview ends here --%>
                    <%-- Sql data source for DVD booking gridview --%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT Loan.LoanID, DVD_Copy.CopyID, Member.MemberID, LoanType.LoanTypeID, LoanType.LoanType, LoanType.LoanDuration AS TypeSpan, Loan.IssuedDate, Loan.DueDate, Loan.ReturnedDate, Loan.TotalDays AS Days, (SELECT CASE WHEN (DVD.PenaltyCharge * ((Loan.TotalDays) - (LoanType.LoanDuration))) &lt; 0 THEN 0 ELSE (DVD.PenaltyCharge * ((Loan.TotalDays) - (LoanType.LoanDuration))) END AS Expr1) AS Fine FROM Member INNER JOIN Loan ON Member.MemberID = Loan.MemberID INNER JOIN DVD_Copy ON Loan.CopyID = DVD_Copy.CopyID INNER JOIN DVD ON DVD.DVD_ID = DVD_Copy.DVD_ID INNER JOIN LoanType ON LoanType.LoanTypeID = Loan.LoanTypeID" DeleteCommand="DELETE FROM [DVD] WHERE [DVD_ID] = @DVD_ID" InsertCommand="INSERT INTO [DVD] ([DVD_title], [Category], [ReleaseDate], [StandardCharge]) VALUES (@DVD_title, @Category, @ReleaseDate, @StandardCharge)" UpdateCommand="UPDATE [DVD] SET [DVD_title] = @DVD_title, [Category] = @Category, [ReleaseDate] = @ReleaseDate, [StandardCharge] = @StandardCharge WHERE [DVD_ID] = @DVD_ID
">
                        <DeleteParameters>
                            <asp:Parameter Name="DVD_ID" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DVD_title" Type="String" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter DbType="Date" Name="ReleaseDate" />
                            <asp:Parameter Name="StandardCharge" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DVD_title" />
                            <asp:Parameter Name="Category" />
                            <asp:Parameter Name="ReleaseDate" />
                            <asp:Parameter Name="StandardCharge" />
                            <asp:Parameter Name="DVD_ID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <%-- Check age restriction form starts from here --%>
                    <div class="check-restriction" style="margin-top: 5%">
                        <h5><asp:Label ID="Label1" runat="server" Text="Check Age Restriction"></asp:Label></h5><br />
                        <h6>Member ID: <asp:DropDownList ID="DropDownList1" CSSClass="form-control" runat="server" DataSourceID="SqlMemberID" DataTextField="MemberID" DataValueField="MemberID"></asp:DropDownList></h6>
                        <asp:SqlDataSource ID="SqlMemberID" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [MemberID] FROM [Member]"></asp:SqlDataSource><br />
                        <h6>DVD Title: <asp:DropDownList CSSClass="form-control" ID="DropDownList2" runat="server" DataSourceID="SqlDVDTitle" DataTextField="DVD_title" DataValueField="DVD_ID"></asp:DropDownList></h6>
                        <asp:SqlDataSource ID="SqlDVDTitle" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [DVD_title], [DVD_ID] FROM [DVD]"></asp:SqlDataSource>
                        <div class="checkBtn" style="margin-top: 5%;">
                            <asp:Button ID="ChkRestrictionBtn" runat="server" Text="Check Restriction" BackColor="#000046" ForeColor="white" Height="38px" Width="153px" BorderColor="#000046" OnClick="ChkRestrictionBtn_Click" />&nbsp;&nbsp;
                        </div>
                    </div>
                    <%-- Age restriction check form ends here --%>

                    <%-- Insert item tempale which appears when add new button is clicked --%>
                    <div class="addBookDetails" style="margin-top:4%;">
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" Height="10px" DataKeyNames="LoanID">
                            <InsertItemTemplate>
                                CopyID:
                                <asp:DropDownList ID="CopyIDDropDownList3" class="form-control" runat="server" Text='<%# Bind("CopyID") %>' DataSourceID="SqlDataSource3" DataTextField="CopyID" DataValueField="CopyID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [CopyID] FROM [DVD_Copy]"></asp:SqlDataSource>
                                <br />
                                MemberID:
                                <asp:DropDownList ID="DropDownList3" class="form-control" runat="server" Text='<%# Bind("MemberID") %>' DataSourceID="SqlDataSource4" DataTextField="MemberID" DataValueField="MemberID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [MemberID] FROM [Member]"></asp:SqlDataSource>
                                <br />
                                LoanTypeID:
                                <asp:DropDownList ID="DropDownList4" class="form-control" runat="server" Text='<%# Bind("LoanTypeID") %>' DataSourceID="SqlDataSource5" DataTextField="LoanTypeID" DataValueField="LoanTypeID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [LoanTypeID] FROM [LoanType]"></asp:SqlDataSource>
                                <br />
                                IssuedDate:
                                <asp:TextBox ID="IssuedDateTextBox" class="form-control" TextMode="Date"  runat="server" Text='<%# Bind("IssuedDate") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="IssuedDateTextBox" ForeColor="Red" runat="server" ErrorMessage="Enter the issued date!"></asp:RequiredFieldValidator>
                                <br />
                                DueDate:
                                <asp:TextBox ID="DueDateTextBox" class="form-control" runat="server" TextMode="Date" Text='<%# Bind("DueDate") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DueDateTextBox" ForeColor="Red" runat="server" ErrorMessage="Enter the due date!"></asp:RequiredFieldValidator>
                                <br />
                                ReturnedDate:
                                <asp:TextBox ID="ReturnedDateTextBox" class="form-control" runat="server" TextMode="Date" Text='<%# Bind("ReturnedDate") %>' />
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ReturnedDateTextBox" ForeColor="Red" runat="server" ErrorMessage="Enter the returned date!"></asp:RequiredFieldValidator>--%>
                                <br />
                                TotalDays:
                                <asp:TextBox ID="TotalDaysTextBox" class="form-control" runat="server" Text='<%# Bind("TotalDays") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TotalDaysTextBox" ForeColor="Red" runat="server" ErrorMessage="Enter the total days!"></asp:RequiredFieldValidator>
                                <br />
                                <div class="crudBtn" style="margin-top: 4%;">
                                    <button style="background-color: #000046; border-color: #000046; width:73px; text-align: center; vertical-align:middle">
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ForeColor="White" Height="30px" OnClick="InsertButton_Click" Width="37px" />
                                    </button>
                                    <button style="background-color: maroon; margin-left:10px; border-color: maroon; text-align: center; vertical-align:middle;">
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server"  CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="White" Height="30px" />
                                    </button>
                                </div>
                            </InsertItemTemplate>
                            <%-- Insert item template ends here --%>
                            <ItemTemplate>
                                <button style="background-color: maroon; border-color: maroon;">
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New" BackColor="maroon" ForeColor="White" BorderColor="maroon" width="75px" Height="30px" />
                                </button>
                            </ItemTemplate>
                    </asp:FormView>
                        <%-- Sql data source for the insert item template form to insert the form data to the database --%>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" DeleteCommand="DELETE FROM [Loan] WHERE [LoanID] = @LoanID" InsertCommand="INSERT INTO [Loan] ([CopyID], [MemberID], [LoanTypeID], [IssuedDate], [DueDate], [ReturnedDate], [TotalDays]) VALUES (@CopyID, @MemberID, @LoanTypeID, @IssuedDate, @DueDate, @ReturnedDate, @TotalDays)" SelectCommand="SELECT * FROM [Loan]" UpdateCommand="UPDATE [Loan] SET [CopyID] = @CopyID, [MemberID] = @MemberID, [LoanTypeID] = @LoanTypeID, [IssuedDate] = @IssuedDate, [DueDate] = @DueDate, [ReturnedDate] = @ReturnedDate, [TotalDays] = @TotalDays WHERE [LoanID] = @LoanID">
                            <DeleteParameters>
                                <asp:Parameter Name="LoanID" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="CopyID" Type="Int64" />
                                <asp:Parameter Name="MemberID" Type="Int64" />
                                <asp:Parameter Name="LoanTypeID" Type="Int64" />
                                <asp:Parameter DbType="Date" Name="IssuedDate" />
                                <asp:Parameter DbType="Date" Name="DueDate" />
                                <asp:Parameter DbType="Date" Name="ReturnedDate" />
                                <asp:Parameter Name="TotalDays" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="CopyID" Type="Int64" />
                                <asp:Parameter Name="MemberID" Type="Int64" />
                                <asp:Parameter Name="LoanTypeID" Type="Int64" />
                                <asp:Parameter DbType="Date" Name="IssuedDate" />
                                <asp:Parameter DbType="Date" Name="DueDate" />
                                <asp:Parameter DbType="Date" Name="ReturnedDate" />
                                <asp:Parameter Name="TotalDays" Type="Int32" />
                                <asp:Parameter Name="LoanID" Type="Int64" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                </div>
            </div>
        </div>
</asp:Content>

