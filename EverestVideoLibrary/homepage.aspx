<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="EverestVideoLibrary.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent2" runat="server">
    <div class="container-fluid" style="padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom:0px">                 
    <%--<div class="fakeimg" style="padding-top: 0px;">Fake Image</div>--%>
        <!--Carousel Wrapper-->
        <div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel">
          <!--Indicators-->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-2" data-slide-to="1"></li>
            <li data-target="#carousel-example-2" data-slide-to="2"></li>
          </ol>
          <!--/.Indicators-->
          <!--Slides-->
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <div class="view">
                <img class="d-block w-100" src="slideIMG/avenger4.jpg"
                  alt="First slide">
                <div class="mask rgba-black-light"></div>
              </div>
             
            </div>
            <div class="carousel-item">
              <!--Mask color-->
              <div class="view">
                <img class="d-block w-100" src="slideIMG/spiderman1.jpg"
                  alt="Second slide">
                <div class="mask rgba-black-strong"></div>
              </div>
            </div>

            <div class="carousel-item">
              <!--Mask color-->
              <div class="view">
                <img class="d-block w-100" src="slideIMG/Extraction.jpg"
                  alt="Third slide">
                <div class="mask rgba-black-slight"></div>
              </div>
            </div>

            <div class="carousel-item">
              <!--Mask color-->
              <div class="view">
                <img class="d-block w-100" src="slideIMG/justice league.jpg"
                  alt="Third slide">
                <div class="mask rgba-black-slight"></div>
              </div>  
            </div>

            <div class="carousel-item">
              <!--Mask color-->
              <div class="view">
                <img class="d-block w-100" src="slideIMG/avatar1.jpg"
                  alt="Third slide">
                <div class="mask rgba-black-slight"></div>
              </div>              
            </div>
          </div>
          <!--/.Slides-->
          <!--Controls-->
          <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          <!--/.Controls-->
        </div>
        <!--/.Carousel Wrapper-->
        <section id="contact">
           <div class="container" style=" padding-top:4%; padding-bottom: 6%; margin-bottom: 0px;  margin-top: 3.5%; font-family: 'Palatino'">
               <h1 class="text-center text-uppercase ">Contact Us</h1><br />
               <h5 class="text-center w-75 m-auto text-muted font-italic" style="font-family: 'Palatino'">We'd love to hear from you. We are available 24/7.<p></p> Feel free to contact us.</h5><br />
               <div class="row">
                 <div class="col-sm-12 col-md-6 col-lg-3 my-5">
                   <div class="card border-0">
                      <div class="card-body text-center">
                        <i class="fa fa-phone fa-5x mb-3" aria-hidden="true"></i>
                        <h4 class="text-uppercase mb-5">call us</h4>
                        <p>9854522210, 9801235221</p>
                      </div>
                    </div>
                 </div>
                 <div class="col-sm-12 col-md-6 col-lg-3 my-5">
                   <div class="card border-0">
                      <div class="card-body text-center">
                        <i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
                        <h4 class="text-uppercase mb-5">Head Office</h4>
                       <address>New Baneshwar, Kathmandu </address>
                      </div>
                    </div>
                 </div>
                 <div class="col-sm-12 col-md-6 col-lg-3 my-5">
                   <div class="card border-0">
                      <div class="card-body text-center">
                        <i class="fa fa-map-marker fa-5x mb-3" aria-hidden="true"></i>
                        <h4 class="text-uppercase mb-5">Branch Office</h4>
                        <address>BP Koirala Road, Dharan </address>
                      </div>
                    </div>
                 </div>
                 <div class="col-sm-12 col-md-6 col-lg-3 my-5">
                   <div class="card border-0">
                      <div class="card-body text-center">
                        <i class="fa fa-globe fa-5x mb-3" aria-hidden="true"></i>
                        <h4 class="text-uppercase mb-5">email</h4>
                        <p>Everestlibrary1159@gmail.com</p>
                      </div>
                    </div>
                 </div>
               </div>
           </div>
    </section>
    <div class="bg-light py-5" id="OurTeam" style="font-family: 'Palatino'; margin-top: -5em;">
      <div class="container py-5">
        <div class="row mb-4">
          <div class="col-lg-5" style="margin-left: 28em;">
            <h1 class="display-4 font-weight-light" >Our Team</h1>
          </div>
        </div>

        <div class="row text-center">
          <!-- Team item-->
          <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834132/avatar-4_ozhrib.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
              <h5 class="mb-0">Manisha Rai</h5><span class="small text-uppercase text-muted">Chief Executive Officer</span>
            </div>
          </div>
          <!-- End-->

          <!-- Team item-->
          <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834130/avatar-3_hzlize.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
              <h5 class="mb-0">Rabin Darnal</h5><span class="small text-uppercase text-muted">Chief Operation Officer</span>         
            </div>
          </div>
          <!-- End-->

          <!-- Team item-->
          <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834133/avatar-2_f8dowd.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
              <h5 class="mb-0">Prakash Rai</h5><span class="small text-uppercase text-muted">Head IT Officer</span>
            </div>
          </div>
          <!-- End-->

          <!-- Team item-->
          <div class="col-xl-3 col-sm-6 mb-5">
            <div class="bg-white rounded shadow-sm py-5 px-4"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556834133/avatar-1_s02nlg.png" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
              <h5 class="mb-0">Nikhil Shrestha</h5><span class="small text-uppercase text-muted">Chief Technical Officer</span>
            </div>
          </div>
          <!-- End-->
        </div>
      </div>
    </div>
   </div>
</asp:Content>
