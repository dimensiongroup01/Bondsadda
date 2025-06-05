<%@ Page Title="" EnableEventValidation="false"  Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
/>
   <!-- Splide.js CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide/dist/css/splide.min.css">

<!-- Splide.js JS -->
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide/dist/js/splide.min.js"></script>

    <style>
        a#ContentPlaceHolder1_lnkSearch {
            padding: 10px !important;
            border: none;
            border: 1px solid black;
            border-radius: 0 20px 20px 0 !important;
            margin-left: -6px;
        }

        .button1 {
            text-align: center;
        }

        img.col-12.p-0.def {
            height: 200px;
        }

        span.abcd {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* number of lines to show */
            line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        span.kgs {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3; /* number of lines to show */
            line-clamp: 3;
            -webkit-box-orient: vertical;
        }

        span.abs {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1; /* number of lines to show */
            line-clamp: 1;
            -webkit-box-orient: vertical;
        }

        span.mmm {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1; /* number of lines to show */
            line-clamp: 1;
            -webkit-box-orient: vertical;
        }

        span.defg {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 4; /* number of lines to show */
            line-clamp: 4;
            -webkit-box-orient: vertical;
        }

        a.btn.btn1.ase {
            width: 185px;
        }
        ul#ui-id-2 {
    position: absolute;
    margin-top: 185px;
    margin-left: 395px;
    width: 653.375px;
    display: none;
}
        .custom-card {
      border-radius: 1rem;
      padding: 2rem;
      background: linear-gradient(135deg, #f8f9fa, #fff);
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
      text-align: center;
    }

    .custom-card i {
      font-size: 3rem;
      color: #ffc107;
    }

    .custom-card h4 {
      margin-top: 1rem;
      font-weight: 600;
    }

    .btn-golden {
      background-color: #ffc107;
      color: #000;
      font-weight: 600;
    }

    .btn-golden:hover {
      background-color: #e0a800;
      color: #fff;
    }
     .counter-card {
      background: lightblue;
      border-radius: 1rem;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
      padding: 2rem;
      text-align: center;
      transition: transform 0.3s ease;
    }

    .counter-card:hover {
      transform: translateY(-5px);
    }

    .counter-value {
      font-size: 3rem;
      font-weight: 700;
      color: #007bff;
    }

    .counter-label {
      font-size: 1.2rem;
      font-weight: 500;
      color: #333;
    }
    .btn-invest {
  background: linear-gradient(45deg, #FF0000, #FFD700);
  color: #fff;
  border: none;
  font-weight: bold;
  padding: 12px 30px;
  border-radius: 30px;
  transition: transform 0.2s;
}
.btn-invest:hover {
  transform: scale(1.05);
}
.bond-calculator {
  background: #fff;
  border-radius: 20px;
  padding: 30px;
  border: 2px solid #DAA520;
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.2);
}
.form-range {
  accent-color: #DAA520;
}
label {
  font-weight: bold;
  margin-top: 10px;
}
#result {
  font-size: 1.3rem;
  color: #B22222;
}
.input-group-text {
  background: #f7e6b5;
  border: 1px solid #DAA520;
}
h2.title {
  font-weight: 700;
  color: #003366;
  margin-bottom: 40px;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}



