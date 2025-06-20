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

/* Common ellipsis styles for spans with line clamping */
span.abcd,
span.kgs,
span.abs,
span.mmm,
span.defg {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
}

span.abcd {
  -webkit-line-clamp: 2;
  line-clamp: 2;
}

span.kgs {
  -webkit-line-clamp: 3;
  line-clamp: 3;
}

span.abs,
span.mmm {
  -webkit-line-clamp: 1;
  line-clamp: 1;
}

span.defg {
  -webkit-line-clamp: 4;
  line-clamp: 4;
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
  background: white;
  color: #085D94;
  box-shadow: 0 5px 25px rgba(0, 0, 0, 0.15);
  font-size: 1.2rem;
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

h2.title {
  font-weight: 700;
  color: #003366;
  margin-bottom: 40px;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
}

/* Carousel styles */
.carousel-container {
  width: fit-content;
  max-width: 100%;
  height: 300px;
  perspective: 1000px;
  overflow: hidden;
  display: flex;
}

.carousel-track {
  display: flex;
  transition: transform 1s ease-in-out;
  transform-style: preserve-3d;
  overflow-x: auto;
  gap: 20px;
  scroll-snap-type: x mandatory;
  padding: 10px 0;
  scroll-behavior: smooth;
  scrollbar-width: none;
}

.carousel-track::-webkit-scrollbar {
  display: none;
}

.carousel-slide {
  min-width: 300px;
  height: 300px;
  margin: 0;
  background-size: cover;
  background-position: center;
  border-radius: 12px;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.6);
  transform: scale(0.66);
  transition: transform 0.8s ease, opacity 0.5s ease, box-shadow 0.4s ease;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  position: relative;
  scroll-snap-align: start;
  animation: slideInZoom 0.8s ease-in-out;
  overflow: hidden;
}

.carousel-slide.active {
  transform: scale(0.6) rotateY(0deg);
  z-index: 10;
}

.carousel-slide.prev,
.carousel-slide.next {
  opacity: 1.2;
}

.carousel-slide:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}

.carousel-slide::after {
  content: attr(data-info);
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 10px;
  background: rgba(0, 0, 0, 0.6);
  color: white;
  font-size: 0.85rem;
  opacity: 0;
  transition: opacity 0.3s;
}

.carousel-slide:hover::after {
  opacity: 1;
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
  position: absolute;
  bottom: 15px;
  right: 15px;
  background: #ff851b;
  color: white;
  font-size: 0.85rem;
}

