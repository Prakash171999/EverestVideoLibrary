<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EverestVideoLibrary.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="margin-top: 2%;">
        <div id="page-content-wrapper">                
            <!--Contents of the body goes here!-->
            <div class="container">
                <div class="row mb-3">
                    <!--First Card-->
                    <div class="col-xl-4 col-sm-3 py-2">
                        <div class="card bg-white text-white">
                            <div class="card-body" style="background-color: #a90414">
                                <h2 class="display-6" style="margin-left:25px;">
                                    <asp:Label ID="Members" runat="server" Text=""></asp:Label>
                                    <asp:SqlDataSource ID="sqlMember" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT COUNT(*) AS Expr1 FROM Member"></asp:SqlDataSource>
                                </h2>
                                <h5 class="text-uppercase" style="margin-left:5px;">Members</h5>
                                <a href="" style="margin-left:5px; margin-bottom: 10px; font-size:14px;">View Members</a>
                            </div>
                        </div>
                    </div>
                    <!--second Card-->
                    <div class="col-xl-4 col-sm-3 py-2">
                        <div class="card bg-white text-white">
                            <div class="card-body" style="background-color: #0a122b">
                                <h2 class="display-6" style="margin-left:25px;">
                                    <asp:Label ID="DVD" runat="server" Text=""></asp:Label>
                                    <asp:SqlDataSource ID="sqlDVD" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT COUNT(*) AS Expr1 FROM DVD"></asp:SqlDataSource>
                                </h2>
                                <h6 class="text-uppercase" style="margin-left:10px; margin-top:5px;">DVD's</h6>
                                <a href="" style="margin-left:10px; margin-bottom:5px;"">View DVD's</a>
                            </div>
                        </div>
                    </div>
                     <!--Third Card-->
                    <div class="col-xl-4 col-sm-3 py-2">
                        <div class="card bg-white text-white">
                            <div class="card-body" style="background-color: #e2ac13">
                                <h2 class="display-6" style="margin-left:25px;">
                                    <asp:Label ID="actor" runat="server" Text=""></asp:Label>
                                    <asp:SqlDataSource ID="sqlActor" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT COUNT(*) AS Expr1 FROM Actor"></asp:SqlDataSource>
                                </h2>
                                <h6 class="text-uppercase" style="margin-left:10px; margin-top:5px;">Actors</h6>
                                <a href="" style="margin-left: 10px; margin-bottom: 5px;">View Staff</a>
                            </div>
                        </div>
                    </div>
                     <!--Fourth Card-->
                    <div class="col-xl-4 col-sm-3 py-2">
                        <div class="card bg-white text-white">
                            <div class="card-body" style="background-color: #238423">
                                <h2 class="display-6" style="margin-left:25px;">
                                    <asp:Label ID="producers" runat="server" Text=""></asp:Label>
                                    <asp:SqlDataSource ID="sqlProducer" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT COUNT(*) AS Expr1 FROM Producer"></asp:SqlDataSource>
                                </h2>
                                <h6 class="text-uppercase" style="margin-left:10px; margin-top:5px;">Producers</h6>
                                <a href="" style="margin-left:10px; margin-bottom:5px;"">View Producers</a>
                            </div>
                        </div>
                    </div>
                     <!--Fifth Card-->
                    <div class="col-xl-4 col-sm-3 py-2">
                        <div class="card bg-white text-white">
                            <div class="card-body" style="background-color: #4800ff">
                                <h2 class="display-6" style="margin-left:25px;">
                                    <asp:Label ID="studio" runat="server" Text=""></asp:Label>
                                    <asp:SqlDataSource ID="sqlStudio" runat="server" ConnectionString="<%$ ConnectionStrings:EverestVideoLibraryConnectionString %>" SelectCommand="SELECT COUNT(*) AS Expr1 FROM Studio"></asp:SqlDataSource>
                                </h2>
                                <h6 class="text-uppercase" style="margin-left:10px; margin-top:5px;">Studio</h6>
                                <a href="" style="margin-left:10px; margin-bottom:5px;"">View Studio</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

