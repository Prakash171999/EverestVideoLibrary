<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AssisPwdChange.aspx.cs" Inherits="EverestVideoLibrary.AssisPwdChange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="main" style="margin-left: -5.5%; top: 2px; left: 3px; height: 600px;">
          <div class="card text-center" style="width: 40%; height:27em; margin-top: 7%; margin-left: 28%">
              <div class="card-header" style="font-size: 20px; font-weight: bold">
                Change Password
              </div>
              <div class="card-body">
                  <p style="color:black; margin-left: -58%;">New Password:</p> 
                  <div style="margin-left: 5%;">
                      <asp:TextBox ID="NewPwd" TextMode="Password" class="form-control"  runat="server" Width="95%"></asp:TextBox><br />
                      <div style="margin-left: 50%; margin-top: -4.5%">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="NewPwd" runat="server" ForeColor="red"   ErrorMessage="Enter the password!"></asp:RequiredFieldValidator>
                      </div>
                  </div>
                   <p style="color:black; margin-left: -50%;">Confirm Password:</p> 
                  <div style="margin-left: 5%;">
                     <asp:TextBox ID="ConfirmPwd" TextMode="Password" class="form-control" runat="server" Width="95%"></asp:TextBox><br/>
                      <div style="margin-left: 50%; margin-top: -4.5%">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ConfirmPwd" runat="server" ForeColor="red" ErrorMessage="Enter the password!"></asp:RequiredFieldValidator>
                      </div>
                       <div style="margin-left: -7%; margin-top: -3.5%">
                          <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" ControlToValidate="ConfirmPwd" ControlToCompare="NewPwd" runat="server" ErrorMessage="Password didn't match!"></asp:CompareValidator>
                       </div>
                  </div>
                  <div class="chgPwdBtn" style="margin-top:5%">
                      <asp:Button ID="Submit" runat="server" Text="Submit"  BackColor="#000046" BorderColor="#000046" ForeColor="white" Height="37px" Width="193px" OnClick="Submit_Click" />
                  </div>
              </div>
         </div>
       </div>
    </div>
</asp:Content>