.carousel-container {
     .carousel-container {
    margin: 20% auto; /* Horizontally center */
    width: fit-content;
    max-width: 100%;
    height: 300px;
    perspective: 1000px;
    overflow: hidden;
    display: flex;
    justify-content: center; /* Center the inner track if needed */
  }

    .carousel-track {
      display: flex;
      transition: transform 1s ease-in-out;
      transform-style: preserve-3d;
    }

    .carousel-slide {
      min-width: 300px;
      height: 300px;
      margin: 0 20px;
      background-size: cover;
      background-position: center;
      border-radius: 20px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.6);
      transform: scale(0.66);
      transition: transform 0.8s ease, opacity 0.5s ease;
      display: flex;
      align-items: flex-end;
      justify-content: center;
      position: relative;
    }

    .carousel-slide.active {
      transform: scale(0.6) rotateY(0deg);
      z-index: 10;
    }

    .carousel-slide.prev,
    .carousel-slide.next {
      opacity: 1.2;
    }

    .cta-button {
      background-color: rgba(255, 255, 255, 0.9);
      color: #000;
      padding: 10px 20px;
      border-radius: 8px;
      margin: 20px;
      text-decoration: none;
      font-weight: bold;
      transition: background-color 0.3s;
    }

    .cta-button:hover {
      background-color: #ffc107;
    }

    @keyframes enterSlide {
      0% {
        transform: translateY(100px) rotate(-10deg);
        opacity: 0;
      }
      100% {
        transform: translateY(0) rotate(0);
        opacity: 1;
      }
    }

    </style>
    <script>
        const taglines = [
            "Regular Income",
            "8% to 12%+ Returns*",
            "Low Volatility",
            "Portfolio Diversification",
            "Peace of Mind"
        ];
        let taglineIndex = 0;
        setInterval(() => {
            taglineIndex = (taglineIndex + 1) % taglines.length;
            document.getElementById("taglineDisplay").textContent = taglines[taglineIndex];
        }, 2000);
    </script>

        <script>
            function animateValue(id, start, end, duration, suffix = "") {
                const range = end - start;
                let startTime = null;

                const step = (timestamp) => {
                    if (!startTime) startTime = timestamp;
                    const progress = Math.min((timestamp - startTime) / duration, 1);
                    const current = Math.floor(progress * range + start);
                    const element = document.getElementById(id);
                    if (element) {
                        element.innerText = current;
                    }
                    if (progress < 1) {
                        requestAnimationFrame(step);
                    } else {
                        // After animation, add suffix (like "+" or "Crore+")
                        element.innerText = end.toLocaleString() + suffix;
                    }
                };

                requestAnimationFrame(step);
            }

            document.addEventListener("DOMContentLoaded", function () {
                animateValue("client-count", 0, 100, 2000,);
                animateValue("transaction-count", 0, 200, 2500);
                animateValue("senior-bonds", 0, 3);
            });
        </script>
       <script>
           document.addEventListener('DOMContentLoaded', () => {
               const amountRange = document.getElementById("amountRange");
               const rateRange = document.getElementById("rateRange");
               const yearsRange = document.getElementById("yearsRange");

               const amountVal = document.getElementById("amountVal");
               const rateVal = document.getElementById("rateVal");
               const yearsVal = document.getElementById("yearsVal");

               // Sync input fields with range sliders
               amountRange.oninput = () => amountVal.value = amountRange.value;
               rateRange.oninput = () => rateVal.value = rateRange.value;
               yearsRange.oninput = () => yearsVal.value = yearsRange.value;

               amountVal.oninput = () => amountRange.value = amountVal.value;
               rateVal.oninput = () => rateRange.value = rateVal.value;
               yearsVal.oninput = () => yearsRange.value = yearsVal.value;

               // Calculate returns
               function calculateReturns() {
                   const amount = parseFloat(amountVal.value);
                   const rate = parseFloat(rateVal.value);
                   const years = parseFloat(yearsVal.value);
                   const finalAmount = amount * Math.pow((1 + rate / 100), years);
                   document.getElementById("result").textContent = `₹${finalAmount.toFixed(2)}`;
               }

               // Attach the calculateReturns function to the button
               document.getElementById("calculateBtn").onclick = calculateReturns;
           });

          
       </script>
   <script>
       document.addEventListener("DOMContentLoaded", () => {
           const track = document.getElementById('carouselTrack');
           const slides = Array.from(track.children);
           let current = 0;

           function updateSlides() {
               slides.forEach((slide, index) => {
                   slide.classList.remove('active', 'prev', 'next');
                   if (index === current) {
                       slide.classList.add('active');
                   } else if (index === (current + 1) % slides.length) {
                       slide.classList.add('next');
                   } else if (index === (current - 1 + slides.length) % slides.length) {
                       slide.classList.add('prev');
                   }
               });
           }

           function moveCarousel() {
               current = (current + 1) % slides.length;
               const slideWidth = slides[0].offsetWidth + 40; // slide width + 2x margin (20px each side)
               const offset = -(slideWidth * current);
               track.style.transform = `translateX(${offset}px)`;
               updateSlides();
           }

           updateSlides();
           setInterval(moveCarousel, 3000); // autoplay
       });




   </script>

     

  <!-- Initialize Swiper -->



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hfInputData" runat="server" />
    <section >
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center mx-auto search">
                    <div class="pt-md-5 px-4 row pt-4">
                        <asp:TextBox ID="txtResult" style="height:45px;" runat="server" class="col-md-10 col-10 p-0" type="search" name
                            placeholder="Search For Bonds" ClientIDMode="Static"></asp:TextBox>
                        <asp:LinkButton ID="lnkSerch" runat="server" type="submit" class="lnkSerch bg2 col-md-2 col-2" OnClick="lnkSerch_Click"><i
                                class="text-white fa-solid fa-magnifying-glass"></i></asp:LinkButton>

                    </div>
                </div>
            </div>
            <div class="container mt-4">
  <div class="row align-items-center">
    <!-- Left Section -->
    <div class="col-12 col-lg-8 mb-4 mb-lg-0">
      <h1 class="display-5 fw-bold text-primary">
        Invest smart, Earn big,<br />
        with <span class="gold">BONDSADDA</span>
      </h1>

      <!-- Animated Tagline -->
      <h5 class="rotating-tagline gold fw-semibold" id="taglineDisplay">Regular Income</h5>

      <!-- Counters -->
      <div class="row mt-3">
        <div class="col-6 col-md-4 mb-3">
          <div class="card-stats text-center">
            <div class="counter-card">
              <div id="client-count" class="counter-value">0</div>
              <div class="counter-label">+ Clients</div>
            </div>
          </div>
        </div>
        <div class="col-6 col-md-4 mb-3">
          <div class="card-stats text-center">
            <div class="counter-card">
              <div id="transaction-count" class="counter-value">0</div>
              <div class="counter-label">+ Cr Transactions</div>
            </div>
          </div>
        </div>
      </div>

      <!-- CTA Button -->
      <div class="mt-4 d-flex flex-column flex-sm-row align-items-start gap-3">
        <a href="https://bondsadda.com/OurCollections" class="btn btn-invest">Invest Now</a>
        <a href="https://youtu.be/u57IIt8mwKA" target="_blank" rel="noopener noreferrer" class="text-decoration-none d-flex align-items-center gap-2">
          <i class="fa fa-play-circle text-danger fs-5"></i>
          <span>What are Bonds & How do I Invest?</span>
        </a>
      </div>
    </div>

    <!-- Right Section -->
    <div class="col-12 col-lg-4">
      <div class="bond-calculator text-center p-3 border rounded shadow-sm">
        <h4 class="mb-3 gold">Bond Calculator</h4>
        <form>
          <!-- Amount -->
          <label for="amountRange" class="form-label small">Investment Amount (₹)</label>
          <div class="input-group mb-2">
            <input type="range" class="form-range" min="10000" max="1000000" step="10000" id="amountRange">
            <input type="number" class="form-control form-control-sm" id="amountVal" value="100000">
          </div>

          <!-- Rate -->
          <label for="rateRange" class="form-label small">Yield (%)</label>
          <div class="input-group mb-2">
            <input type="range" class="form-range" min="5" max="15" step="0.5" id="rateRange">
            <input type="number" class="form-control form-control-sm" id="rateVal" value="10">
          </div>

          <!-- Years -->
          <label for="yearsRange" class="form-label small">Maturity (Years)</label>
          <div class="input-group mb-3">
            <input type="range" class="form-range" min="1" max="10" id="yearsRange">
            <input type="number" class="form-control form-control-sm" id="yearsVal" value="5">
          </div>

          <!-- Button & Result -->
          <button type="button" class="btn btn-invest btn-sm w-100" id="calculateBtn">Calculate</button>
          <div class="mt-2 small">
            <strong>Estimated Returns:</strong> <span id="result"></span>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

    </section>
    <section>
        <!-- Modal -->
