<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="EverestVideoLibrary.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="container-fluid">
        <div class="main" style="margin-left: -5.5%; top: 2px; left: 3px; height: 600px;">
            <%-- Login user form --%>
          <div class="card text-center" style="width: 27%; height:26em; margin-top: 7%; margin-left: 40%; font-family:'Palatino' ">
              <div class="card-header" style="font-size: 24px;">
                Log In
              </div>
              <div class="card-body">
                  <p style="color:black; margin-left: -69%; margin-top: 3%; font-size: 18px">Username</p> 
                  <div style="margin-left: 5%;">
                      <asp:TextBox ID="username" class="form-control"  runat="server" Width="95%"></asp:TextBox><br />
                      <div style="margin-left: 36%; margin-top: -4.5%">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="username" runat="server" ForeColor="red"   ErrorMessage="Oops! You missed this one"></asp:RequiredFieldValidator>
                      </div>
                  </div>
                   <p style="color: black; margin-left: -67%;  font-size: 18px">Password:</p> 
                  <div style="margin-left: 5%;">
                     <asp:TextBox ID="password" TextMode="Password" class="form-control" runat="server" Width="95%"></asp:TextBox><br/>
                      <div style="margin-left: 36%; margin-top: -4.5%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="password" runat="server" ForeColor="red" ErrorMessage="Oops! You missed this one"></asp:RequiredFieldValidator>
                      </div>     
                  </div>
                  <div class="loginBtn" style="margin-top:2%">
                     <asp:Button ID="BtnLogin" runat="server" Text="Log In" style="font-size: 20px;" BackColor="Maroon"  BorderColor="Maroon" ForeColor="white" Height="37px" Width="140px" OnClick="BtnLogin_Click" />                      
                  </div>
                  <div class="LoginBtn" style="margin-top: 3%;">
                      <asp:Label ID="loginMsg" runat="server" Text="" ForeColor="Red" ></asp:Label>
                  </div>
              </div>
         </div>
       </div>
    </div>
</asp:Content>
