<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DVDdetails.aspx.cs" Inherits="EverestVideoLibrary.DVDCopyManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="table-wrapper">
            <div class="table-title">
                <h4 style="margin-top:4%; margin-left: -1.5%;">List of DVD details</h4>
                <div class="column col-6" style="margin-left: -3%;">
                    <%-- Gridview starts from here --%>
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" AllowPaging="True" PageSize="4">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="DVD_title" HeaderText="DVD_title" SortExpression="DVD_title" />
                            <asp:BoundField DataField="ProducerName" HeaderText="ProducerName" SortExpression="ProducerName" />
                            <asp:BoundField DataField="StudioName" HeaderText="StudioName" SortExpression="StudioName" />
                            <asp:BoundField DataField="Actor_Lname" HeaderText="Actor_Lname" SortExpression="Actor_Lname" />
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
                    <%-- SqlDataSource for above gridview property --%>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="Select DVD.DVD_title, Producer.ProducerName, Studio.StudioName,  Actor.Actor_Lname, DVD.ReleaseDate FROM Studio JOIN DVD ON Studio.StudioID = DVD.StudioID
                        JOIN Producer ON DVD.ProducerID = Producer.ProducerID 
                        JOIN CastMember ON DVD.DVD_ID = CastMember.DVD_ID JOIN Actor
                        ON CastMember.ActorID = Actor.ActorID
                        ORDER BY DVD.ReleaseDate, Actor.Actor_Lname ">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
