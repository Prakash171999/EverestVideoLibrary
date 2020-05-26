<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DVDAddForm.aspx.cs" Inherits="EverestVideoLibrary.DVDAddForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main class="my-form">
    <div class="cotainer"style="height: 120vh">
        <div class="row justify-content-center">
            <div class="col-md-8" style="margin-top: 50px;">
                    <div class="card">
                        <div class="card-header" style="font-size: 20px; text-align: center; font-weight: bold">Register New DVD</div>
                        <div class="card-body" style="margin-top: 3%;">
                                <div class="form-group row">
                                    <label for="DVD_title" class="col-md-4 col-form-label text-md-right">DVD Title</label>
                                    <div class="col-md-6">
                                        <input type="text" id="dvd_title" class="form-control" runat="server" name="dvd_title" required>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="category" class="col-md-4 col-form-label text-md-right">DVD Category</label>
                                    <div class="col-md-6">
                                        <input type="text" id="category" class="form-control" runat="server" name="category" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="Producer" class="col-md-4 col-form-label text-md-right">Producer Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="Producer" class="form-control" runat="server" name="Producer" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="Studio" class="col-md-4 col-form-label text-md-right">Studio Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="Studio" class="form-control" runat="server" name="Studio" required>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="Actor" class="col-md-4 col-form-label text-md-right">Actor Names</label>
                                    <div class="col-md-6">
                                        <input type="text" id="Actor" name="Actor" runat="server" class="form-control" required>
                                    </div>
                                </div>
                                
                                <div class="radioBtnAge" style="margin-left: 22%; margin-top: 3%;">
                                    <div class="labelAgeRest" style="margin-left: -10em">
                                        <label for="ageRestrict" class="col-md-4 col-form-label text-md-right">Age Restriction</label>
                                    </div>
                                </div> 
                                <div class="radioOption" style="margin-left: 8em; margin-top: -2.3em;">
                                   <div class="form-group row">
                                      <label class="col-md-4 col-form-label text-md-right" for="radio1">   
                                            <input type="radio" class="form-check-input"  id="radio1" runat="server" name="optradio" value="option1" checked required >Yes
                                      </label>
                                   </div>
                                    <div class="form-group row" style="margin-left: -4%;">
                                      <label class="col-md-4 col-form-label text-md-right" for="radio2">
                                           <input type="radio" class="form-check-input" id="radio2" runat="server" name="optradio" value="option2" required >No
                                      </label>
                                     </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="releasedate" class="col-md-4 col-form-label text-md-right">Release Date</label>
                                    <div class="col-md-6">
                                        <input type="date" id="releasedate" class="form-control" runat="server" name="releasedate" required >
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="StandardCharge" class="col-md-4 col-form-label text-md-right">Standard Charge</label>
                                    <div class="col-md-6">
                                        <input type="text" id="StandardCharge" class="form-control" runat="server" name="StandardCharge" required >
                                    </div>
                                </div>
                               <div class="form-group row">
                                    <label for="PenaltyCharge" class="col-md-4 col-form-label text-md-right">Penalty Charge</label>
                                    <div class="col-md-6">
                                        <input type="text" id="PenaltyCharge" class="form-control" runat="server" name="PenaltyCharge" required >
                                    </div>
                                </div>
                            <div class="form-group row">
                                    <label for="TotalCopies" class="col-md-4 col-form-label text-md-right">Total Copies</label>
                                    <div class="col-md-6">
                                        <input type="text" id="TotalCopies" class="form-control" runat="server" name="PenaltyCharge" required >
                                    </div>
                                </div>
                                    <div class="col-md-6 offset-md-4">
                                        <asp:Button ID="dvdSubmit" runat="server" Text="Submit" BackColor="maroon" ForeColor="White" BorderColor="maroon" width="90px" Height="35px" OnClick="dvdSubmit_Click" />
                                    </div>
                                </div>
                        </div>
                    </div>
            </div>
        </div>
  
  </main>
</asp:Content>

