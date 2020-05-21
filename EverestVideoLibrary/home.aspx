<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="EverestVideoLibrary.home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        .table1{
            float: left;
            margin-top: 8%;
            font-size: 18px;
        }
        .table2 {
            float: right;
            margin-top: 8%;
            margin-right: 15%;
            font-size: 18px;
        }
        .nav-menu{
            margin-top: -3%;
                 }
        .button1{
            margin-top: 2%;
        }
        .header{
            background-color:#1a202e;   
        }
        .logo{
            margin-left: 2%;

        }

        /*for popup*/
        .roundedcorner{
            font-size: 11pt;
            margin-left: auto;
            margin-right: auto;
            margin-top: 1px;
            padding: 3px;
        }
        .background{
            background-color: black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .popup{
            background-color: whitesmoke;
            border-color: gray;
            border-width: 3px;
            padding-top: 10px;
            padding-left: 10px;
            width: 350px;
            height: 290px;
        }
    </style>
</head>
<body style="margin-top: -0px; margin-left: -0px; margin-right:-0px; height: 100vh">
    <form id="form1" runat="server" style="padding-top: initial " >
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid">
                <div class="header" style="height: 75px; ">
                <div class="logo"> 
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/logoEVL.png" Height="70px" Width="60px"/>
                </div>  
                <div class="nav-menu" style="margin-left: 92%; ">
                    <a>
                       <asp:HyperLink ID="HyperLink1" runat="server" style="color: white; font-size:19px; width: 69px; height: 29px;">Log In</asp:HyperLink>
                    </a>
                </div>
            </div>
                     
            
            <div class="table1" style="margin-left: 12%;">
                <div class="table-title1" style="margin-bottom: 3%; font-family:Georgia;">
                    <asp:Label ID="Label1" runat="server" Text="Search DVD Titles"></asp:Label>
                </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ActorID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" GridLines="Vertical" BorderStyle="None" style="margin-top: 0px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="ActorID" HeaderText="ActorID" InsertVisible="False" ReadOnly="True" SortExpression="ActorID" HeaderStyle-Width="80px"/>
                        <asp:BoundField DataField="Actor_Fname" HeaderText="Actor_Fname" SortExpression="Actor_Fname" HeaderStyle-Width="120px"/>
                        <asp:BoundField DataField="Actor_Lname" HeaderText="Actor_Lname" SortExpression="Actor_Lname" HeaderStyle-Width="120px" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="brown" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:DropDownList ID="DropDownList1" style="margin-top:3%; " runat="server" DataSourceID="SqlDataSource2" DataTextField="Actor_Lname" DataValueField="Actor_Lname"  Width="125px" Font-Bold="False" Font-Size="Large"></asp:DropDownList>
                                
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [Actor_Lname] FROM [Actor]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [ActorID], [Actor_Fname], [Actor_Lname] FROM [Actor]"></asp:SqlDataSource>
            </div>
            
            <div class="table2" style="margin-left: 5%;">
                <div class="table2-title" style="margin-bottom: 3%; font-family:Georgia">
                    <asp:Label ID="Label2" runat="server" Text="Search DVD Copies"></asp:Label>
                </div>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ActorID" DataSourceID="SqlDataSource3" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" GridLines="Vertical" BorderStyle="None">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="ActorID" HeaderText="ActorID" InsertVisible="False" ReadOnly="True" SortExpression="ActorID" HeaderStyle-Width="80px"/>
                        <asp:BoundField DataField="Actor_Fname" HeaderText="Actor_Fname" SortExpression="Actor_Fname" HeaderStyle-Width="120px" />
                        <asp:BoundField DataField="Actor_Lname" HeaderText="Actor_Lname" SortExpression="Actor_Lname" HeaderStyle-Width="120px" />
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
                <asp:DropDownList ID="DropDownList2" style="margin-top:3%; height: 27px;" runat="server" DataSourceID="SqlDataSource4" DataTextField="Actor_Lname" DataValueField="Actor_Lname" Width="125px" Font-Size="Large"></asp:DropDownList>
                
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT [Actor_Lname] FROM [Actor]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT * FROM [Actor]"></asp:SqlDataSource>
            </div>
            </div>
            <br/><br />
                <asp:Panel ID="Panel1" CssClass="popup roundedcorner" runat="server">
                    <h2 style="margin-left:40%; width: 73px; margin-top:4%;">
                        <asp:Label ID="Label3" runat="server" Text="Log In"></asp:Label>
                    </h2>
                    <div class="popDialogue" style="margin-left:13%; margin-top: 10%; width: 256px;">
                               
                        Username:&nbsp; <asp:TextBox ID="TextBox1" runat="server" Width="170px" Height="23px"></asp:TextBox><br /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Username!" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator><br />
                        Password:&nbsp;&nbsp; <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" Width="170px" Height="23px" OnTextChanged="TextBox2_TextChanged" style="margin-bottom: 0px"></asp:TextBox><br /><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password!" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                        <div class="btn-login" style="margin-left:64%; width: 74px; ">
                           <asp:Button ID="Button3" runat="server" Text="Log In" Width="77px" Height="31px" OnClick="Button3_Click" BackColor="#CC0000" BorderColor="#CC0000" Font-Bold="True" ForeColor="White"  />
                        </div>
                        <%--<div class="btn-cancel" style="margin-top: -12%; margin-left: 28%;">
                           <asp:Button ID="Button4" runat="server" Text="Cancel" Width="77px" Height="31px" BackColor="#009900" BorderColor="#009900" Font-Bold="True" ForeColor="White" OnClick="Button4_Click"  />
                        </div>--%>
                        <div class="login-msg" style="margin-top: 4%; text-align:center">
                            <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="HyperLink1" PopupControlID="Panel1" BehaviorID="mpe" BackgroundCssClass="background" runat="server"></ajaxToolkit:ModalPopupExtender>
            </form>
   </body>
    <script type="text/javascript">
    function pageLoad() {
        var modalPopup = $find('mpe');
        modalPopup.add_shown(function () {
            modalPopup._backgroundElement.addEventListener("click", function () {
                modalPopup.hide();
            });
        });
    };
</script>
</html>