<div class="modal fade" id="promoModal" tabindex="-1" aria-labelledby="promoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0">
      <!-- Modal Header with Close Button -->
      <div class="modal-header border-0">
        <button type="button" class="btn-close ms-auto" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
        <div class="custom-card text-center">
          <i class="bi bi-graph-up-arrow"></i>
          <h4>High Yield Bonds</h4>
          <p>Discover high-return bond opportunities now.</p>
          <a href="https://bondsadda.com/OurCollections?oId=16" class="btn btn-golden mt-3">Explore Now</a>
        </div>
      </div>
    </div>
  </div>
</div>
</section>


   <section class="mt-5">
  <div class="container">
    <h3 class="text-center fw-bold display-6 border-bottom pb-2 mb-4" style="color: #001f3f;">
      🚀 High Return <span style="color: #ff851b;">BONDS</span>
    </h3>

    <div class="position-relative overflow-hidden">
      <!-- Carousel Track -->
      <div class="carousel-container">
        <div class="carousel-track d-flex" id="carouselTrack">
          <div class="carousel-slide" style="background-image: url('https://bondsadda.com/VImage/88108team_vedika_logo.jpeg');">
            <a class="cta-button" href="https://bondsadda.com/CashFlow?oId=4892" target="_blank">Buy Now</a>
          </div>
          <div class="carousel-slide" style="background-image: url('https://bondsadda.com/VImage/24414RDC%20CONCRETE(INDIA)%20LIMITED.jpeg');">
            <a class="cta-button" href="https://bondsadda.com/CashFlow?oId=4878" target="_blank">Buy Now</a>
          </div>
          <div class="carousel-slide" style="background-image: url('https://bondsadda.com/VImage/47714Keertana.png');">
            <a class="cta-button" href="https://bondsadda.com/CashFlow?oId=4862" target="_blank">Buy Now</a>
          </div>
          <div class="carousel-slide" style="background-image: url('https://bondsadda.com/VImage/95068indelmoney_logo.jpeg');">
            <a class="cta-button" href="https://bondsadda.com/CashFlow?oId=4849" target="_blank">Buy Now</a>
          </div>
          <div class="carousel-slide" style="background-image: url('https://bondsadda.com/VImage/73786EarlySalary.webp');">
            <a class="cta-button" href="https://bondsadda.com/CashFlow?oId=4855" target="_blank">Buy Now</a>
          </div>
        </div>
      </div>

 
    </div>
  </div>