.cta-button:hover {
  background: #001f3f;
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

@keyframes slideInZoom {
  from {
    opacity: 0;
    transform: scale(0.9);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.bgbackground {
  font-family: 'Segoe UI', sans-serif;
  background: linear-gradient(to right, #085D94, #F57C00);
  color: white;
  padding: 20px;
  border-radius: 8px;
}

.hero h1 {
  font-size: 3rem;
}

.rotating-tagline {
  font-size: 1.9rem;
  font-weight: 600;
  animation: fadeInOut 3s infinite;
}

@keyframes fadeInOut {
  0%, 100% { opacity: 0; }
  50% { opacity: 1; }
}

.counter-value {
  font-size: 2.5rem;
  font-weight: bold;
}

.counter-label {
  font-size: 1.2rem;
}

.btn-invest {
  background-color: #fff;
  color: #085D94;
  border-radius: 30px;
  padding: 14px 28px;
  font-weight: 700;
  font-size: 1.1rem;
}

.btn-invest:hover {
  background-color: #F57C00;
  color: white;
}

.hero-img {
  max-width: 100%;
  animation: float 4s ease-in-out infinite;
}

@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}

.features-section {
  background-color: rgba(255, 255, 255, 0.08);
  padding: 70px 0;
}

.feature-card {
  background-color: rgba(255, 255, 255, 0.1);
  border-radius: 15px;
  padding: 30px 20px;
  text-align: center;
  transition: transform 0.3s, box-shadow 0.3s;
  color: white;
}

.feature-card:hover {
  transform: translateY(-10px);
  box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

.feature-card i {
  font-size: 3rem;
  color: #F57C00;
  margin-bottom: 20px;
  animation: zoomIn 1s ease;
}

.feature-title {
  font-size: 1.4rem;
  font-weight: 700;
  margin-top: 10px;
}

.feature-card p {
  font-size: 1.1rem;
}

.btn-golden {
  background-color: #F57C00;
  color: white;
  border-radius: 20px;
  padding: 12px 24px;
  font-size: 1.1rem;
}

.btn-golden:hover {
  background-color: #d66900;
}

..bond-section {
      padding: 60px 0;
    }

    .section-title {
      font-size: 2rem;
      font-weight: 700;
      margin-bottom: 40px;
    }

    .section-title span {
      color: #f57c00;
    }

    .card {
      border: none;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      transition: transform 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
    }

    .card-title {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 15px;
    }

    .btn-warning {
      font-weight: 600;
      border-radius: 30px;
    }

    .card img {
      height: 180px;
      object-fit: cover;
    }

    .nav-tabs .nav-link.active {
      background-color: #f57c00;
      color: #fff;
      font-weight: bold;
    }

    .nav-tabs .nav-link {
      color: #333;
      font-weight: 500;
      border-radius: 8px;
    }
      h3.section-title {
      font-weight: 700;
      margin-bottom: 30px;
      color: #001f3f;
    }
    h3.section-title span {
      color: #ff851b;
    }

    /* Carousel styles */
    .carousel-container {
      position: relative;
      overflow: hidden;
      margin: 0 auto;
      max-width: 100%;
      padding: 10px 0;
    }

    .carousel-track {
      display: flex;
      gap: 20px;
      overflow-x: auto;
      scroll-behavior: smooth;
      padding-bottom: 10px;
    }
    /* Hide native scrollbar */
    .carousel-track::-webkit-scrollbar {
      display: none;
    }
    .carousel-track {
      -ms-overflow-style: none; /* IE and Edge */
      scrollbar-width: none; /* Firefox */
    }

    .carousel-slide {
      flex: 0 0 250px;
      height: 200px;
      border-radius: 12px;
      background-size: cover;
      background-position: center;
      position: relative;
      box-shadow: 0 5px 15px rgb(0 0 0 / 0.15);
      transition: transform 0.3s ease;
    }
    .carousel-slide:hover {
      transform: scale(1.05);
    }

    .cta-button {
      position: absolute;
      bottom: 12px;
      left: 50%;
      transform: translateX(-50%);
      background-color: #ff851b;
      color: white;
      font-weight: 600;
      padding: 8px 20px;
      border-radius: 50px;
      text-decoration: none;
      font-size: 0.9rem;
      display: flex;
      align-items: center;
      gap: 8px;
      box-shadow: 0 4px 10px rgb(255 133 27 / 0.6);
      transition: background-color 0.3s ease;
    }
    .cta-button:hover {
      background-color: #e67300;
      color: #fff;
      text-decoration: none;
    }

    /* Carousel arrows */
    .carousel-arrow {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background: #001f3f;
      color: #ff851b;
      border: none;
      border-radius: 50%;
      width: 40px;
      height: 40px;
      font-size: 1.4rem;
      cursor: pointer;
      box-shadow: 0 2px 6px rgb(0 31 63 / 0.5);
      z-index: 10;
      transition: background-color 0.3s ease;
    }
    .carousel-arrow:hover {
      background: #003366;
    }
    .arrow-left {
      left: 10px;
    }
    .arrow-right {
      right: 10px;
    }

    /* Responsive */
    @media (max-width: 576px) {
      .carousel-slide {
        flex: 0 0 80vw;
        height: 180px;
      }
    }

 .home-page-investment-option .box {
   min-height: 260px;
   margin-bottom: 30px;
   position: relative;
   border-bottom: 4px solid #ad5a3b;
   background: rgb(246, 246, 246);
 }
 .home-page-investment-option .box a,
 .home-page-investment-option .box .aspNetDisabled {
   position: absolute;
   bottom: 30px;
   left: 50%;
   transform: translateX(-50%);
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
 .home-page-investment-option .box a:hover,
 .home-page-investment-option .box .aspNetDisabled:hover {
   background: linear-gradient(to right, #085D94, #F57C00);
   color: white;
   cursor: pointer;
 }
  @keyframes slideInRightToLeft {
      0% {
        transform: translateX(100%);
        opacity: 0;
      }
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }

    /* Float up and down */
    @keyframes floatUpDown {
      0%   { transform: translateY(0); }
      50%  { transform: translateY(-10px); }
      100% { transform: translateY(0); }
    }

    .hero-img {
      animation: slideInRightToLeft 2.5s ease-out forwards;
    }

    /* Add float animation after slide-in finishes */
    .hero-img.float {
      animation: floatUpDown 2s ease-in-out infinite;
      animation-delay: 2.5s; /* Wait until slide animation finishes */
    }
     @keyframes slideInLeftToRight {
      0% {
        transform: translateX(-100%);
        opacity: 0;
      }
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }

    .slide-in-ltr {
      animation: slideInLeftToRight 1.8s ease-out forwards;
    }

    .features-section {
      background: linear-gradient(to right, #085D94, #F57C00);
      color: white;
    }

    .feature-card {
      background: transparent;
      box-shadow: 0 0 15px rgba(0,0,0,0.15);
      transition: transform 0.3s ease;
    }
    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    }

    @keyframes bounce {
      0%, 100% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-15px);
      }
    }

    .bounce-animation {
      animation-name: bounce;
      animation-duration: 2.5s;
      animation-timing-function: ease-in-out;
      animation-iteration-count: infinite;
      animation-fill-mode: both;
    }
    
  .custom-modal-gradient {
    background:  linear-gradient(to right, #085D94, #F57C00);/* unified gradient */
    color: white;
  }

  .icon-glow i {
    background: linear-gradient(45deg, #FFD700, #FFA500);
    padding: 20px;
    border-radius: 50%;
    box-shadow: 0 0 25px rgba(255, 215, 0, 0.7);
  }

  .btn-golden {
    background: linear-gradient(45deg, #FFD700, #FFA500);
    color: #000;
    border: none;
    transition: all 0.3s ease;
    border-radius: 50px;
  }

  .btn-golden:hover {
    background: linear-gradient(45deg, #FFA500, #FFD700);
    color: #fff;
    box-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
  }
</style>
    <script>
        // Tagline Rotator
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
            const el = document.getElementById("taglineDisplay");
            if (el) el.textContent = taglines[taglineIndex];
        }, 2000);

        // Number Animation
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
                    element.innerText = end.toLocaleString() + suffix;
                }
            };

            requestAnimationFrame(step);
        }
        // Carousel scroll buttons
        const track = document.getElementById('carouseltrack');
        const btnLeft = document.getElementById('btnLeft');
        const btnRight = document.getElementById('btnRight');


        btnLeft.addEventListener('click', () => {
            track.scrollBy({ left: -280, behavior: 'smooth' });
        });
        btnRight.addEventListener('click', () => {
            track.scrollBy({ left: 280, behavior: 'smooth' });
        });

        // Carousel Autoplay
        //function setupCarouselAutoplay() {
        //    const track = document.getElementById('carouselTrack');
        //    const slides = Array.from(track?.children || []);
        //    let current = 0;

        //    function updateSlides() {
        //        slides.forEach((slide, index) => {
        //            slide.classList.remove('active', 'prev', 'next');
        //            if (index === current) slide.classList.add('active');
        //            else if (index === (current + 1) % slides.length) slide.classList.add('next');
        //            else if (index === (current - 1 + slides.length) % slides.length) slide.classList.add('prev');
        //        });
        //    }

        //    function moveCarousel() {
        //        current = (current + 1) % slides.length;
        //        const slideWidth = slides[0].offsetWidth + 40; // margin compensation
        //        const offset = -(slideWidth * current);
        //        track.style.transform = `translateX(${offset}px)`;
        //        updateSlides();
        //    }

        //    updateSlides();
        //    setInterval(moveCarousel, 3000);
        //}

        //// Scrollable Carousel & Touch Support
        //function setupCarouselScroll() {
        //    const carouselTrack = document.getElementById("carouselTrack");
        //    if (!carouselTrack) return;

        //    let autoScrollInterval;
        //    let scrollDirection = 1; // 1 = left to right, -1 = right to left

        //    function scrollCarousel(direction) {
        //        const slide = carouselTrack.querySelector('.carousel-slide');
        //        if (!slide) return;
        //        const slideWidth = slide.offsetWidth + 20;
        //        carouselTrack.scrollBy({ left: direction * slideWidth, behavior: 'smooth' });
        //    }

        //    function startAutoScroll() {
        //        autoScrollInterval = setInterval(() => {
        //            scrollCarousel(scrollDirection);
        //        }, 4000);
        //    }

        //    function setScrollDirection(direction) {
        //        scrollDirection = direction === 'ltr' ? 1 : -1;
        //        clearInterval(autoScrollInterval);
        //        startAutoScroll();
        //    }

        //    // Touch swipe support
        //    let startX = 0;
        //    carouselTrack.addEventListener('touchstart', e => startX = e.touches[0].clientX);
        //    carouselTrack.addEventListener('touchend', e => {
        //        const delta = startX - e.changedTouches[0].clientX;
        //        if (Math.abs(delta) > 50) scrollCarousel(delta > 0 ? 1 : -1);
        //    });

        //    startAutoScroll();

        //    return { setScrollDirection };
        //}

        

        // DOM Ready
        document.addEventListener("DOMContentLoaded", function () {
            animateValue("client-count", 0, 100, 2000);
            animateValue("transaction-count", 0, 200, 2500);
            animateValue("senior-bonds", 0, 3, 2000);
            setupCarouselAutoplay();
            setupCarouselScroll();
        });

         // Add float class after slide animation ends
    window.addEventListener('DOMContentLoaded', () => {
      const img = document.getElementById('animatedImg');
      img.addEventListener('animationend', () => {
        img.classList.add('float');
      });
    });
    </script>
    <script>
         function animateCounter(id, endValue, duration) {
    const el = document.getElementById(id);
    let startValue = 0;
    const interval = 20; // ms
    const step = Math.ceil((endValue * interval) / duration);

    const timer = setInterval(() => {
      startValue += step;
      if (startValue >= endValue) {
        el.innerText = endValue;
        clearInterval(timer);
      } else {
        el.innerText = startValue;
      }
    }, interval);
  }

  // Wait for DOM to load
  window.addEventListener('DOMContentLoaded', () => {
    animateCounter("client-count", 100, 2000);        // count to 100 in 2 sec
    animateCounter("transaction-count", 200, 2500);    // count to 200 in 2.5 sec
  });
    </script>
<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


  <!-- Initialize Swiper -->



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hfInputData" runat="server" />
 <section  style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00); color: white; ">
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
        </div>
</section>
 <!-- Hero -->
<section class="hero" style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00); color: white; text-align: center; display: flex; align-items: center; justify-content: center; min-height: 300px;">
  <div class="container">
    <div class="row align-items-center mt-4">
      
      <!-- Left Content -->
      <div class="col-lg-6 mb-4 text-lg-start text-center slide-in-ltr">
        <h1 class="fw-bold">
          Invest smart, Earn big,<br />
          <span class="color2">BONDSADDA</span>
        </h1>
        <h2 class="rotating-tagline color2" id="taglineDisplay">Regular Income</h2>

        <!-- Counters -->
       <div class="row justify-content-center">
            <div class="col-6 col-md-4 mb-3 text-center">
              <div class="counter-value" id="client-count">0</div>
              <div class="counter-label">+ Clients</div>
            </div>
            <div class="col-6 col-md-4 mb-3 text-center">
              <div class="counter-value" id="transaction-count">0</div>
              <div class="counter-label">+ Cr Transactions</div>
            </div>
       </div>
        <!-- Buttons -->
        <div class="mt-4 d-flex flex-column flex-sm-row align-items-center justify-content-center justify-content-lg-start gap-3">
          <a href="OurCollections.aspx" class="btn btn-invest color2">Invest Now</a>
          <a href="https://youtu.be/u57IIt8mwKA" target="_blank" class="text-white d-flex align-items-center gap-2 fs-5">
            <i class="fa-solid fa-circle-play text-danger fs-1"></i>
            <span>What are Bonds & How do I Invest?</span>
          </a>
        </div>
      </div>

      <!-- Right Image -->
      <div class="col-lg-6 text-center">
        <img src="https://bondsadda.com/img/blog/banner.svg" alt="Bonds Banner" class="hero-img img-fluid" />
      </div>

    </div>
  </div>
</section>


<!-- Features Section -->
<section class="features-section py-5">
  <div class="container">
    <div class="row text-center g-4">
      
      <div class="col-12 col-sm-6 col-lg-4">
        <div class="feature-card p-4 rounded shadow-sm h-100 bounce-animation" style="animation-delay: 0s;">
          <i class="fa-solid fa-shield-halved fa-2x mb-3"></i>
          <h5 class="feature-title fw-bold">SEBI Registered</h5>
          <p class="mb-0">Secure investing with SEBI-regulated partners.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="feature-card p-4 rounded shadow-sm h-100 bounce-animation" style="animation-delay: 0.2s;">
          <i class="fa-solid fa-wallet fa-2x mb-3"></i>
          <h5 class="feature-title fw-bold">Easy Payments</h5>
          <p class="mb-0">Fast and flexible online transactions.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="feature-card p-4 rounded shadow-sm h-100 bounce-animation" style="animation-delay: 0.4s;">
          <i class="fa-solid fa-certificate fa-2x mb-3"></i>
          <h5 class="feature-title fw-bold">Verified Bonds</h5>
          <p class="mb-0">Invest in pre-verified high-grade bond listings.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="feature-card p-4 rounded shadow-sm h-100 bounce-animation" style="animation-delay: 0.6s;">
          <i class="fa-solid fa-bolt fa-2x mb-3"></i>
          <h5 class="feature-title fw-bold">Instant Allotment</h5>
          <p class="mb-0">Get instant allotment confirmation after payment.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="feature-card p-4 rounded shadow-sm h-100 bounce-animation" style="animation-delay: 0.8s;">
          <i class="fa-solid fa-headset fa-2x mb-3"></i>
          <h5 class="feature-title fw-bold">Dedicated Support</h5>
          <p class="mb-0">Call or chat with bond experts anytime you need help.</p>
        </div>
      </div>

      <div class="col-12 col-sm-6 col-lg-4">
        <div class="feature-card p-4 rounded shadow-sm h-100 bounce-animation" style="animation-delay: 1s;">
          <i class="fa-solid fa-chart-line fa-2x mb-3"></i>
          <h5 class="feature-title fw-bold">High Returns</h5>
          <p class="mb-0">Grow your wealth with bonds offering superior returns.</p>
        </div>
      </div>

    </div>
  </div>
</section>     
    
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



   
<%--%--<section class="bond-section py-5" style="font-family: 'Segoe UI', sans-serif;">
  <div class="container text-center">
    <h3 class="section-title mb-4">💼 Investment <span style="color: #FFA500;">BONDS</span></h3>

    <!-- Nav Tabs -->
    <ul class="nav nav-tabs justify-content-center mb-4" id="bondTabs" role="tablist">
      <li class="nav-item">
        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab1" type="button" role="tab">New Arrival</button>
      </li>
      <li class="nav-item">
        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#tab2" type="button" role="tab">High Return</button>
      </li>
      <li class="nav-item">
        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab3" type="button" role="tab">PSU</button>
      </li>
      <li class="nav-item">
        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab4" type="button" role="tab">Government</button>
      </li>
      <li class="nav-item">
        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#tab5" type="button" role="tab">Capital</button>
      </li>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content">
      <!-- Tab 1 -->
      <div class="tab-pane fade" id="tab1" role="tabpanel">
        <p>Coming Soon</p>
      </div>

      <!-- Tab 2: High Return - Visible by default -->
      <div class="tab-pane fade show active" id="tab2" role="tabpanel">
        <div class="row g-4 justify-content-center">
          <!-- Card 1 -->
          <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
              <img src="https://bondsadda.com/VImage/88108team_vedika_logo.jpeg" class="card-img-top" alt="Team Vedika Bond">
              <div class="card-body">
                <h5 class="card-title">Team Vedika Bond</h5>
                <a href="https://bondsadda.com/CashFlow?oId=4892" class="btn btn-warning w-100" target="_blank">
                  <i class="fas fa-shopping-cart me-2"></i>Buy Now
                </a>
              </div>
            </div>
          </div>

          <!-- Card 2 -->
          <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
              <img src="https://bondsadda.com/VImage/24414RDC%20CONCRETE(INDIA)%20LIMITED.jpeg" class="card-img-top" alt="RDC Concrete Bond">
              <div class="card-body">
                <h5 class="card-title">RDC Concrete Bond</h5>
                <a href="https://bondsadda.com/CashFlow?oId=4878" class="btn btn-warning w-100" target="_blank">
                  <i class="fas fa-shopping-cart me-2"></i>Buy Now
                </a>
              </div>
            </div>
          </div>

          <!-- Card 3 -->
          <div class="col-md-4">
            <div class="card h-100 shadow-sm border-0">
              <img src="https://bondsadda.com/VImage/47714Keertana.png" class="card-img-top" alt="Keertana Bond">
              <div class="card-body">
                <h5 class="card-title">Keertana Bond</h5>
                <a href="https://bondsadda.com/CashFlow?oId=4862" class="btn btn-warning w-100" target="_blank">
                  <i class="fas fa-shopping-cart me-2"></i>Buy Now
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Other Tabs -->
      <div class="tab-pane fade" id="tab3" role="tabpanel"><p>Coming Soon</p></div>
      <div class="tab-pane fade" id="tab4" role="tabpanel"><p>Coming Soon</p></div>
      <div class="tab-pane fade" id="tab5" role="tabpanel"><p>Coming Soon</p></div>
    </div>
  </div>
</section>--%>
   <!-- High Yield Bonds Section --><!-- High Yield Bonds Section -->
<section class="py-5" style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00); color: white; text-align: center; display: flex; align-items: center; justify-content: center; ">
  <div class="container">
    <h3 class="text-center   mb-4" style="color: white;">
      💰 High Yield <span class="text-warning">Bonds</span>
    </h3>

    <div class="auto-slider">
      <div class="slider-track">
        <!-- Bond 1 -->
        <div class="bond-card">
          <img src="https://bondsadda.com/vimage/88108team_vedika_logo.jpeg" alt="Bond 1">
          <a href="https://bondsadda.com/cashflow?oid=4892" target="_blank" class="buy-btn">Buy Now</a>
        </div>
        <!-- Bond 2 -->
        <div class="bond-card">
          <img src="https://bondsadda.com/vimage/24414rdc%20concrete(india)%20limited.jpeg" alt="Bond 2">
          <a href="https://bondsadda.com/cashflow?oid=4878" target="_blank" class="buy-btn">Buy Now</a>
        </div>
        <!-- Bond 3 -->
        <div class="bond-card">
          <img src="https://bondsadda.com/vimage/47714keertana.png" alt="Bond 3">
          <a href="https://bondsadda.com/cashflow?oid=4862" target="_blank" class="buy-btn">Buy Now</a>
        </div>
        <!-- Bond 4 -->
        <div class="bond-card">
          <img src="https://bondsadda.com/vimage/95068indelmoney_logo.jpeg" alt="Bond 4">
          <a href="https://bondsadda.com/cashflow?oid=4849" target="_blank" class="buy-btn">Buy Now</a>
        </div>
        <!-- Bond 5 -->
        <div class="bond-card">
          <img src="https://bondsadda.com/vimage/73786earlysalary.webp" alt="Bond 5">
          <a href="https://bondsadda.com/cashflow?oid=4855" target="_blank" class="buy-btn">Buy Now</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Styling -->
