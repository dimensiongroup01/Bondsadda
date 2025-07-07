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

     <!-- CSS Links -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <!-- Optional custom CSS -->
    <style>
        .bg-orange {
            background-color: #FF6B00;
        }
              .bg {
    font-family: 'Poppins', sans-serif;
  linear-gradient(
    to right,
    rgba(15, 32, 39, 0.15),
    rgba(32, 58, 67, 0.15),
    rgba(44, 83, 100, 0.15)
  ),
  #ffffff; /* solid white background */
    

           .fade-in {
    opacity: 0;
    transform: translateY(20px);
    animation: fadeInUp 0.8s ease forwards;
  }

  .fade-delay-1 { animation-delay: 0.1s; }
  .fade-delay-2 { animation-delay: 0.2s; }
  .fade-delay-3 { animation-delay: 0.3s; }
  .fade-delay-4 { animation-delay: 0.4s; }
  .fade-delay-5 { animation-delay: 0.5s; }
  .fade-delay-6 { animation-delay: 0.6s; }

  @keyframes fadeInUp {
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

 @keyframes bounce {
  0%, 20%, 50%, 80%, 100% {
    transform: translateY(0);
  }

  40% {
    transform: translateY(-20px);
  }

  60% {
    transform: translateY(-10px);
  }
}

.bounce-animation {
  animation: bounce 1.5s ease infinite;
}
.bounce-animation {
  animation: bounce 1.5s ease 1;
}
  
    </style>

       

        
    
    



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hfInputData" runat="server" />
<!-- Hero + Search + Carousel Section -->
<section style="background: linear-gradient(to bottom, #e0e0e0 0%, #ffffff 100%); padding: 60px 0; font-family: 'Segoe UI', sans-serif;">
  <div class="container">

    <!-- Search Bar -->
    <div class="row justify-content-center mb-5">
      <div class="col-md-10 col-lg-8">
        <div class="bg-white rounded-5 shadow-sm px-3 py-2 d-flex align-items-center justify-content-between" style="border: 1px solid #dee2e6;">
          <asp:TextBox ID="txtResult" runat="server" ClientIDMode="Static"
            placeholder="Search for Bonds..."
            class="form-control border-0"
            style="border-radius: 50px; height: 50px; font-size: 17px; background-color: #f9fafb; padding-left: 20px;">
          </asp:TextBox>
          <asp:LinkButton ID="lnkSerch" runat="server" OnClick="lnkSerch_Click"
            class="btn"
            style="background: linear-gradient(135deg, #007bff, #0056d2); color: white; border-radius: 30px; padding: 10px 20px; font-size: 16px;">
            <i class="fa-solid fa-magnifying-glass"></i>
          </asp:LinkButton>
        </div>
      </div>
    </div>

    <!-- Carousel -->
    <div id="bondsaddaCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="6000">
      <div class="carousel-inner">

        <!-- Slide 1 -->
        <div class="carousel-item active">
          <div class="row align-items-center g-5 min-vh-50">
            <div class="col-lg-6 text-lg-start text-center">
              <span class="badge-gradient-text">BondsAdda</span>
              <h1 class="fw-bold display-5 text-dark">Maximize Your Savings with Bonds</h1>
              <p class="lead text-muted mt-3 mb-4">
                India's trusted platform to invest in Bonds with up to <span class="text-warning fw-bold">14%</span> returns.
                100% digital. 100% secure.
              </p>
              <a href="OurCollections.aspx" class="btn btn-lg px-4 text-white fw-semibold bg-orange">
                <i class="fa-solid fa-arrow-up-right-from-square me-2"></i> Start Investing
              </a>
            </div>
            <div class="col-lg-6 chart-bg">
              <div class="bg-light rounded-4 p-4 shadow-sm text-center position-relative">
                <h4 class="fw-bold text-dark mb-3">Return Comparison</h4>
                <canvas id="bondChart" height="150"></canvas>
              </div>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item">
          <div class="row align-items-center g-5 min-vh-50">
            <div class="col-lg-6 text-lg-start text-center">
              <span class="badge-gradient-text">BondsAdda</span>
              <h1 class="fw-bold display-5 text-dark">Smart Banking with Fixed Deposits</h1>
              <p class="lead text-muted mt-3 mb-4">
                Invest in high-yield FDs from top banks with up to <span class="text-warning fw-bold">12%</span> interest.
                Fast, safe, and flexible.
              </p>
              <a href="OurCollections.aspx" class="btn btn-lg px-4 text-white fw-semibold bg-orange">
                <i class="fa-solid fa-arrow-up-right-from-square me-2"></i> Compare FDs
              </a>
            </div>
            <div class="col-lg-6 chart-bg">
              <div class="bg-light rounded-4 p-4 shadow-sm text-center position-relative">
                <h4 class="fw-bold text-dark mb-3">Return Comparison</h4>
                <canvas id="fdChart" height="150"></canvas>
              </div>
            </div>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item">
          <div class="row align-items-center g-5 min-vh-50">
            <div class="col-lg-6 text-lg-start text-center">
              <span class="badge-gradient-text">BondsAdda</span>
              <h1 class="fw-bold display-5 text-dark">Explore NCD IPOs</h1>
              <p class="lead text-muted mt-3 mb-4">
                Discover top-rated IPOs with expert insights. Get in early and grow your portfolio smartly.
              </p>
              <a href="IPOs.aspx" class="btn btn-lg px-4 text-white fw-semibold bg-orange">
                <i class="fa-solid fa-eye me-2"></i> View IPOs
              </a>
            </div>
            <div class="col-lg-6 chart-bg">
              <div class="bg-light rounded-4 p-4 shadow-sm text-center position-relative">
                <h4 class="fw-bold text-dark mb-3">Return Comparison</h4>
                <canvas id="ipoChart" height="150"></canvas>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>

  </div>
</section>

<!-- Custom Styles -->
<style>
.badge-gradient-text {
  display: inline-block;
  padding: 0.5rem 1.25rem;
  background-color: #fff;
  font-weight: 600;
  border-radius: 50rem;
  font-size: 0.95rem;
  border: 2px solid #cc6600;
  background-clip: text;
  -webkit-background-clip: text;
  color: transparent;
  background-image: linear-gradient(to right, #003366, #cc6600);
  transition: all 0.3s ease;
}
.badge-gradient-text:hover {
  background-image: linear-gradient(to right, #cc6600, #003366);
}

.min-vh-50 {
  min-height: 50vh;
}

.bg-orange {
  background: linear-gradient(135deg, #ff7700, #cc6600) !important;
  border: none;
}

/* Right Column Background Image */
.chart-bg {
  background: url('https://raw.githubusercontent.com/codewithsadee/desinic/master/assets/images/hero-banner.png') no-repeat center right;
  background-size: contain;
  position: relative;
}
.chart-bg {
  position: relative;
  overflow: hidden;
}

.chart-bg::before {
  content: "";
  background: url('https://raw.githubusercontent.com/codewithsadee/desinic/master/assets/images/hero-banner.png') no-repeat center right;
  background-size: contain;
  opacity: 0.15; /* control visibility */
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1;
}

.chart-bg .bg-light {
  position: relative;
  z-index: 2;
}

</style>

 <!-- Hero -->
<!-- Slider Section -->
 
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

<!-- Required CSS/JS Libraries -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
<link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet" />
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>

<section class="collection-section py-5 bg-light position-relative overflow-hidden">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="fw-bold display-6 heading-glow" data-aos="fade-up">
        Our <span class="text-gradient">Products</span>
      </h2>
    </div>

    <div class="row g-4 justify-content-center">
      <!-- Reusable Cards -->
      <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
        <div class="wow-card" data-tilt>
          <div class="icon-glow"><i class="fa-solid fa-arrow-up-right-dots"></i></div>
          <h5>High Return Bonds</h5>
          <asp:LinkButton ID="lnkhigh" runat="server" CssClass="btn btn-glow" OnClick="lnkhigh_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="200">
        <div class="wow-card" data-tilt>
          <div class="icon-glow"><i class="fa-solid fa-calendar-days"></i></div>
          <h5>Monthly Income Bonds</h5>
          <asp:LinkButton ID="lnkmonth" runat="server" CssClass="btn btn-glow" OnClick="lnkmonth_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="300">
        <div class="wow-card" data-tilt>
          <div class="icon-glow"><i class="fa-solid fa-lock"></i></div>
          <h5>Bank/PSU/PVT Bonds</h5>
          <asp:LinkButton ID="lnkpsu" runat="server" CssClass="btn btn-glow" OnClick="lnkpsu_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="400">
        <div class="wow-card" data-tilt>
          <div class="icon-glow"><i class="fa-solid fa-people-group"></i></div>
          <h5>Public Sector Bonds</h5>
          <asp:LinkButton ID="lnkpublic" runat="server" CssClass="btn btn-glow" OnClick="lnkpublic_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <div class="col-lg-3 col-md-6">
        <div class="wow-card" data-tilt>
          <div class="icon-glow"><i class="fa-solid fa-crown"></i></div>
          <h5>Sovereign Rated Bonds</h5>
          <asp:LinkButton ID="lnksaver" runat="server" CssClass="btn btn-glow" OnClick="lnksaver_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <div class="col-lg-3 col-md-6">
        <div class="wow-card" data-tilt>
          <div class="icon-glow"><i class="fa-solid fa-seedling"></i></div>
          <h5>Tax Free Bonds</h5>
          <asp:LinkButton ID="lnktax" runat="server" CssClass="btn btn-glow" OnClick="lnktax_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <div class="col-lg-3 col-md-6">
        <div class="wow-card" data-tilt>
          <div class="icon-glow"><i class="fa-solid fa-money-bill-1-wave"></i></div>
          <h5>Capital Gain Bonds (54EC)</h5>
          <asp:LinkButton ID="lnkcapital" runat="server" CssClass="btn btn-glow" OnClick="lnkcapital_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <div class="col-lg-3 col-md-6">
        <div class="wow-card" data-tilt>
          <div class="icon-glow"><i class="fa-solid fa-timeline"></i></div>
          <h5>Fixed Deposit</h5>
          <asp:HyperLink ID="lnkFD" runat="server" NavigateUrl="https://www.dimensiongroup.co.in/fixed-deposit.html" Target="_blank" CssClass="btn btn-glow">Explore</asp:HyperLink>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Custom CSS -->
<style>
.heading-glow {
  font-size: 2.5rem;
  color: #00558C;
}

.text-gradient {
  background: linear-gradient(90deg, #00558C, #F15A29);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: gradientMove 4s infinite linear;
}

@keyframes gradientMove {
  0% { background-position: 0% 50%; }
  100% { background-position: 200% 50%; }
}

.wow-card {
  background: #fff;
  border-radius: 1.5rem;
  padding: 2rem 1.5rem;
  text-align: center;
  transition: all 0.4s ease;
  overflow: hidden;
  border: 2px solid transparent;
  animation: pulseBorder 3s infinite;
  box-shadow: 0 0 0 2px transparent;
}

.wow-card:hover {
  box-shadow: 0 12px 30px rgba(0, 85, 140, 0.15);
  border-image: linear-gradient(45deg, #00558C, #cc6600) 1;
}

.icon-glow {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  background: linear-gradient(135deg,#F15A29, #F15A29);
  color: #fff;
  font-size: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1rem;
  animation: float 2.5s ease-in-out infinite, glow 3s ease-in-out infinite;
  box-shadow: 0 0 15px rgba(0, 85, 140, 0.4);
}

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-8px); }
}

@keyframes glow {
  0%, 100% { box-shadow: 0 0 10px #cc6600; }
  50% { box-shadow: 0 0 20px #00558C; }
}

.btn-glow {
  border-radius: 30px;
  padding: 8px 20px;
  background: transparent;
  border: 2px solid #00558C;
  color: #00558C;
  font-weight: 600;
  transition: all 0.3s ease;
}

.btn-glow:hover {
  background: linear-gradient(to right, #00558C, #cc6600);
  color: #fff;
  border: none;
  box-shadow: 0 0 12px #cc6600;
}

@keyframes pulseBorder {
  0% {
    box-shadow: 0 0 0 0 rgba(204, 102, 0, 0.3);
  }
  70% {
    box-shadow: 0 0 0 10px rgba(204, 102, 0, 0);
  }
  100% {
    box-shadow: 0 0 0 0 rgba(204, 102, 0, 0);
  }
}
.icon-glow-dual {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  background: linear-gradient(135deg, #00558C, #FF8746);
  font-size: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1rem;
  animation: glowPulse 3s ease-in-out infinite;
  box-shadow: 0 0 15px rgba(255, 135, 70, 0.5);
}

.icon-glow-dual i {
  color: #FF8746 !important;
}

</style>


<!-- Init AOS & Tilt -->
<script>
    AOS.init();
    VanillaTilt.init(document.querySelectorAll("[data-tilt]"));
</script>
<!-- Features Section -->
<!-- Why Choose Us Section -->
<%--<section class="py-5 bgsebi">
  <div class="container">
    <div class="text-center mb-5 bounce-animation">
      <p class="text-dark">Powerful benefits for smart bond investors</p>
    </div>

    <div class="row g-4">
      <!-- Repeat structure for each card -->
      <div class="col-12 col-sm-6 col-lg-4">
        <div class="text-center p-4 rounded-4 bg-white shadow-sm h-100 border border-warning border-opacity-25 bounce-animation">
          <i class="fa-solid fa-shield-halved fa-2x mb-3" style="color: #cc6600;"></i>
          <h5 class="fw-semibold" style="color: #003366;">SEBI Registered</h5>
          <p class="mb-0" style="color: #000;">Secure investing with SEBI-regulated partners.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="text-center p-4 rounded-4 bg-white shadow-sm h-100 border border-warning border-opacity-25 bounce-animation">
          <i class="fa-solid fa-wallet fa-2x mb-3" style="color: #cc6600;"></i>
          <h5 class="fw-semibold" style="color: #003366;">Easy Payments</h5>
          <p class="mb-0" style="color: #000;">Fast and flexible online transactions.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="text-center p-4 rounded-4 bg-white shadow-sm h-100 border border-warning border-opacity-25 bounce-animation">
          <i class="fa-solid fa-certificate fa-2x mb-3" style="color: #cc6600;"></i>
          <h5 class="fw-semibold" style="color: #003366;">Verified Bonds</h5>
          <p class="mb-0" style="color: #000;">Invest in pre-verified high-grade bond listings.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="text-center p-4 rounded-4 bg-white shadow-sm h-100 border border-warning border-opacity-25 bounce-animation">
          <i class="fa-solid fa-bolt fa-2x mb-3" style="color: #cc6600;"></i>
          <h5 class="fw-semibold" style="color: #003366;">Instant Allotment</h5>
          <p class="mb-0" style="color: #000;">Get instant allotment confirmation after payment.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="text-center p-4 rounded-4 bg-white shadow-sm h-100 border border-warning border-opacity-25 bounce-animation">
          <i class="fa-solid fa-headset fa-2x mb-3" style="color: #cc6600;"></i>
          <h5 class="fw-semibold" style="color: #003366;">Dedicated Support</h5>
          <p class="mb-0" style="color: #000;">Call or chat with bond experts anytime you need help.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="text-center p-4 rounded-4 bg-white shadow-sm h-100 border border-warning border-opacity-25 bounce-animation">
          <i class="fa-solid fa-chart-line fa-2x mb-3" style="color: #cc6600;"></i>
          <h5 class="fw-semibold" style="color: #003366;">High Returns</h5>
          <p class="mb-0" style="color: #000;">Grow your wealth with bonds offering superior returns.</p>
        </div>
      </div>
    </div>
  </div>
</section>--%>

<!-- Modal -->
<section>
  <div class="modal fade" id="promoModal" tabindex="-1" aria-labelledby="promoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content border-0 text-white custom-modal-gradient rounded-4 shadow-lg">
        
        <!-- Modal Header -->
        <div class="modal-header border-0">
          <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        
        <!-- Modal Body -->
        <div class="modal-body text-center px-4 py-3">
          <div class="icon-glow mb-3">
            <i class="bi bi-graph-up-arrow fs-1"></i>
          </div>
          <h4 class="fw-bold">High Yield Bonds</h4>
          <p>Discover high-return bond opportunities now.</p>
          <a href="https://bondsadda.com/OurCollections?oId=16" class="btn btn-golden btn-lg mt-3 px-4 py-2 fw-semibold shadow">Explore Now</a>
        </div>

      </div>
    </div>
  </div>
</section>

<!-- Bootstrap JS (required) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Auto show and close after 5 seconds -->
<script>

</script>



   
   <!-- High Yield Bonds Section --><!-- High Yield Bonds Section -->
<!-- Swiper CSS -->
<!-- Swiper CSS -->
<!-- Swiper CSS -->
<!-- Swiper CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<section class="py-5 bg-light position-relative overflow-hidden">
  <div class="container">
    <h5 class="text-center mb-5 fw-bold fd-heading display-6">
      💰 Top <span class="highlight-orange">High-Yield Bonds</span> Above 14%
    </h5>

    <!-- Swiper Carousel -->
    <div class="swiper fd-swiper">
      <div class="swiper-wrapper">

        <!-- Slide 1 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <span class="rate-badge">Up to 14.25%</span>
            <div class="fd-card-img">
              <img src="https://bondsadda.com/vimage/88108team_vedika_logo.jpeg" alt="Team Vedika" />
            </div>
            <h5>Team Vedika</h5>
            <p class="rate-text">Corporate Bond | Secured</p>
            <a href="https://bondsadda.com/cashflow?oid=4892" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <span class="rate-badge">Up to 13.80%</span>
            <div class="fd-card-img">
              <img src="https://bondsadda.com/vimage/24414rdc%20concrete(india)%20limited.jpeg" alt="RDC Concrete" />
            </div>
            <h5>RDC Concrete</h5>
            <p class="rate-text">AAA Rated | Private Bond</p>
            <a href="https://bondsadda.com/cashflow?oid=4878" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <span class="rate-badge">Up to 13.75%</span>
            <div class="fd-card-img">
              <img src="https://bondsadda.com/vimage/47714keertana.png" alt="Keertana" />
            </div>
            <h5>Keertana</h5>
            <p class="rate-text">Monthly Return | Unlisted</p>
            <a href="https://bondsadda.com/cashflow?oid=4862" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>

        <!-- Slide 4 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <span class="rate-badge">Up to 13.60%</span>
            <div class="fd-card-img">
              <img src="https://bondsadda.com/vimage/95068indelmoney_logo.jpeg" alt="Indel Money" />
            </div>
            <h5>Indel Money</h5>
            <p class="rate-text">Quarterly Interest | NBFC</p>
            <a href="https://bondsadda.com/cashflow?oid=4849" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>

        <!-- Slide 5 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <span class="rate-badge">Up to 13.50%</span>
            <div class="fd-card-img">
              <img src="https://bondsadda.com/vimage/73786earlysalary.webp" alt="EarlySalary" />
            </div>
            <h5>EarlySalary</h5>
            <p class="rate-text">Short Tenure | Digital NBFC</p>
            <a href="https://bondsadda.com/cashflow?oid=4855" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>

      </div>
      <%--<div class="swiper-pagination mt-4"></div>--%>
    </div>
  </div>
</section>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
    new Swiper('.fd-swiper', {
        slidesPerView: 1,
        spaceBetween: 20,
        loop: true,
        autoplay: { delay: 3000 },
        breakpoints: {
            576: { slidesPerView: 1.2 },
            768: { slidesPerView: 2 },
            992: { slidesPerView: 3 },
            1200: { slidesPerView: 3.2 },
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
    });
</script>

<!-- Custom Styles -->
<style>
.fd-heading {
  background: linear-gradient(90deg, #00558C, #FF8746);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-size: 200% auto;
  animation: shine 5s linear infinite;
}
@keyframes shine {
  0% { background-position: 0% center; }
  100% { background-position: 200% center; }
}
.highlight-orange { color: #FF8746; }

.swiper-slide { display: flex; justify-content: center; }

.fd-card {
  width: 340px;
  background: linear-gradient(135deg, #fff5eb, #e8f4fd);
  border-radius: 1.5rem;
  padding: 1.5rem 1rem;
  box-shadow: 0 12px 25px rgba(0, 0, 0, 0.07);
  border: 1px solid rgba(0,0,0,0.03);
  transition: all 0.4s ease-in-out;
  position: relative;
}
.fd-card:hover {
  transform: translateY(-6px) scale(1.02);
  box-shadow: 0 20px 40px rgba(255, 135, 70, 0.2);
  background: linear-gradient(135deg, #fef1e6, #e0f0ff);
  border-color: #FF8746;
}
.fd-card-img {
  width: 100%; height: 120px;
  display: flex; align-items: center; justify-content: center;
  margin-bottom: 1rem;
}
.fd-card-img img {
  width: 100%; height: 100%; object-fit: contain;
  transition: transform 0.3s ease;
}
.fd-card:hover img { transform: scale(1.05); }
.fd-card h5 {
  font-size: 1.1rem; font-weight: 600; color: #003366; margin-bottom: 0.5rem;
}
.rate-text {
  font-weight: 500;
  color: #FF8746;
  margin-bottom: 1rem;
}
.rate-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background: #FF8746;
  color: white;
  font-weight: bold;
  font-size: 0.9rem;
  padding: 5px 10px;
  border-radius: 30px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.2);
}
.btn-fd {
  background: linear-gradient(to right, #FF8746, #00558C);
  color: #fff;
  font-weight: 600;
  padding: 10px 20px;
  border-radius: 30px;
  text-decoration: none;
  transition: all 0.3s ease-in-out;
  display: inline-block;
}
.btn-fd:hover {
  background: linear-gradient(to right, #00558C, #FF8746);
  box-shadow: 0 0 12px rgba(255, 135, 70, 0.5);
  transform: scale(1.05);
}
</style>




  <!-- Swiper Carousel with FD Cards -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
/>

<section class="py-5 bg-light position-relative overflow-hidden">
  <div class="container">
    <h5 class="text-center mb-5 fw-bold display-5 fd-heading">
      💰 Top <span class="highlight-orange">High-Yield FD</span> Above 13%
    </h5>

    <div class="swiper fd-swiper">
      <div class="swiper-wrapper">
        <!-- Card 1 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <div class="rate-badge">13.25%</div>
            <div class="fd-card-img">
              <img src="https://cdn.shriramfinance.in/sfl-fe/assets/images/sfl-logo.webp" alt="Shriram" />
            </div>
            <h5>Shriram Finance</h5>
            <p class="rate-text">Up to 13.25%</p>
            <a href="https://www.dimensiongroup.co.in/fixed-deposit/SFl%20Form.pdf" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>

        <!-- Card 2 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <div class="rate-badge">13.10%</div>
            <div class="fd-card-img">
              <img src="https://www.pnbhousing.com/documents/d/guest/logo-header?download=true" alt="PNB" />
            </div>
            <h5>PNB Housing Finance Ltd.</h5>
            <p class="rate-text">Up to 13.10%</p>
            <a href="https://www.dimensiongroup.co.in/fixed-deposit/PNB_Fixed_Deposit_Form.pdf" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>

        <!-- Card 3 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <div class="rate-badge">13.50%</div>
            <div class="fd-card-img">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIi0Lufh2ybEC5od_gdVgJ0V_YN67KUPh4Ww&s" alt="Bajaj" />
            </div>
            <h5>Bajaj Finance Ltd.</h5>
            <p class="rate-text">Up to 13.50%</p>
            <a href="https://www.dimensiongroup.co.in/fixed-deposit/APP%20BAJAJ%20FORM.pdf" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>

        <!-- Card 4 -->
        <div class="swiper-slide">
          <div class="fd-card text-center">
            <div class="rate-badge">13.00%</div>
            <div class="fd-card-img">
              <img src="https://f2.leadsquaredcdn.com/t/lichousing/content/common/images/LIC_Housing_Finance_logo.png" alt="LIC" />
            </div>
            <h5>LIC Housing Finance Ltd.</h5>
            <p class="rate-text">Up to 13.00%</p>
            <a href="https://www.dimensiongroup.co.in/fixed-deposit/sanchay03.pdf" target="_blank" class="btn-fd">Buy Now</a>
          </div>
        </div>
      </div>
      <%--<div class="swiper-pagination mt-4"></div>--%>
    </div>
  </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
    new Swiper('.fd-swiper', {
        slidesPerView: 1,
        spaceBetween: 20,
        loop: true,
        autoplay: { delay: 3000 },
        breakpoints: {
            576: { slidesPerView: 1.2 },
            768: { slidesPerView: 2 },
            992: { slidesPerView: 3 },
            1200: { slidesPerView: 3.2 },
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
    });
</script>

<style>
.fd-heading {
  background: linear-gradient(90deg, #00558C, #FF8746);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-size: 200% auto;
  animation: shine 5s linear infinite;
}
@keyframes shine {
  0% { background-position: 0% center; }
  100% { background-position: 200% center; }
}
.highlight-orange { color: #FF8746; }

.swiper-slide { display: flex; justify-content: center; }

.fd-card {
  width: 320px;
  background: linear-gradient(135deg, #fff5eb, #e8f4fd);
  border-radius: 1.5rem;
  padding: 1.5rem 1rem;
  box-shadow: 0 12px 25px rgba(0, 0, 0, 0.07);
  border: 1px solid rgba(0,0,0,0.03);
  transition: all 0.4s ease-in-out;
  position: relative;
}
.fd-card:hover {
  transform: translateY(-6px) scale(1.02);
  box-shadow: 0 20px 40px rgba(255, 135, 70, 0.2);
  background: linear-gradient(135deg, #fef1e6, #e0f0ff);
  border-color: #FF8746;
}
.fd-card-img {
  width: 100%; height: 150px;
  display: flex; align-items: center; justify-content: center;
  margin-bottom: 1rem;
}
.fd-card-img img {
  width: 100%; height: 100%; object-fit: contain;
  transition: transform 0.3s ease;
}
.fd-card:hover img { transform: scale(1.05); }
.fd-card h5 {
  font-size: 1.1rem; font-weight: 600; color: #003366; margin-bottom: 0.5rem;
}
.rate-text {
  font-weight: 500;
  color: #FF8746;
  margin-bottom: 1rem;
}
.rate-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background: #FF8746;
  color: white;
  font-weight: bold;
  font-size: 0.9rem;
  padding: 5px 10px;
  border-radius: 30px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.2);
}
.btn-fd {
  background: linear-gradient(to right, #FF8746, #00558C);
  color: #fff;
  font-weight: 600;
  padding: 10px 20px;
  border-radius: 30px;
  text-decoration: none;
  transition: all 0.3s ease-in-out;
  display: inline-block;
}
.btn-fd:hover {
  background: linear-gradient(to right, #00558C, #FF8746);
  box-shadow: 0 0 12px rgba(255, 135, 70, 0.5);
  transform: scale(1.05);
}
</style>






    <section  >
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
                <div class="row"  >
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
                                            <asp:HiddenField ID="hfProductName"  runat="server" Value='<%#Eval("ProductName") %>' />
                                            <asp:HiddenField ID="hfCategory" runat="server" Value='<%#Eval("CategoryId") %>' />
                                            <asp:HiddenField ID="hfProductId" runat="server" Value='<%#Eval("ProductsId") %>' />
                                            <asp:HiddenField ID= "hfPrice" runat="server" Value='<%#Eval("Price") %>' />
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
                                                    ₹<%#Eval("FacevalueForBond") %></p>



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
                                                    <asp:Label ID="lblCoupon" runat="server" Text='<%#Eval("CouponRate") %>'></asp:Label>%
                                                   
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
                                                        <asp:LinkButton ID="LinkButton2"  runat="server" OnClick="LinkButton1_Click">Login to view</asp:LinkButton>
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
                                                    <asp:Label ID="lblMaturityDate"  runat="server" Text='<%#Eval("MaturityDate") %>'></asp:Label>
                                                  
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
 
<!-- Style block -->
<style>
  .icon-circle {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .hover-effect {
    transition: all 0.3s ease-in-out;
  }

  .hover-effect:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
  }

  .collection h5 {
    min-height: 50px;
  }
</style>



    <section class="video-home py-md-5 py-4 collection" >
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
    <%--<section class=" py-md-5 py-4">
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
    </section>--%>

    
    <section class="py-5 bg-white">
  <div class="container">
    <div class="text-center mb-5">
      <h2 class="fw-bold text-primary">What Our Investors Say</h2>
      <p class="text-muted">Trusted by thousands of happy investors across India</p>
    </div>

    <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">

        <!-- Slide 1 -->
        <div class="carousel-item active">
          <div class="card border-0 shadow-sm mx-auto" style="max-width: 600px;">
            <div class="card-body">
              <p class="card-text text-muted mb-3">“BondsAdda made bond investing simple and profitable. The support team guided me at every step.”</p>
              <div class="d-flex align-items-center">
                <img src="https://i.pravatar.cc/60?img=5" class="rounded-circle me-3" width="50" height="50" alt="Investor">
                <div>
                  <h6 class="mb-0 fw-semibold">Ravi Sharma</h6>
                  <small class="text-muted">Mumbai, Maharashtra</small>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item">
          <div class="card border-0 shadow-sm mx-auto" style="max-width: 600px;">
            <div class="card-body">
              <p class="card-text text-muted mb-3">“I was new to bonds, but BondsAdda’s dashboard and recommendations made me confident and comfortable.”</p>
              <div class="d-flex align-items-center">
                <img src="https://i.pravatar.cc/60?img=8" class="rounded-circle me-3" width="50" height="50" alt="Investor">
                <div>
                  <h6 class="mb-0 fw-semibold">Priya Verma</h6>
                  <small class="text-muted">Delhi NCR</small>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item">
          <div class="card border-0 shadow-sm mx-auto" style="max-width: 600px;">
            <div class="card-body">
              <p class="card-text text-muted mb-3">“Great platform with high-yield bond options. The process is fast, secure, and completely online.”</p>
              <div class="d-flex align-items-center">
                <img src="https://i.pravatar.cc/60?img=12" class="rounded-circle me-3" width="50" height="50" alt="Investor">
                <div>
                  <h6 class="mb-0 fw-semibold">Ankit Desai</h6>
                  <small class="text-muted">Ahmedabad, Gujarat</small>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>

  </div>
</section>


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
    <section class="home-blog py-md-5 py-4" >
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
    <section class="subscribe pb-md-5 pb-3" style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="box2 ">
                        <div class="row">
                            <div
                                class="col-md-7 p-md-5 p-5 text-md-left text-center d-flex justify-content-center align-items-center">
                                <div
                                    class="">
                                    <h2 class="font-weight-normal color2">Subscribe
                                        to
                                        our <span class="color2">Newsletter</span></h2>
                                    <p style="color:white;">
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

    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        .chart-wrapper {
            display: none;
            transition: opacity 0.5s ease;
        }
        .chart-wrapper.active {
            display: block;
        }
    </style>

    <!-- Chart Containers -->
    <div id="chartBond" class="chart-wrapper active">
        <canvas id="bondChart" height="0.1"></canvas>
    </div>
    <div id="chartFD" class="chart-wrapper">
        <canvas id="fdChart" height="0.1"></canvas>
    </div>
    <div id="chartIPO" class="chart-wrapper">
        <canvas id="ipoChart" height="0.1"></canvas>
    </div>

    <!-- JS to Initialize Charts + Auto Switch -->
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            // Initialize Charts
            const bondCtx = document.getElementById('bondChart').getContext('2d');
            new Chart(bondCtx, {
                type: 'bar',
                data: {
                    labels: ['High Returns Bonds', 'Monthly Income Bonds'],
                    datasets: [{
                        label: 'Returns (%)',
                        data: [14, 13],
                        backgroundColor: ['#FF6B00', '#0d6efd']
                    }]
                },
                options: {
                    responsive: true,
                    plugins: { legend: { display: false } },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: { display: true, text: 'Return (%)' },
                            ticks: { stepSize: 2 }
                        }
                    }
                }
            });

            const fdCtx = document.getElementById('fdChart').getContext('2d');
            new Chart(fdCtx, {
                type: 'bar',
                data: {
                    labels: ['Top FD Rates', 'Market Avg'],
                    datasets: [{
                        label: 'Interest (%)',
                        data: [12, 6],
                        backgroundColor: ['#FF6B00', '#0d6efd']
                    }]
                },
                options: {
                    responsive: true,
                    plugins: { legend: { display: false } },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: { display: true, text: 'Interest (%)' },
                            ticks: { stepSize: 2 }
                        }
                    }
                }
            });

            const ipoCtx = document.getElementById('ipoChart').getContext('2d');
            new Chart(ipoCtx, {
                type: 'bar',
                data: {
                    labels: ['IPO A', 'IPO B', 'IPO C'],
                    datasets: [{
                        label: 'Potential Gain (%)',
                        data: [18, 25, 15],
                        backgroundColor: ['#FF6B00', '#0d6efd', '#ffc107']
                    }]
                },
                options: {
                    responsive: true,
                    plugins: { legend: { display: false } },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: { display: true, text: 'Gain (%)' },
                            ticks: { stepSize: 5 }
                        }
                    }
                }
            });

            // Auto-Switch Logic
            const chartWrappers = document.querySelectorAll('.chart-wrapper');
            let currentIndex = 0;

            setInterval(() => {
                chartWrappers[currentIndex].classList.remove('active');
                currentIndex = (currentIndex + 1) % chartWrappers.length;
                chartWrappers[currentIndex].classList.add('active');
            }, 2000); // 2 seconds
        });
    </script>
</asp:Content>
 