</section>

    <section ">
        <asp:HiddenField ID="hfIPDateaaa" runat="server" />
        <asp:HiddenField ID="hfFrequencyType" runat="server" />
        <asp:HiddenField ID="hfQuar" runat="server" />
        <asp:HiddenField ID="hfLastIPDateXIRR" runat="server" />
        <asp:HiddenField ID="hfMonth" runat="server" />
        <asp:HiddenField ID="hfYearly" runat="server" />
        <asp:HiddenField ID="hfQuerterly" runat="server" />
        <asp:HiddenField ID="hfHalfYearly" runat="server" />
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h2 ></h2>
                </div>

                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.0.0-beta.2.4/assets/owl.carousel.min.css">
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>

                

                <asp:HiddenField ID="hfYieldValue" runat="server" />
                <asp:HiddenField ID="hfMaturityType" runat="server" />
                <div class="row" style="padding:5px;">
                    <asp:Repeater ID="rptData" runat="server" OnItemDataBound="rptData_ItemDataBound">
                        <ItemTemplate>
                            <div class="col-md-4 mb-md-4 mb-3">
                                <div class="box">

                                    <br />
                                    <div class="box0">
                                        <div class="row">
                                            <div class="col-7">
                                                <span class="kgs">
                                                    <h3
                                                        class="h6 font-weight-normal" style="text-transform:capitalize;" title=' <%#Eval("Security") %>'>
                                                        <%#Eval("Security") %>
                                                    </h3>
                                                    <asp:Label ID="hfPayment" runat="server" Visible="false" Value='<%#Eval("PaymentTypeHead") %>' />

                                                    <asp:Label ID="hfEOM" runat="server" Visible="false" Value='<%#Eval("EOM") %>' />
                                                    <asp:HiddenField ID="lblIP" runat="server" Value='<%#Eval("IPDate") %>' />
                                                </span>

                                            </div>
                                            <asp:HiddenField ID="hfProductName" runat="server" Value='<%#Eval("ProductName") %>' />
                                            <asp:HiddenField ID="hfCategory" runat="server" Value='<%#Eval("CategoryId") %>' />
                                            <asp:HiddenField ID="hfProductId" runat="server" Value='<%#Eval("ProductsId") %>' />
                                            <asp:HiddenField ID="hfPrice" runat="server" Value='<%#Eval("Price") %>' />
                                            <div class="col-5 ">
                                                <asp:Repeater ID="rptproductimg" runat="server">
                                                    <ItemTemplate>
                                                        <img src='<%#Eval("HProductImagePath").ToString().Replace("~/","") %>' class="border col-12 p-0" height="60" alt="" />
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="box1">
                                        <div class="row">
                                            <div class="col-7">

                                                <small>Face Value</small>
                                                <p
                                                    class="h6 font_2 ">
                                                    ₹<%#Eval("FacevalueForBond") %>
                                                </p>



                                            </div>
                                            <div class="col-5 text-right">
                                                <asp:HiddenField ID="hfProducts" runat="server" Value='<%#Eval("ProductsId") %>' />
                                                <div class="rating-icon">
                                                    <asp:Repeater ID="rptCredit" runat="server">
                                                        <ItemTemplate>
                                                            <%#Eval("CreditRating") %>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <%--                                        <img src="img/rate/AA.png"
                                            class="border  col-4 ml-auto p-0"
                                            alt>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-7">
                                                <small>Coupon</small>
                                                <p
                                                    class="h6 font_2">
                                                    <asp:Label ID="lblCouponrate" runat="server" Text='<%#Eval("CouponRate") %>'></asp:Label>%
                                                   
                                                </p>
                                            </div>
                                            <div class="col-5 text-right">
                                                <asp:Panel ID="pnlYield" runat="server">
                                                    <small>Yield</small>
                                                    <p
                                                        class="h6 font_2">
                                                        <asp:Label ID="lblYTM" runat="server"></asp:Label>%
                                                       <%-- <%#Eval("YTM") %>--%>
                                                    </p>
                                                </asp:Panel>
                                                <asp:Panel ID="pnlYieldView" runat="server">
                                                    <small>Yield</small>
                                                    <p
                                                        class="h6 font_2">
                                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click">Login to view</asp:LinkButton>
                                                    </p>
                                                </asp:Panel>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-7">
                                                <small>Last Interest Payment Date</small>
                                                <p
                                                    class="h6 font_2">
                                                    <span class="abs">

                                                        <asp:Label ID="txtLastIP" runat="server"></asp:Label>
                                                    </span>

                                                </p>
                                            </div>
                                            <div class="col-5 text-right">
                                                <small>Maturity Date</small>
                                                <p
                                                    class="h6 font_2">
                                                    <asp:Label ID="lblMaturityDate" runat="server" Text='<%#Eval("MaturityDate") %>'></asp:Label>
                                                  
                                                </p>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <small>Type of Bond</small>
                                                <p
                                                    class="h6 font_2">
                                                    <span class="mmm" title='<%#Eval("CategoryHead") %>'>
                                                        <%#Eval("CategoryHead") %>
                                                    </span>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <small>Redemption Type</small>
                                                <p
                                                    class="h6 font_2">
                                                    <asp:Label ID="lblm" runat="server" Visible="false" Value='<%#Eval("MaturityType") %>'></asp:Label>
                                                    <asp:Label ID="lblredemption" runat="server"></asp:Label>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="button">
                                            <asp:LinkButton ID="lnkdetails" runat="server" CssClass="font_2 text-white" CommandArgument='<%#Eval("ProductsId") %>' OnClick="lnkdetails_Click">View Details</asp:LinkButton>
                                           <%-- <a href="<%=ResolveUrl("~")%>CashFlow?oId=<%#Eval("ProductsId") %>"
                                                class="font_2 text-white">View
                                        Details</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>

            </div>
            <%--<div class="row">
                <div class="col-md-5"></div>
                <div class="col-md-4">

                    <div class="button asd">
                        <a href="<%=ResolveUrl("~")%>OurCollections"
                            class="btn btn1 ase">View
                                        More</a>

                    </div>
                </div>
            </div>--%>
            <%-- <script>
                left = '<svg width="50" height="50" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16 20L15.6464 19.6464L15.2929 20L15.6464 20.3536L16 20ZM21.6464 13.6464L15.6464 19.6464L16.3536 20.3536L22.3536 14.3536L21.6464 13.6464ZM15.6464 20.3536L21.6464 26.3536L22.3536 25.6464L16.3536 19.6464L15.6464 20.3536Z" fill="white"/><circle cx="20" cy="20" r="19.5" stroke="white"/></svg>';
                right = '<svg width="50" height="50" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M24 20L24.3536 20.3536L24.7071 20L24.3536 19.6464L24 20ZM18.3536 26.3536L24.3536 20.3536L23.6464 19.6464L17.6464 25.6464L18.3536 26.3536ZM24.3536 19.6464L18.3536 13.6464L17.6464 14.3536L23.6464 20.3536L24.3536 19.6464Z" fill="white"/><circle cx="20" cy="20" r="19.5" transform="rotate(180 20 20)" stroke="white"/></svg>';
                $('#owl-carousel1').owlCarousel({
                    loop: false,
                    margin: 0,
                    dots: true,
                    navText: [left, right],
                    items: 3,
                    responsive: {
                        0: {
                            items: 1
                        },
                        768: {
                            items: 2
                        },
                        1080: {
                            items: 3
                        }
                    }
                })
            </script>--%>
        </div>
    </section>
    <section class=" pt-md-5 pt-4 collection">
        <div class="container">
            <div class="row py-md-5 ">
                <div class="col-12">
                    <h2 class="h3 text-center font-weight-normal color1">Our
                        <span class="color2">Collections</span></h2>

                </div>
            </div>
            <style>
                .home-page-investment-option .box {
                    min-height: 260px;
                    margin-bottom: 30px;
                    position: relative;
                    border-bottom: 4px solid #ad5a3b;
                    background: rgb(246, 246, 246);
                    /* line-height: 200px; */
                }

                    .home-page-investment-option .box a {
                        position: absolute;
                        bottom: 30px;
                        left: 50%;
                        transform: translateX(-50%);
                        /* background: #ad5a3b ; */
                        /* border:2px solid #ad5a3b; */
                        padding: 7px 18px;
                        border-radius: 30px;
                        color: black;
                        text-decoration: none;
                    }

                    .home-page-investment-option .box i {
                        background: white;
                        color: #ad5a3b;
                        margin-bottom: 10px;
                        height: 70px;
                        font-size: 30px;
                        width: 70px;
                        line-height: 70px;
                        border-radius: 50px;
                    }

                    .home-page-investment-option .box a:hover {
                        background: #262626;
                        color: white;
                    }
            </style>
            <div class="section home-page-investment-option">
                <div class="container">
                    <div class="row">

                        <%--<asp:Repeater ID ="rptCollection" runat="server">
                    <ItemTemplate>
                                                        <div class="col-lg-3 col-md-6 col-12">
                    <div class="p-4 py-5 box text-center ">
                                             <%#Eval("CategoryFontIcon") %>
                        <h2 class="font-weight-normal h6"><%#Eval("CategoryHead") %> </h2>
                        <a href="#">Explore</a>
                        </div>
                                                            </div>
                    </ItemTemplate>
                </asp:Repeater>--%>
                         <div class="col-lg-3 col-md-6 col-12">
                         <div class=" p-4 py-5 box text-center ">
                             <i class="fa-solid fa-arrow-up-right-dots"></i>

                             <h2 class="font-weight-normal h6">High return bonds</h2>
                                                             <asp:LinkButton ID="lnkhigh" runat="server" OnClick="lnkhigh_Click">Explore</asp:LinkButton>
                           <%--  <a href="<%=ResolveUrl("~")%>OurCollections?oId=16">Explore</a>--%>
                         </div>
                     </div>
                       
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class="p-4 py-5 box text-center ">
                                <i class="fa-solid fa-calendar-days"></i>
                                <h2 class="font-weight-normal h6">Monthly Income
                                    <br>
                                    Bonds </h2>
                                <asp:LinkButton ID="lnkmonth" runat="server" OnClick="lnkmonth_Click">Explore</asp:LinkButton>
                             <%--   <a href="<%=ResolveUrl("~")%>OurCollections?oId=13">Explore</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class=" p-4 py-md-5 box text-center ">
                                <i class="fa-solid fa-lock"></i>
                                <h2 class="font-weight-normal h6">Bank bonds: PSU Bonds & PVT Bonds</h2>
                                <asp:LinkButton ID="lnkpsu" runat="server" OnClick="lnkpsu_Click">Explore</asp:LinkButton>
                          <%--      <a href="<%=ResolveUrl("~")%>OurCollections?oId=14">Explore</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class=" p-4 py-5 box text-center ">
                                <i class="fa-solid fa-people-group"></i>
                                <h2 class="font-weight-normal h6">Public Sector Bonds</h2>
                                                                <asp:LinkButton ID="lnkpublic" runat="server" OnClick="lnkpublic_Click">Explore</asp:LinkButton>
                             <%--   <a href="<%=ResolveUrl("~")%>OurCollections?oId=26">Explore</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class=" p-4 py-5 box text-center ">
                                <i class="fa-solid fa-crown"></i>
                                <h2 class="font-weight-normal h6">Sovereign Rated bonds / Govt. Securities</h2>
                                                                <asp:LinkButton ID="lnksaver" runat="server" OnClick="lnksaver_Click">Explore</asp:LinkButton>
                             <%--   <a href="<%=ResolveUrl("~")%>OurCollections?oId=28">Explore</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class=" p-4 py-5 box text-center ">
                                <i class="fa-solid fa-seedling"></i>
                                <h2 class="font-weight-normal h6">Tax free bonds</h2>
                                                                <asp:LinkButton ID="lnktax" runat="server" OnClick="lnktax_Click">Explore</asp:LinkButton>
                         <%--       <a href="<%=ResolveUrl("~")%>OurCollections?oId=17">Explore</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class=" p-4 py-5 box text-center ">
                                <i class="fa-solid fa-money-bill-1-wave"></i>
                                <h2 class="font-weight-normal h6">Capital gain bonds (54EC)</h2>
                                                                <asp:LinkButton ID="lnkcapital" runat="server" OnClick="lnkcapital_Click">Explore</asp:LinkButton>
                            <%--    <a href="<%=ResolveUrl("~")%>OurCollections?oId=27">Explore</a>--%>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-12">
                            <div class=" p-4 py-5 box text-center ">
                                <i class="fa-solid fa-timeline"></i>
                                <h2 class="font-weight-normal h6">Fixed Deposite</h2>
                                <a href="#">Explore</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="video-home py-md-5 py-4 collection">
        <div class="container">
            <div class="row py-md-5 ">
                <div class="col-lg-7 py-md-4 py-5">
                    <div id="tab-1" class="tab-content active">
                        <%-- <img src="img/tutorial1.png" class="col-12" alt srcset>--%><img src="img/Group%201000002009%20(3).png" class="col-12" alt srcset />
                    </div>
                    <div id="tab-2" class="tab-content">
                        <%-- <img src="img/tutorial1.png" class="col-12" alt srcset>--%><img src="img/Group%201000002009%20(2).png" class="col-12" alt srcset />
                    </div>

                    <div id="tab-3" class="tab-content">
                        <%-- <img src="img/tutorial1.png" class="col-12" alt srcset>--%><img src="img/Group%201000002009%20(1).png" class="col-12" alt srcset />
                    </div>


                </div>
                <div class="col-lg-1"></div>
                <div class="col-lg-4">
                    <div class="tab-wrapper mb-5 ">
                        <div class="tabs row">
                            <div class="col-lg-12 col-md-4 col-4 tutorial-option tab-link active" data-tab="1">
                                <span href="#">
                                    <h3 class="font-weight-normal">Complete KYC</h3>
                                    <p>
                                        <ul class="d-lg-block d-md-none d-none">
                                            <li>Fill Your Identification Details</li>
                                            <li>Fill Your Bank Details</li>
                                            <li>Wait for the Verification</li>

                                        </ul>
                                    </p>
                                </span>
                            </div>
                            <div class="col-lg-12 col-md-4 col-4 tutorial-option tab-link" data-tab="2">
                                <span href="#">
                                    <h3 class="font-weight-normal">Choose Bond</h3>
                                    <p class="d-lg-block d-md-none d-none">
                                        Select bonds that match your investment goal. 
                                    </p>
                                </span>
                            </div>
                            <div class="col-lg-12 col-md-4 col-4 tutorial-option tab-link" data-tab="3">
                                <span href="#">
                                    <h3 class="font-weight-normal">Make Investment</h3>
                                    <p class="d-lg-block d-md-none d-none">Discuss with assigned RM and Make Investment.</p>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class=" py-md-5 py-4">
        <div class="container-fluid">
            <div class="row py-md-5 ">
                <div class="col-12">
                    <h2 class="h3 text-center font-weight-normal color1">Awards and
                        <span class="color2">Accolades</span></h2>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <img src="img/award.png" class="col-12" alt="" srcset="">
                </div>
            </div>
        </div>
    </section>
    <section class=" py-md-5 py-4 testimonial">

        <div class="container">
            <div class="row pt-md-5 ">
                <div class="col-12">
                    <h2 class="h3 text-center font-weight-normal color1">Testimonial</h2>
                </div>
            </div>
            <div class="row">

                <div class="col-md-9 mx-auto">
                    <div id="owl-carousel2" class="owl-carousel owl-theme contain">
                        <div class="box">
                            <%--                            <img src="img/testimonial/testimonial-face.jpg"  alt="">--%>
                            <img src="Signup/img/unnamed.png" alt="" />
                            <div class="testbox">
                                <div class="text-box ml-md-5 pl-md-5">
                                    <p class="">They will help you to gain more by Investments, best financial advisor in Delhi/NCR.</p>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <h6 class="font-weight-normal text-white">Shashank Jain<br>
                                    </h6>
                                </div>

                            </div>


                        </div>

                        <div class="box">
                            <%-- <img src="img/testimonial/testimonial-face.jpg">--%>
                            <img src="Signup/img/unnamed%20(1).png" alt="" />
                            <div class="testbox">
                                <div class="text-box ml-md-5 pl-md-5">
                                    <p class="">They will help you to gain more by Investments, best financial advisor in Delhi/NCR.</p>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                    <h6 class="font-weight-normal text-white">Sudhir Kumar<br>
                                    </h6>
                                </div>

                            </div>


                        </div>

                        <div class="box">
                            <%-- <img src="img/testimonial/testimonial-face.jpg"  >--%><img src="Signup/img/unnamed%20(2).png" alt="" />
                            <div class="testbox">
                                <div class="text-box ml-md-5 pl-md-5">
                                    <p class="">They will help you to gain more by Investments, best financial advisor in Delhi/NCR.</p>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <h6 class="font-weight-normal text-white">Jyotsana Manral<br>
                                    </h6>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </div>


        </div>


        <script>
            left = '<svg width="50" height="50" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16 20L15.6464 19.6464L15.2929 20L15.6464 20.3536L16 20ZM21.6464 13.6464L15.6464 19.6464L16.3536 20.3536L22.3536 14.3536L21.6464 13.6464ZM15.6464 20.3536L21.6464 26.3536L22.3536 25.6464L16.3536 19.6464L15.6464 20.3536Z" fill="white"/><circle cx="20" cy="20" r="19.5" stroke="white"/></svg>';
            right = '<svg width="50" height="50" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M24 20L24.3536 20.3536L24.7071 20L24.3536 19.6464L24 20ZM18.3536 26.3536L24.3536 20.3536L23.6464 19.6464L17.6464 25.6464L18.3536 26.3536ZM24.3536 19.6464L18.3536 13.6464L17.6464 14.3536L23.6464 20.3536L24.3536 19.6464Z" fill="white"/><circle cx="20" cy="20" r="19.5" transform="rotate(180 20 20)" stroke="white"/></svg>';
            $('#owl-carousel2').owlCarousel({
                loop: true,
                margin: 0,
                dots: false,
                navText: [left, right],
                items: 3,
                responsive: {
                    0: {
                        items: 1
                    },
                    768: {
                        items: 1
                    },
                    1080: {
                        items: 1
                    }
                }
            })
        </script>
    </section>
    <section class="home-blog py-md-5 py-4">
        <div class="container">
            <div class="row py-md-5 ">
                <div class="col-12">
                    <h2 class="h3 text-center font-weight-normal color1">Latest 
                        <span class="color2">News</span></h2>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="rptNews" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 py-2">
                            <div class="box">

                                <img src='<%#Eval("BlogImage").ToString().Replace("~/","") %>' class="col-12 p-0 def" alt="" />

                                <div class="details p-3 ">
                                    <small class="text-danger font_2"><strong>Date:</strong> <%--20 June  2022--%><%#Eval("BlogDate") %> | <strong>Author:</strong> <%--Admin | Investment--%><%#Eval("AuthorBy") %> </small>
                                    <span class="abcd">
                                        <h4 class="h5 font_2 font-weight-normal"><%--Sovereign Gold Bond Scheme 2023-24--%><%#Eval("BlogTitle") %>:  <%--An Attractive Investment Opportunity--%> <%#Eval("BlogSubTitle") %></h4>
                                    </span>
                                    <span class="defg">
                                        <p><small><%--Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?--%> <%#Eval("MetaDescription") %></small></p>
                                    </span>
                                    <a href="<%=ResolveUrl("~")%>BlogNewsDetails?oId=<%#Eval("BlogId") %>" class="color1 font_1">Read More</a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <%--<div class="col-md-4 py-2">
                    <div class="box">
                        <img src="img/blog/blog1.png" class="col-12 p-0" alt="">
                        <div class="details p-3 ">
                            <small class="text-danger font_2"><strong> Date:</strong> 20 June  2022 | <strong> Author:</strong> Admin | Investment </small>
                            <h4 class="h5 font_2 font-weight-normal">Sovereign Gold Bond Scheme 2023-24:  An Attractive Investment Opportunity</h4>
                            <p><small>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?</small></p>
                            <a href="#" class="color1 font_1">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 py-2">
                    <div class="box">
                        <img src="img/blog/blog1.png" class="col-12 p-0" alt="">
                        <div class="details p-3 ">
                            <small class="text-danger font_2"><strong> Date:</strong> 20 June  2022 | <strong> Author:</strong> Admin | Investment </small>
                            <h4 class="h5 font_2 font-weight-normal">Sovereign Gold Bond Scheme 2023-24:  An Attractive Investment Opportunity</h4>
                            <p><small>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?</small></p>
                            <a href="#" class="color1 font_1">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 py-2">
                    <div class="box">
                        <img src="img/blog/blog1.png" class="col-12 p-0" alt="">
                        <div class="details p-3 ">
                            <small class="text-danger font_2"><strong> Date:</strong> 20 June  2022 | <strong> Author:</strong> Admin | Investment </small>
                            <h4 class="h5 font_2 font-weight-normal">Sovereign Gold Bond Scheme 2023-24:  An Attractive Investment Opportunity</h4>
                            <p><small>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?</small></p>
                            <a href="#" class="color1 font_1">Read More</a>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </section>
    <section class="subscribe pb-md-5 pb-3">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="box2 ">
                        <div class="row">
                            <div
                                class="col-md-7 p-md-5 p-5 text-md-left text-center d-flex justify-content-center align-items-center">
                                <div
                                    class="">
                                    <h2 class="font-weight-normal color1 h3">Subscribe
                                        to
                                        our <span class="color2">Newsletter</span></h2>
                                    <p>
                                        DON’T FALL BEHIND<br />
                                        Stay current with a recap of today’s computing news from digital trend by bonds adda.
                                    </p>
                                    <asp:UpdatePanel ID="uPanel" runat="server">
                                        <ContentTemplate>
                                            <div class="form-inline row">
                                                <div
                                                    class="form-group col-md-8 mb-2 pr-md-0">
                                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control col-12" placeholder="Enter your Email Address"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 mb-2 pl-md-0">
                                                    <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe Now" class="btn btn-dark col-12 " OnClick="btnSubscribe_Click" />
                                                </div>

                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>

                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-3 ">
                                <img class="d-lg-block d-md-block d-none" src="img/news.svg" alt="">
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

            <!-- js for nav -->

