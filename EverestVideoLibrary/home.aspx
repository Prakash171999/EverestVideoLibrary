<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="EverestVideoLibrary.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        .table1{
            float: left;
            margin-top: 12%;
            font-size: 18px;
        }
        .table2 {
            float: right;
            margin-top: 12%;
            margin-right: 15%;
            font-size: 18px;
        }
        .nav-menu{
            margin-top: -8%;
                 }
        .button1{
            margin-top: 2%;
        }
        
    </style>
</head>
<body style="background-color:#1a202e">
    <form id="form1" runat="server" >
        <div class="container-fluid" >
            <div class="logo" style="margin-left: 4%
    "> 
                <asp:Image ID="Image1" runat="server" ImageUrl="~/paramount.png" Height="121px" Width="205px"/>
            </div>  
            <div class="nav-menu" style="                    margin-left: 92%;
            ">
                <input id="loginbtn" type="button" value="Log In" style="background-color:brown; border-color:brown; color:white; font-size:18px; width: 69px; height: 29px;"/>
            </div>
           
            
            <div class="table1" style="margin-left: 12%;">
                <div class="table-title1" style="margin-bottom: 3%;">
                    <asp:Label ID="Label1" runat="server" Text="Search DVD Titles"></asp:Label>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ActorID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" GridLines="Vertical" BorderStyle="None">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="ActorID" HeaderText="ActorID" InsertVisible="False" ReadOnly="True" SortExpression="ActorID" />
                        <asp:BoundField DataField="Actor_Fname" HeaderText="Actor_Fname" SortExpression="Actor_Fname" />
                        <asp:BoundField DataField="Actor_Lname" HeaderText="Actor_Lname" SortExpression="Actor_Lname" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="Brown" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:DropDownList ID="DropDownList1" style="margin-top:3%; height: 27px;" runat="server" DataSourceID="SqlDataSource2" DataTextField="Actor_Fname" DataValueField="Actor_Fname"></asp:DropDownList>
                <div class="button1" >
                    <asp:Button ID="Button1" runat="server" Text="Search DVDs" style="background-color:forestgreen; border-color:forestgreen; height:28px;font-size:15px;color:white;text-align:justify;"/>
                </div>
                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [Actor_Fname] FROM [Actor]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [ActorID], [Actor_Fname], [Actor_Lname] FROM [Actor]"></asp:SqlDataSource>
            </div>
            <div class="table2" style="margin-left: 5%;">
                <div class="table2-title" style="margin-bottom: 3%;">
                    <asp:Label ID="Label2" runat="server" Text="Search DVD Copies"></asp:Label>
                </div>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ActorID" DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" GridLines="Vertical" BorderStyle="None">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="ActorID" HeaderText="ActorID" InsertVisible="False" ReadOnly="True" SortExpression="ActorID" />
                        <asp:BoundField DataField="Actor_Fname" HeaderText="Actor_Fname" SortExpression="Actor_Fname" />
                        <asp:BoundField DataField="Actor_Lname" HeaderText="Actor_Lname" SortExpression="Actor_Lname" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="Brown" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:DropDownList ID="DropDownList2" style="margin-top:3%; height: 27px;" runat="server" DataSourceID="SqlDataSource4" DataTextField="Actor_Lname" DataValueField="Actor_Lname"></asp:DropDownList>
                 <div class="button1" >
                     <asp:Button ID="Button2" runat="server" Text="Search DVD Copies" style="background-color:forestgreen; border-color:forestgreen; height:28px;font-size:15px;color:white;text-align:justify;" />
                </div>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [Actor_Lname] FROM [Actor]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT * FROM [Actor]"></asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