<style>
.auto-slider {
  overflow: hidden;
  position: relative;
}

.slider-track {
  display: flex;
  gap: 1rem;
  animation: scroll 30s linear infinite;
  width: max-content;
}

@keyframes scroll {
  0% { transform: translateX(0); }
  100% { transform: translateX(-50%); }
}

.bond-card {
  flex: 0 0 auto;
  width: 250px;
  background: white;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 8px 16px rgba(0,0,0,0.1);
  transition: transform 0.3s;
  text-align: center;
}

.bond-card:hover {
  transform: scale(1.05);
}

.bond-card img {
  width: 100%;
  height: 180px;
  object-fit: cover;
}

.buy-btn {
  display: inline-block;
  background-color: #ff851b;
  color: white;
  padding: 10px 16px;
  margin: 12px 0;
  border-radius: 50px;
  text-decoration: none;
  font-weight: 600;
  transition: background 0.3s;
}

.buy-btn:hover {
  background-color: #e67e22;
}
</style>




    <section style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00);" >
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
  <section class="collection" style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00);">
  <div class="container py-5">
    <div class="text-center mb-5">
      <h2 class="h3 text-white">
        Our <span class="text-warning">Collections</span>
      </h2>
    </div>

    <div class="row g-4">
      <!-- Card 1 -->
      <div class="col-lg-3 col-md-6 col-12">
        <div class="card h-100 text-center shadow border-0 rounded-4 p-4 bg-white hover-effect">
          <div class="icon-circle bg-primary text-white mb-3 mx-auto">
            <i class="fa-solid fa-arrow-up-right-dots fa-2x"></i>
          </div>
          <h5 class="fw-semibold">High Return Bonds</h5>
          <asp:LinkButton ID="lnkhigh" runat="server" CssClass="btn btn-sm btn-outline-primary mt-2" OnClick="lnkhigh_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <!-- Card 2 -->
      <div class="col-lg-3 col-md-6 col-12">
        <div class="card h-100 text-center shadow border-0 rounded-4 p-4 bg-white hover-effect">
          <div class="icon-circle bg-success text-white mb-3 mx-auto">
            <i class="fa-solid fa-calendar-days fa-2x"></i>
          </div>
          <h5 class="fw-semibold">Monthly Income Bonds</h5>
          <asp:LinkButton ID="lnkmonth" runat="server" CssClass="btn btn-sm btn-outline-success mt-2" OnClick="lnkmonth_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <!-- Card 3 -->
      <div class="col-lg-3 col-md-6 col-12">
        <div class="card h-100 text-center shadow border-0 rounded-4 p-4 bg-white hover-effect">
          <div class="icon-circle bg-warning text-white mb-3 mx-auto">
            <i class="fa-solid fa-lock fa-2x"></i>
          </div>
          <h5 class="fw-semibold">Bank/PSU/PVT Bonds</h5>
          <asp:LinkButton ID="lnkpsu" runat="server" CssClass="btn btn-sm btn-outline-warning mt-2" OnClick="lnkpsu_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <!-- Card 4 -->
      <div class="col-lg-3 col-md-6 col-12">
        <div class="card h-100 text-center shadow border-0 rounded-4 p-4 bg-white hover-effect">
          <div class="icon-circle bg-danger text-white mb-3 mx-auto">
            <i class="fa-solid fa-people-group fa-2x"></i>
          </div>
          <h5 class="fw-semibold">Public Sector Bonds</h5>
          <asp:LinkButton ID="lnkpublic" runat="server" CssClass="btn btn-sm btn-outline-danger mt-2" OnClick="lnkpublic_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <!-- Card 5 -->
      <div class="col-lg-3 col-md-6 col-12">
        <div class="card h-100 text-center shadow border-0 rounded-4 p-4 bg-white hover-effect">
          <div class="icon-circle bg-dark text-white mb-3 mx-auto">
            <i class="fa-solid fa-crown fa-2x"></i>
          </div>
          <h5 class="fw-semibold">Sovereign Rated Bonds</h5>
          <asp:LinkButton ID="lnksaver" runat="server" CssClass="btn btn-sm btn-outline-dark mt-2" OnClick="lnksaver_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <!-- Card 6 -->
      <div class="col-lg-3 col-md-6 col-12">
        <div class="card h-100 text-center shadow border-0 rounded-4 p-4 bg-white hover-effect">
          <div class="icon-circle bg-info text-white mb-3 mx-auto">
            <i class="fa-solid fa-seedling fa-2x"></i>
          </div>
          <h5 class="fw-semibold">Tax Free Bonds</h5>
          <asp:LinkButton ID="lnktax" runat="server" CssClass="btn btn-sm btn-outline-info mt-2" OnClick="lnktax_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <!-- Card 7 -->
      <div class="col-lg-3 col-md-6 col-12">
        <div class="card h-100 text-center shadow border-0 rounded-4 p-4 bg-white hover-effect">
          <div class="icon-circle bg-secondary text-white mb-3 mx-auto">
            <i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
          </div>
          <h5 class="fw-semibold">Capital Gain Bonds (54EC)</h5>
          <asp:LinkButton ID="lnkcapital" runat="server" CssClass="btn btn-sm btn-outline-secondary mt-2" OnClick="lnkcapital_Click">Explore</asp:LinkButton>
        </div>
      </div>

      <!-- Card 8 -->
      <div class="col-lg-3 col-md-6 col-12">
        <div class="card h-100 text-center shadow border-0 rounded-4 p-4 bg-white hover-effect">
          <div class="icon-circle bg-light text-dark mb-3 mx-auto">
            <i class="fa-solid fa-timeline fa-2x"></i>
          </div>
          <h5 class="fw-semibold">Fixed Deposit</h5>
          <a href="#" class="btn btn-sm btn-outline-dark mt-2">Explore</a>
        </div>
      </div>
    </div>
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



    <section class="video-home py-md-5 py-4 collection" style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00);">
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
    <section class=" py-md-5 py-4 testimonial" style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00);">

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
    <section class="home-blog py-md-5 py-4" style="font-family: 'Segoe UI', sans-serif; background: linear-gradient(to right, #085D94, #F57C00);">
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

<%--            <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" />--%>
   <%-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
    <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> --%> 
<script type="text/javascript">



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