<%--                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">Large modal</button>--%>
 <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
          <div class="col-md-12" style="text-align:center;">
             <h5 class="modal-title" id="exampleModalLongTitle">           
                            <strong>Enquiry Form</strong>
             </h5>
          </div>

        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
                               <asp:UpdatePanel ID="upnl" runat="server">
                <ContentTemplate>
      <div class="modal-body">
          <div class="contact-banner">
                                      <div class="box2 p-lg-5 py-4 font_2">
          <div class="row">
              <div class="col-md-6">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">First Name</label>
            <asp:TextBox ID="txtFirstName" runat="server" type="text" class="form-control" placeholder="Enter First Name"></asp:TextBox>
          </div>
                  </div>
                            <div class="col-md-6">
                        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Last Name</label>
            <asp:TextBox ID="txtLastName" runat="server" type="text" class="form-control" placeholder="Enter Last Name"></asp:TextBox>
          </div>
                                </div>
                            <div class="col-md-6">
                        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Mobile</label>
            <asp:TextBox ID="txtMobile" runat="server" type="number" class="form-control" placeholder="Enter Mobile"></asp:TextBox>
          </div>
                                </div>
                            <div class="col-md-6">
                        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Email</label>
            <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox>
          </div>
                                </div>
                            <div class="col-md-12">
                        <div class="form-group">
            <label for="recipient-name" class="col-form-label">Message</label>
            <asp:textBox ID="txtMessage" runat="server" class="form-control" TextMode="MultiLine" Rows="3" placeholder="Enter Messege Here"></asp:textBox>
          </div>
          </div>
              
			<div class="col-md-6">
                  <div class="form-group">
                        <asp:TextBox ID="txtCapchaCode" runat="server" CssClass="form-control"  placeholder="Enter Security Code Here" title="Enter Security Code Here" />
                    </div>
				</div>
			<div class="col-md-5">
                <div class="form-group">
                      <asp:TextBox ID="lblCaptcha" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                    			<div class="col-md-1">
                <div class="form-group">
                           <asp:LinkButton ID="lnkRefresh" runat="server" ToolTip="Load New" OnClick="lnkRefresh_Click"><i class="fa fa-refresh" style="font-size:42px;"></i></asp:LinkButton>                                        
                                    </div>
                                    </div>

              <div class="col-md-12 text-center">
                  <div class="form-group">
                      <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn1" OnClick="lnkSubmit_Click">Submit</asp:LinkButton>
                  </div>
              </div>
        </div>
          </div>
          </div>
          </div>
                                    </ContentTemplate>
            </asp:UpdatePanel>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

<%--            <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />--%>
   <%-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> --%> 
type="text/javascript">



    //********* Get Products ***************************
   
<%--    $(function () {
        $("[id$=txtResult]").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("TMWebService.asmx/GetProducts") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('$')[0]
                                /*  , value: item.split('$')[1]*/

                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            minLength: 1
        });
    });--%>





    // It is important to place this JavaScript code after ScriptManager1
    var xPos, yPos;
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    function BeginRequestHandler(sender, args) {
        if ($get('.table-responsive') != null) {
            // Get X and Y positions of scrollbar before the partial postback
            xPos = $get('.myDiv').scrollLeft;
            yPos = $get('.myDiv').scrollTop;
        }
    }

    function EndRequestHandler(sender, args) {
        if ($get('.table-responsive') != null) {
            // Set X and Y positions back to the scrollbar
            // after partial postback
            $get('.myDiv').scrollLeft = xPos;
            $get('.myDiv').scrollTop = yPos;
        }
    }

    prm.add_beginRequest(BeginRequestHandler);
    prm.add_endRequest(EndRequestHandler);
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    window.onload = function () {
        const promoModal = new bootstrap.Modal(document.getElementById('promoModal'));
        promoModal.show();
    };
</script>
   <%-- <script>
        var myModal = new bootstrap.Modal(document.getElementById('exampleModalLong'), {})
        myModal.show()

    </script>--%>

     </asp:Content>