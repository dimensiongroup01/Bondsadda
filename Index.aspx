

<%@ Page Title="" EnableEventValidation="false"  Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 
  <!-- 📄 Meta Tags -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BondsAdda - Smart FD & Bonds Investment Partner</title>
  <meta name="google-site-verification" content="DrmoYoFrQifi3U9lxOPypMFBsBxfsUS17IN4czl-N6o" />

  <meta name="description" content="Discover secure and SEBI-compliant investment options with BondsAdda. Choose from G-Secs, Monthly Income Bonds, 54EC Capital Gain Bonds, PSU Bonds, and top-rated Fixed Deposits. Maximize your returns with smart, fixed-income strategies.">
  <meta name="keywords" content="Bonds, Fixed Deposits, G-Secs, Capital Gain Bonds, 54EC Bonds, Monthly Income Bonds, PSU Bonds, SEBI compliant investments, BondsAdda, Smart FD Investment">
  <meta name="author" content="BondsAdda by Dimension Financial Solutions">

  <!-- 🌐 Open Graph Tags -->
  <meta property="og:title" content="BondsAdda - Smart FD & Bonds Investment Partner">
  <meta property="og:description" content="Secure your future with SEBI-compliant G-Secs, Monthly Income Bonds, 54EC Capital Gain Bonds, and FDs. Trusted by smart investors.">
  <meta property="og:url" content="https://www.bondsadda.com">
  <meta property="og:type" content="website">

  <!-- 🖋️ Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <!-- 🎨 CSS Libraries -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/@splidejs/splide/dist/css/splide.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet">
  <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
    <!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>


       <!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

       <!-- Init AOS & Tilt -->
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vanilla-tilt@1.7.3/dist/vanilla-tilt.min.js"></script>

       <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-V03KL3H9X5"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-V03KL3H9X5');
</script>

<!-- Custom Styles -->





  <!-- Swiper Carousel with FD Cards -->
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
/>
  <!-- 📊 JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-tilt/1.7.0/vanilla-tilt.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>



    <!-- Optional custom CSS -->
    <style>
       /* Organized & Cleaned CSS */

/* ==== Backgrounds ==== */
body,
.bg {
  background: linear-gradient(to bottom, #001f3f, #ffffff);
}

.bg-orange {
  background: linear-gradient(135deg, #ff7700, #cc6600) !important;
  border: none;
}

/* ==== Typography & Headings ==== */
.heading-glow {
  font-size: 1.5rem;
  color: #00558C;
}

.text-gradient,
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

.highlight-orange {
  color: #FF8746;
}

/* ==== Buttons ==== */
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

/* ==== Badge & Text Effects ==== */
.badge-gradient-text {
  display: inline-block;
  padding: 0.5rem 1.25rem;
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

/* ==== Animations ==== */
.fade-in {
  opacity: 0;
  transform: translateY(20px);
  animation: fadeInUp 0.8s ease forwards;
}

@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-8px); }
}

@keyframes glow {
  0%, 100% { box-shadow: 0 0 10px #cc6600; }
  50% { box-shadow: 0 0 20px #00558C; }
}

@keyframes pulseBorder {
  0% { box-shadow: 0 0 0 0 rgba(204, 102, 0, 0.3); }
  70% { box-shadow: 0 0 0 10px rgba(204, 102, 0, 0); }
  100% { box-shadow: 0 0 0 0 rgba(204, 102, 0, 0); }
}

/* ==== Card Styles ==== */
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

.icon-glow,
.icon-glow-dual {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  font-size: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1rem;
  animation: float 2.5s ease-in-out infinite, glow 3s ease-in-out infinite;
  box-shadow: 0 0 15px rgba(0, 85, 140, 0.4);
}

.icon-glow {
  background: linear-gradient(135deg,#F15A29, #F15A29);
  color: #fff;
}

.icon-glow-dual {
  background: linear-gradient(135deg, #00558C, #FF8746);
  box-shadow: 0 0 15px rgba(255, 135, 70, 0.5);
}

.icon-glow-dual i {
  color: #FF8746 !important;
}


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

/* ==== Utilities ==== */
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
.shadow-effect {
      background: #1f3c88;
      padding: 30px 25px;
      border-radius: 12px;
      text-align: center;
      border: 1px solid #273d70;
      box-shadow: 0 12px 28px rgba(0, 0, 0, 0.3);
      min-height: 220px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .shadow-effect p {
      font-size: 16px;
      line-height: 1.6;
      color: #e0e0e0;
      margin-bottom: 15px;
    }

    .testimonial-name {
      background: #ff7a00;
      display: inline-block;
      padding: 8px 25px;
      border-radius: 20px;
      color: #fff;
      font-weight: 600;
      box-shadow: 0 6px 12px rgba(255, 122, 0, 0.3);
    }

    #customers-testimonials .item {
      padding: 20px;
      opacity: 0.3;
      transform: scale(0.9);
      transition: all 0.3s ease-in-out;
    }

    #customers-testimonials .owl-item.active.center .item {
      opacity: 1;
      transform: scale(1);
    }

    #customers-testimonials.owl-carousel .owl-dots {
      text-align: center;
      padding-top: 20px;
    }

    #customers-testimonials.owl-carousel .owl-dots .owl-dot span {
      display: inline-block;
      width: 14px;
      height: 14px;
      margin: 5px;
      background: #ccc;
      border-radius: 50%;
      transition: all 0.3s ease;
    }

    #customers-testimonials.owl-carousel .owl-dots .owl-dot.active span,
    #customers-testimonials.owl-carousel .owl-dots .owl-dot:hover span {
      background: #ff7a00;
      transform: scale(1.2);
    }

    .text-orange {
      color: #ff7a00 !important;
    }
    .collection-section {
  background: linear-gradient(to bottom right, #f4f7fb, #ffffff);
}

.sparkle-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.1) 1px, transparent 1px);
  background-size: 40px 40px;
  animation: sparkleMove 15s linear infinite;
  z-index: 0;
  pointer-events: none;
}
@keyframes sparkleMove {
  0% { background-position: 0 0; }
  100% { background-position: 100px 100px; }
}

/* Updated card background to light blue */
.wow-card {
  background: linear-gradient(135deg, #e6f0fa, #f5faff);
  border-radius: 16px;
  padding: 30px 20px;
  text-align: center;
  position: relative;
  z-index: 1;
  transition: all 0.4s ease;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
  border: 1px solid #d3e5f4;

  /* 🔷 Equal width/height ratio */
  aspect-ratio: 1 / 1;
  height: auto;

  /* Flex to align button at bottom */
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.icon-glow svg {
  width: 48px;
  height: 48px;
  margin-bottom: 15px;
  transition: all 0.3s ease;
  filter: drop-shadow(0 0 4px rgba(0, 123, 255, 0.3));
}
.wow-card:hover .icon-glow svg {
  filter: drop-shadow(0 0 6px rgba(255, 123, 0, 0.5));
}

.wow-card h5 {
  min-height: 48px;
  font-size: 1.1rem;
  font-weight: 600;
  margin-bottom: 20px;
}

/* Force square ratio in IE/fallback (if needed) */
@supports not (aspect-ratio: 1 / 1) {
  .wow-card::before {
    content: "";
    display: block;
    padding-top: 100%;
  }
}

/* Optional: Responsive fix */
@media (max-width: 767px) {
  .wow-card {
    aspect-ratio: unset;
    height: auto;
    min-height: 320px;
  }
}
.wow-card:hover {
  transform: translateY(-10px) scale(1.02);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08);
}

/* ICON GLOW with consistent size */
.icon-glow svg {
  width: 44px;
  height: 44px;
  transition: all 0.3s ease;
  filter: drop-shadow(0 0 4px rgba(0, 123, 255, 0.3));
}
.wow-card:hover .icon-glow svg {
  filter: drop-shadow(0 0 6px rgba(255, 123, 0, 0.5));
}

/* Heading glow */
.heading-glow {
  animation: glow 2.5s ease-in-out infinite alternate;
}
@keyframes glow {
  0% { text-shadow: 0 0 5px rgba(255, 115, 0, 0.3), 0 0 10px rgba(0, 86, 179, 0.3); }
  100% { text-shadow: 0 0 12px rgba(255, 115, 0, 0.6), 0 0 20px rgba(0, 86, 179, 0.5); }
}

/* Gradient text effect */
.text-gradient {
  background: linear-gradient(to right, #ff7300, #0056b3);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

/* Card badge styling */
.card-badge {
  position: absolute;
  top: 12px;
  right: 12px;
  background: linear-gradient(to right, #ff6f00, #ffa500);
  color: #fff;
  font-size: 0.75rem;
  padding: 4px 10px;
  border-radius: 50px;
  font-weight: 600;
  box-shadow: 0 0 10px rgba(255, 165, 0, 0.5);
  z-index: 2;
}

/* Explore button */
.btn-glow {
  background: linear-gradient(to right, #ff7300, #ffaf00);
  color: white;
  font-weight: 500;
  padding: 8px 20px;
  border-radius: 25px;
  box-shadow: 0 4px 12px rgba(255, 115, 0, 0.4);
  transition: all 0.3s ease;
  border: none;
}
.btn-glow:hover {
  background: linear-gradient(to right, #ff9600, #ffc400);
  box-shadow: 0 6px 16px rgba(255, 123, 0, 0.6);
  transform: scale(1.05);
}

/* Optional responsiveness */
@media (max-width: 576px) {
  .wow-card {
    padding: 25px 15px;
  }
  .icon-glow svg {
    width: 36px;
    height: 36px;
  }
}
.bond-card {
      background-color: #fff;
      border: 1px solid #dbe1ea;
      border-left: 5px solid #003366;
      border-radius: 16px;
      padding: 20px;
      transition: box-shadow 0.3s ease, transform 0.3s ease;
      display: flex;
      flex-direction: column;
      height: 100%;
    }

    .bond-card:hover {
      box-shadow: 0 10px 28px rgba(0, 0, 0, 0.08);
      transform: translateY(-6px);
    }

    .bond-title {
      font-size: 1.2rem;
      font-weight: 700;
      color: #000;
    }

    .bond-badge {
      display: inline-block;
      background: #ffcb05;
      color: #000;
      font-size: 0.75rem;
      padding: 4px 10px;
      border-radius: 50px;
      font-weight: 600;
      margin-bottom: 0.5rem;
    }

    .bond-info {
      font-size: 0.9rem;
      color: #222;
      flex-grow: 1;
    }

    .bond-info i {
      color: #003366;
      margin-right: 8px;
      width: 18px;
    }

    .btn-buy {
      background: #003366;
      color: #fff;
      padding: 6px 16px;
      font-size: 0.9rem;
      border-radius: 50px;
      font-weight: 500;
      text-decoration: none;
      transition: background 0.3s ease;
    }

    .btn-buy:hover {
      background: #001d3d;
    }

    .btn-share {
      border: 1px solid #003366;
      color: #003366;
      background: transparent;
      padding: 6px 12px;
      font-size: 0.85rem;
      border-radius: 50px;
      margin-left: 10px;
    }

    .btn-share:hover {
      background-color: #003366;
      color: #fff;
    }

    .section-title {
      color: #000;
      font-weight: 700;
      margin-bottom: 2rem;
    }

    .swiper {
      padding-bottom: 50px;
    }

   
.swiper-slide {
  display: flex;
  height: auto;
  width: auto;
}

.bond-card {
  width: 100%;
  height :510px;
  min-height: 450px; /* Set desired minimum height */
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.product-card {
      background-color: #fff;
      border: 1px solid #dbe1ea;
      border-left: 5px solid #003366;
      border-radius: 16px;
      padding: 24px;
      margin-bottom: 30px;
      transition: box-shadow 0.3s ease, transform 0.3s ease;
      height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }

    .product-card:hover {
      box-shadow: 0 10px 28px rgba(0, 0, 0, 0.08);
      transform: translateY(-6px);
    }

    .product-title {
      font-size: 1.2rem;
      font-weight: 700;
      color: #000;
      margin-bottom: 1rem;
    }

    .product-badge {
      display: inline-block;
      background: #ffcb05;
      color: #000;
      font-size: 0.75rem;
      padding: 4px 10px;
      border-radius: 50px;
      font-weight: 600;
      margin-bottom: 0.75rem;
    }

    .icon-container {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 15px;
    }

    .btn-explore {
      background: #003366;
      color: #fff;
      padding: 6px 16px;
      font-size: 0.9rem;
      border-radius: 50px;
      font-weight: 500;
      text-decoration: none;
      display: inline-block;
      transition: background 0.3s ease;
      width: 100%;
    }

    .btn-explore:hover {
      background: #001d3d;
    }

 .products-fd-section {
      background-color: #f8f9fa;
    }

    .fd-heading {
      font-size: 1.75rem;
      text-shadow: 0 0 10px rgba(255, 106, 0, 0.3);
    }

    .text-highlight-orange {
      color: #FF6A00;
    }

    .swiper-slide {
      display: flex;
      height: 100%;
    }

    .fd-product-card {
      background: #fff;
      border-radius: 12px;
      padding: 1.5rem;
      box-shadow: 0 4px 14px rgba(0, 0, 0, 0.06);
      border-left: 5px solid #003366;
      transition: all 0.3s ease;
      width: 100%;
      min-height: 400px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      align-items: center;
      text-align: center;
      position: relative;
    }

    .fd-product-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 24px rgba(0, 51, 102, 0.2);
      border-left-color: #0055aa;
    }

    .fd-product-logo img {
      max-width: 80px;
      height: auto;
      margin-bottom: 1rem;
    }

    .fd-rate-badge {
      background: radial-gradient(circle at center, #FF6A00, #ff9800);
      color: white;
      font-weight: bold;
      padding: 0.5rem 1rem;
      font-size: 1.5rem;
      border-radius: 50px;
      box-shadow: 0 0 12px rgba(255, 106, 0, 0.5);
      margin-bottom: 1rem;
      animation: pulse 2s infinite ease-in-out;
    }

    @keyframes pulse {
      0% { transform: scale(1); box-shadow: 0 0 12px rgba(255, 106, 0, 0.5); }
      50% { transform: scale(1.08); box-shadow: 0 0 20px rgba(255, 106, 0, 0.8); }
      100% { transform: scale(1); box-shadow: 0 0 12px rgba(255, 106, 0, 0.5); }
    }

    .fd-rate-text {
      font-size: 1rem;
      color: #333;
      margin-bottom: 1rem;
    }

    .fd-buy-btn,
    .fd-share-btn {
      background: #FF6A00;
      color: #fff;
      padding: 0.5rem 1.5rem;
      font-weight: 600;
      border-radius: 30px;
      text-decoration: none;
      transition: background 0.3s ease;
      margin-bottom: 0.5rem;
      display: inline-block;
    }

    .fd-share-btn {
      background: #003366;
    }

    .fd-buy-btn:hover,
    .fd-share-btn:hover {
      background: #e55a00;
      color: #fff;
    }



    
.hero-section {
      padding: 60px 20px;
      position: relative;
    }
    .hero-content {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      align-items: center;
      gap: 2rem;
      position: relative;
      z-index: 2;
    }
    .hero-left {
      flex: 1 1 50%;
      min-width: 280px;
    }
    .hero-title {
      font-size: 3rem;
      font-weight: bold;
      margin-bottom: 1rem;
    }
    .hero-desc {
      font-size: 1.1rem;
      margin-bottom: 1.5rem;
      color: #f1f1f1;
    }
    .hero-desc span {
      color: #ffd700;
      font-weight: bold;
    }
    .btn {
      background-color: #fd7e14;
      color: white;
      padding: 12px 24px;
      border-radius: 8px;
      font-weight: 600;
      font-size: 1rem;
      text-decoration: none;
      display: inline-block;
    }
    .hero-right {
      flex: 1 1 45%;
      min-width: 280px;
      position: relative;
    }
    .graph-container {
      background-color: rgba(255, 255, 255, 0.08);
      backdrop-filter: blur(4px);
      padding: 50px;
      border-radius: 20px;
      position: relative;
      z-index: 1;
    }
    .ball-svg {
      position: absolute;
      top: 0;
      right: 0;
      animation: bounce 2s infinite ease-in-out;
      transform: scale(1.5);
      opacity:0.3;
      z-index: 1;
    }
    @keyframes bounce {
      0%, 100% { transform: translateY(0) scale(1.5); }
      50% { transform: translateY(-20px) scale(1.5); }
    }
    canvas#graphChart {
      width: 100% !important;
      max-width: 100%;
      height: 350px !important;
      position: relative;
      z-index: 2;
    }
    .dynamic-text span {
      font-weight: bold;
      color: #ffd700;
      display: inline-block;
      min-width: 80px;
      transition: opacity 0.5s ease;
    }
    @media (max-width: 768px) {
      .hero-title { font-size: 2rem; text-align: center; }
      .hero-content { flex-direction: column; text-align: center; }
    }.glow-wrapper {
      position: relative;
      border-radius: 14px;
      overflow: hidden;
      padding: 2px;
      margin-top: 60px;
    }

    .glow-wrapper::before {
      content: '';
      position: absolute;
      width: 200%;
      height: 400%;
      top: -150%;
      left: -50%;
      background: conic-gradient(from 0deg, #f7941d, #fdd835, #f7941d);
      animation: rotateGlow 4s linear infinite;
      z-index: 0;
    }

    .glow-wrapper::after {
      content: '';
      position: absolute;
      top: 4px;
      left: 4px;
      right: 4px;
      bottom: 4px;
      background: white;
      border-radius: 12px;
      z-index: 1;
    }

    @keyframes rotateGlow {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    .glow-content {
      position: relative;
      z-index: 2;
      display: flex;
      justify-content: space-between;
      gap: 10px;
      padding: 24px 20px;
      border-radius: 12px;
    }

    /* Hover Glow on Each Feature Item */
.feature-item {
  flex: 1;
  text-align: center;
  position: relative;
  padding: 0 10px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  border-radius: 8px;
}

.feature-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 0 12px rgba(255, 166, 0, 0.4);
  background: rgba(255, 238, 200, 0.2);
  cursor: pointer;
}

/* Adjust | Separator to work with rounded glow */
.feature-item:not(.last)::after {
  content: '|';
  position: absolute;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
  font-weight: bold;
  color: #ccc;
  font-size: 20px;
  pointer-events: none;
}

/* Add spacing above the CTA button */
.hero-left .btn {
  margin-top: 24px;
}

    /* Responsive */
    @media (max-width: 768px) {
      .glow-content {
        flex-direction: column;
        gap: 20px;
        text-align: center;
      }
    }
    /* Smaller Glow Wrapper */
.glow-wrapper.small-glow {
  margin-top: 20px;
  max-width: 100%;
  border-radius: 12px;
  overflow: hidden;
  padding: 2px;
  height: auto;
}

/* Animate border with visible color motion */
.glow-wrapper.small-glow::before {
  content: '';
  position: absolute;
  width: 200%;
  height: 400%;
  top: -150%;
  left: -50%;
  background: conic-gradient(from 0deg, #ff8800, #fdd835, #ffa500, #ff8800);
  animation: rotateGlow 3s linear infinite;
  z-index: 0;
}

.glow-wrapper.small-glow::after {
  content: '';
  position: absolute;
  top: 3px;
  left: 3px;
  right: 3px;
  bottom: 3px;
  background: white;
  border-radius: 10px;
  z-index: 1;
}

/* Compact Layout */
.glow-content.compact {
  position: relative;
  z-index: 2;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px 14px;
  gap: 10px;
  border-radius: 10px;
}

.feature-item {
  flex: 1;
  text-align: center;
  position: relative;
  padding: 0 10px;
}

.feature-icon {
  width: 50px;
  height: 50px;
  margin-bottom: 6px;
}

.feature-title {
  font-size: 20px;
  font-weight: 600;
  color: #111;
  line-height: 1.2;
}

/* | Separator */
.feature-item:not(.last)::after {
  content: '|';
  position: absolute;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
  font-weight: bold;
  color: #ccc;
  font-size: 20px;
}

/* Animation */
@keyframes rotateGlow {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.fd{
scroll-behavior: smooth;
}
 
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
    margin-top: 210px;
    margin-left: 395px;
    width: 653.375px;
    display: none;
}
/* Search container wrapper styling */
.search-container {
  background-color: #ffffff;
  border-radius: 50px;
  border: 1px solid #dee2e6;
  transition: box-shadow 0.3s ease-in-out;
}

.search-container:focus-within {
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

/* Gradient button style */
.search-btn {
  background: linear-gradient(135deg, #007bff, #0056d2);
  color: white;
  font-size: 16px;
  border: none;
  transition: background 0.3s ease;
}

.search-btn:hover {
  background: linear-gradient(135deg, #0056d2, #0040a3);
  color: #fff;
}

/* Optional: Icon sizing */
.search-btn i {
  font-size: 18px;
}

.fd-card {
  min-height: 260px;
  background: linear-gradient(to right, #e3f2fd, #ffe0b2);
  transition: transform 0.3s ease;
}
.fd-card:hover {
  transform: translateY(-4px);
}
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

       

        
    
    



</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID="hfInputData" runat="server" />

 

<!-- 🟠 START OF HERO SECTION -->
<section class="hero-section" style="background: linear-gradient(to bottom, rgba(0, 85, 140, 0.2), rgba(255, 255, 255, 0.1));">
  <div class="container py-3">

    <!-- 🔍 Search Bar -->
    <div class="row justify-content-center mb-5">
      <div class="col-md-8 col-lg-6">
        <div class="position-relative">
          <!-- Stylish Search Box -->
          <div class="search-container d-flex align-items-center shadow-sm px-2 py-1">
            <asp:TextBox ID="txtResult" runat="server"
              CssClass="form-control border-0 flex-grow-1 px-3 bg-light rounded-start-pill"
              ClientIDMode="Static"
              Style="height: 48px; font-size: 15px;"
              placeholder="🔍 Search For Bonds...">
            </asp:TextBox>

            <asp:LinkButton ID="lnkSerch" runat="server" OnClick="lnkSerch_Click"
              CssClass="btn search-btn rounded-end-pill d-flex align-items-center justify-content-center px-4"
              Style="height: 48px;">
              <i class="fa-solid fa-magnifying-glass text-white"></i>
            </asp:LinkButton>
          </div>
        </div>
      </div>
    </div>

    <!-- 🔥 Hero Content -->
    <div class="hero-content row align-items-start gx-4 gy-4">

      <!-- ✅ LEFT SECTION -->
      <div class="col-md-6 hero-left text-white">
        <!-- Title & Description -->
        <div class="text-left px-2">
          <h1 class="display-5 fw-bold mb-2 text-dark">
            Maximize Your Savings with
            <span class=" fw-bold" style="color:#fe5c36;" id="changing-word">FD</span>
          </h1>
          <p class="lead fw-medium mb-3 text-dark">
            Invest in top-rated <span id="product-label" class="fw-bold " style="color:#fe5c36;">Fixed Deposits</span> and earn
            <span class="fw-bold " style="color:#fe5c36;">Decent</span> returns. <br />
            <span class="text-dark">Fully digital, secure & hassle-free.</span>
          </p>
        </div>

       <!-- Feature Highlights (Responsive Bootstrap) -->
<div class="container">
  <div class="row justify-content-center text-center text-white g-3 px-2">
    
    <div class="col-6 col-sm-4 col-md-3">
      <div class="feature-item">
        <img src="https://img.icons8.com/fluency/30/percentage.png" alt="returns" class="feature-icon mb-1" />
        <p class="feature-title mb-0 fw-medium">Upto 14%<br>Returns</p>
      </div>
    </div>

    <div class="col-6 col-sm-4 col-md-3">
      <div class="feature-item">
        <img src="https://img.icons8.com/fluency/30/combo-chart.png" alt="stable" class="feature-icon mb-1" />
        <p class="feature-title mb-0 fw-medium">Stable<br>Returns</p>
      </div>
    </div>

    <div class="col-6 col-sm-4 col-md-3">
      <div class="feature-item">
        <img src="https://img.icons8.com/fluency/30/conference-call.png" alt="users" class="feature-icon mb-1" />
        <p class="feature-title mb-0 fw-medium">10k+<br>Visitors</p>
      </div>
    </div>

    <div class="col-6 col-sm-4 col-md-3">
      <div class="feature-item">
        <img src="https://img.icons8.com/fluency/30/rupee.png" alt="min invest" class="feature-icon mb-1" />
        <p class="feature-title mb-0 fw-medium">Minimum<br>Investment 10K</p>
      </div>
    </div>

  </div>
</div>

        <!-- CTA Button -->
        <div class="mt-3 px-2">
          <a href="OurCollections.aspx" class="btn btn-warning fw-bold rounded-pill px-4 py-2">
            <i class="fa-solid fa-arrow-up-right-from-square me-2"></i> Start Investing
          </a>
        </div>
      </div>

      <!-- ✅ RIGHT SECTION -->
      <div class="col-md-6 hero-right text-center">
        <svg class="ball-svg mb-3" id="ballSvg" width="190" height="300" viewBox="0 0 400 400" fill="none">
          <circle cx="200" cy="200" r="200" fill="#000" />
        </svg>
        <div class="graph-container">
          <canvas id="graphChart" width="1000" height="1000"></canvas>

        </div>
      </div>

    </div>
  </div>
</section>
<!-- 🔚 END HERO SECTION -->


   

<section class="collection-section py-2 position-relative overflow-hidden">
  <!-- Optional Sparkle Background -->
  <div class="container ">
    <div class="row g-4 justify-content-center">
  <section class="py-3" style="background-color: #00558C; border-radius: 24px 24px 0 0;">
  <div class="container py-2">
    <h3 class="fw-bold mb-3 text-start text-white text-center" data-aos="fade-up"
        style="font-size: 2.2rem; line-height: 1.2; text-shadow: 0 0 6px rgba(255,255,255,0.3), 0 0 12px rgba(255,255,255,0.2), 0 0 20px rgba(255,255,255,0.1);">
      Our <span style="color: #F15A29; font-weight: 700;">Products</span>
    </h3>
  </div>
</section>




      <!-- 8 Product Cards -->
      <!-- CARD 1 -->
      <div class="col-lg-3 col-md-6 d-flex">
        <div class="w-100 p-4 rounded-4 shadow text-center"
             style="background: linear-gradient(to right, #e3f2fd, #ffe0b2);">
          <div class="badge bg-warning text-dark mb-3">Top Rated</div>
          <i class="bi bi-graph-up" style="font-size: 2rem; color: #003366;"></i>
          <h5 class="fw-bold mt-3">High Return Bonds</h5>
          <a href="OurCollections?oId=16" class="btn mt-3"
             style="background: #003366; color: white; border-radius: 30px; padding: 6px 20px;">Explore</a>
        </div>
      </div>

      <!-- CARD 2 -->
      <div class="col-lg-3 col-md-6 d-flex">
        <div class="w-100 p-4 rounded-4 shadow text-center"
             style="background: linear-gradient(to right, #e3f2fd, #ffe0b2);">
          <div class="badge bg-success mb-3">New</div>
          <i class="bi bi-stars" style="font-size: 2rem; color: #003366;"></i>
          <h5 class="fw-bold mt-3">Monthly Income Bonds</h5>
          <a href="OurCollections?oId=13" class="btn mt-3"
             style="background: #003366; color: white; border-radius: 30px; padding: 6px 20px;">Explore</a>
        </div>
      </div>

      <!-- CARD 3 -->
      <div class="col-lg-3 col-md-6 d-flex">
        <div class="w-100 p-4 rounded-4 shadow text-center"
             style="background: linear-gradient(to right, #e3f2fd, #ffe0b2);">
          <div class="badge bg-info text-dark mb-3">Popular</div>
          <i class="bi bi-bank" style="font-size: 2rem; color: #003366;"></i>
          <h5 class="fw-bold mt-3">Bank/PSU/PVT Bonds</h5>
          <a href="OurCollections?oId=26" class="btn mt-3"
             style="background: #003366; color: white; border-radius: 30px; padding: 6px 20px;">Explore</a>
        </div>
      </div>

      <!-- CARD 4 -->
      <div class="col-lg-3 col-md-6 d-flex">
        <div class="w-100 p-4 rounded-4 shadow text-center"
             style="background: linear-gradient(to right, #e3f2fd, #ffe0b2);">
          <div class="badge bg-danger mb-3">Govt</div>
          <i class="bi bi-building" style="font-size: 2rem; color: #003366;"></i>
          <h5 class="fw-bold mt-3">Public Sector Bonds</h5>
          <a href="OurCollections?oId=33" class="btn mt-3"
             style="background: #003366; color: white; border-radius: 30px; padding: 6px 20px;">Explore</a>
        </div>
      </div>

      <!-- CARD 5 -->
      <div class="col-lg-3 col-md-6 d-flex">
        <div class="w-100 p-4 rounded-4 shadow text-center"
             style="background: linear-gradient(to right, #e3f2fd, #ffe0b2);">
          <div class="badge bg-primary mb-3">Secure</div>
          <i class="bi bi-shield-lock" style="font-size: 2rem; color: #003366;"></i>
          <h5 class="fw-bold mt-3">Sovereign Rated Bonds</h5>
          <a href="OurCollections?oId=28" class="btn mt-3"
             style="background: #003366; color: white; border-radius: 30px; padding: 6px 20px;">Explore</a>
        </div>
      </div>

      <!-- CARD 6 -->
      <div class="col-lg-3 col-md-6 d-flex">
        <div class="w-100 p-4 rounded-4 shadow text-center"
             style="background: linear-gradient(to right, #e3f2fd, #ffe0b2);">
          <div class="badge bg-secondary mb-3">Tax Free</div>
          <i class="bi bi-cash-coin" style="font-size: 2rem; color: #003366;"></i>
          <h5 class="fw-bold mt-3">Tax Free Bonds</h5>
          <a href="OurCollections?oId=17" class="btn mt-3"
             style="background: #003366; color: white; border-radius: 30px; padding: 6px 20px;">Explore</a>
        </div>
      </div>

      <!-- CARD 7 -->
      <div class="col-lg-3 col-md-6 d-flex">
        <div class="w-100 p-4 rounded-4 shadow text-center"
             style="background: linear-gradient(to right, #e3f2fd, #ffe0b2);">
          <div class="badge bg-dark mb-3">54EC</div>
          <i class="bi bi-box-seam" style="font-size: 2rem; color: #ffffff;"></i>
          <h5 class="fw-bold mt-3">Capital Gain Bonds (54EC)</h5>
          <a href="OurCollections?oId=27" class="btn mt-3"
             style="background: #003366; color: white; border-radius: 30px; padding: 6px 20px;">Explore</a>
        </div>
      </div>

      <!-- CARD 8 -->
      <div class="col-lg-3 col-md-6 d-flex">
        <div class="w-100 p-4 rounded-4 shadow text-center"
             style="background: linear-gradient(to right, #e3f2fd, #ffe0b2);">
          <div class="badge bg-warning text-dark mb-3">FD</div>
          <i class="bi bi-piggy-bank" style="font-size: 2rem; color: #003366;"></i>
          <h5 class="fw-bold mt-3">Fixed Deposit</h5>
          <a href="#fd-section"  class="btn mt-3 fd "
             style="background: #003366; color: white; border-radius: 30px; padding: 6px 20px;">Explore</a>
        </div>
      </div>

    </div>
  </div>
</section>













   
   <!-- High Yield Bonds Section --><!-- High Yield Bonds Section -->
<!-- Swiper CSS -->


<section class="py-5 bg-light position-relative overflow-hidden">
  <div class="container">
         <section class="py-3" style="background-color: #00558C; border-radius: 24px 24px 0 0;">
  <div class="container py-2">
    <h3 class="fw-bold mb-3 text-start text-white text-center" data-aos="fade-up"
        style="font-size: 2.2rem; line-height: 1.2; text-shadow: 0 0 6px rgba(255,255,255,0.3), 0 0 12px rgba(255,255,255,0.2), 0 0 20px rgba(255,255,255,0.1);">
      High Yield Bonds <span style="color: #F15A29; font-weight: 700;">Above 14%</span>
    </h3>
  </div>
</section>

 

    <!-- Swiper -->
    <div class="swiper mySwiper mt-4">
      <div class="swiper-wrapper" id="bond-list">
        <!-- Slides will be inserted here dynamically -->
      </div>
    </div>
  </div>

  <!-- Swiper JS -->
  

  
</section>



<section class="products-fd-section py-5" id="fd-section">
  <div class="container">

    <!-- Section Heading -->
    <div class="py-3 px-2" style="background-color: #00558C; border-radius: 24px 24px 0 0;">
      <h3 class="fw-bold mb-2 text-white text-center" data-aos="fade-up"
          style="font-size: 2.2rem; line-height: 1.2; text-shadow: 0 0 6px rgba(255,255,255,0.3), 0 0 12px rgba(255,255,255,0.2), 0 0 20px rgba(255,255,255,0.1);">
        High Yield FD <span style="color: #F15A29; font-weight: 700;">Above 13%</span>
      </h3>
    </div>

    <!-- FD Cards Swiper -->
    <div class="my-4">
      <div class="swiper fd-swiper">
        <div class="swiper-wrapper">

      <!-- FD CARD 1: Shriram -->
<div class="swiper-slide">
  <div class="fd-card bg-white text-center p-3 rounded-4 shadow h-100 d-flex flex-column justify-content-between" style="min-height: 360px;">
    <div>
      <img src="https://cdn.shriramfinance.in/sfl-fe/assets/images/sfl-logo.webp" alt="Shriram" class="img-fluid mb-3" style="height: 40px;">
      <h5 class="fw-bold mb-1">Shriram Finance</h5>
      <span class="badge bg-danger fw-bold mb-2">8.55%</span>
      <p class="text-muted small mb-1">Empower Your Financial Future with Shriram Finance</p>
      <p class="text-muted small mb-0">(Incl. 0.50% p.a. for Seniors & 0.05% for Women)<br><small>**T&C Apply</small></p>
    </div>
    <div class="d-flex justify-content-between gap-2 mt-3">
      <a href="/Fdmodule.aspx" target="_blank" class="btn btn-sm btn-primary text-white fw-semibold flex-fill rounded-pill">
        <i class="bi bi-cart-fill me-1"></i> Buy
      </a>
      <button onclick="shareFD('Shriram Finance','8.55%','Fdmodule.aspx')" class="btn btn-sm btn-outline-primary fw-semibold flex-fill rounded-pill">
        <i class="bi bi-share-fill me-1"></i> Share
      </button>
    </div>
  </div>
</div>

<!-- FD CARD 2: PNB -->
<div class="swiper-slide">
  <div class="fd-card bg-white text-center p-3 rounded-4 shadow h-100 d-flex flex-column justify-content-between" style="min-height: 360px;">
    <div>
      <img src="https://www.pnbhousing.com/documents/d/guest/logo-header?download=true" alt="PNB" class="img-fluid mb-3" style="height: 40px;">
      <h5 class="fw-bold mb-1">PNB Housing</h5>
      <span class="badge bg-danger fw-bold mb-2">7.10%</span>
      <p class="text-muted small mb-0">Ghar ki Baat</p>
    </div>
    <div class="d-flex justify-content-between gap-2 mt-3">
      <a href="/Fdmodule.aspx" target="_blank" class="btn btn-sm btn-primary text-white fw-semibold flex-fill rounded-pill">
        <i class="bi bi-cart-fill me-1"></i> Buy
      </a>
      <button onclick="shareFD('PNB Housing','7.10%','Fdmodule.aspx')" class="btn btn-sm btn-outline-primary fw-semibold flex-fill rounded-pill">
        <i class="bi bi-share-fill me-1"></i> Share
      </button>
    </div>
  </div>
</div>

<!-- FD CARD 3: Bajaj -->
<div class="swiper-slide">
  <div class="fd-card bg-white text-center p-3 rounded-4 shadow h-100 d-flex flex-column justify-content-between" style="min-height: 360px;">
    <div>
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIi0Lufh2ybEC5od_gdVgJ0V_YN67KUPh4Ww&s" alt="Bajaj" class="img-fluid mb-3" style="height: 40px;">
      <h5 class="fw-bold mb-1">Bajaj Finance</h5>
      <span class="badge bg-danger fw-bold mb-2">7.30%</span>
      <p class="text-muted small mb-1">Maximising your savings potential with stable returns</p>
      <p class="text-muted small mb-0">Higher returns for 24–60 month tenure<br>0.35% extra for seniors<br><small>**T&C Apply</small></p>
    </div>
    <div class="d-flex justify-content-between gap-2 mt-3">
      <a href="/Fdmodule.aspx" target="_blank" class="btn btn-sm btn-primary text-white fw-semibold flex-fill rounded-pill">
        <i class="bi bi-cart-fill me-1"></i> Buy
      </a>
      <button onclick="shareFD('Bajaj Finance','7.30%','Fdmodule.aspx')" class="btn btn-sm btn-outline-primary fw-semibold flex-fill rounded-pill">
        <i class="bi bi-share-fill me-1"></i> Share
      </button>
    </div>
  </div>
</div>

<!-- FD CARD 4: LIC -->
<div class="swiper-slide">
  <div class="fd-card bg-white text-center p-3 rounded-4 shadow h-100 d-flex flex-column justify-content-between" style="min-height: 360px;">
    <div>
      <img src="https://f2.leadsquaredcdn.com/t/lichousing/content/common/images/LIC_Housing_Finance_logo.png" alt="LIC" class="img-fluid mb-3" style="height: 40px;">
      <h5 class="fw-bold mb-1">LIC Housing</h5>
      <span class="badge bg-danger fw-bold mb-2">7.15%</span>
      <p class="text-muted small mb-1">“SANCHAY” – a deposit scheme by LIC Housing Finance</p>
      <p class="text-muted small mb-0">Additional 0.25% for senior citizens<br><small>**T&C Apply</small></p>
    </div>
    <div class="d-flex justify-content-between gap-2 mt-3">
      <a href="/Fdmodule.aspx" target="_blank" class="btn btn-sm btn-primary text-white fw-semibold flex-fill rounded-pill">
        <i class="bi bi-cart-fill me-1"></i> Buy
      </a>
      <button onclick="shareFD('LIC Housing','7.15%','Fdmodule.aspx')" class="btn btn-sm btn-outline-primary fw-semibold flex-fill rounded-pill">
        <i class="bi bi-share-fill me-1"></i> Share
      </button>
    </div>
  </div>
</div>

        </div>
      </div>

        </div> <!-- .swiper-wrapper -->
      </div> <!-- .swiper -->
    </div> <!-- .my-4 -->

  </div> <!-- .container -->
</section>









    <section >
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
                                         
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>

            </div>
           
        </div>
    </section>
 




    <section class="video-home py-md-5 py-4 collection" style="background: linear-gradient(to bottom, #ffffff, #00354D);" >
        <div class="container">
            <div class="row py-md-5 ">
                <div class="col-lg-7 py-md-4 py-5">
                    <div id="tab-1" class="tab-content active">
                       <img src="img/Group%201000002009%20(3).png" class="col-12" alt srcset />
                    </div>
                    <div id="tab-2" class="tab-content">
                       <img src="img/Group%201000002009%20(2).png" class="col-12" alt srcset />
                    </div>

                    <div id="tab-3" class="tab-content">
                        <img src="img/Group%201000002009%20(1).png" class="col-12" alt srcset />
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

    
    <!-- Testimonials Section -->
<section class="testimonials py-5" style="background: linear-gradient(to bottom, #e0e0e0 0%, #ffffff 100%)">
  <div class="container">
    <div class="text-center mb-5">
                 <section class="py-3" style="background-color: #00558C; border-radius: 24px 24px 0 0;">
  <div class="container py-2">
    <h3 class="fw-bold mb-2 text-start text-white text-center" data-aos="fade-up"
        style="font-size: 2.2rem; line-height: 1.2; text-shadow: 0 0 6px rgba(255,255,255,0.3), 0 0 12px rgba(255,255,255,0.2), 0 0 20px rgba(255,255,255,0.1);">
      What Our <span style="color: #F15A29; font-weight: 700;">Investors Say</span>
    </h3>
    <p class="text-light mb-0 text-center" style="font-size: 1rem;">Trusted by thousands of happy investors across India</p>
  </div>
</section>

  

      <%--<h4 class="fw-bold mb-4 text-start heading-glow text-center" data-aos="fade-up">
   What Our  <span class="text-highlight-orange">Investors Say</span>
  </h4>--%>
      
    </div>

    <div class="row">
      <div class="col-12">
        <div id="customers-testimonials" class="owl-carousel">

          <!-- Testimonial 1 -->
          <div class="item">
            <div class="shadow-effect">
              <p>Bonds Adda made investing in government bonds extremely simple. Highly recommended!</p>
              <div class="testimonial-name">ARJUN SHARMA</div>
            </div>
          </div>

          <!-- Testimonial 2 -->
          <div class="item">
            <div class="shadow-effect">
              <p>I diversified into PSU and tax-free bonds seamlessly. The support team was very helpful.</p>
              <div class="testimonial-name">PRIYA MEHTA</div>
            </div>
          </div>

          <!-- Testimonial 3 -->
          <div class="item">
            <div class="shadow-effect">
              <p>Great UI and real-time data—made tracking my high-yield bond portfolio a breeze.</p>
              <div class="testimonial-name">ROHIT VERMA</div>
            </div>
          </div>

          <!-- Testimonial 4 -->
          <div class="item">
            <div class="shadow-effect">
              <p>My go-to platform for sovereign-rated bonds—secure, transparent, and user‑friendly.</p>
              <div class="testimonial-name">SONAL GUPTA</div>
            </div>
          </div>

          <!-- Testimonial 5 -->
          <div class="item">
            <div class="shadow-effect">
              <p>Fantastic experience! Bonds Adda’s hand‑holding on KYC and documentation was top‑notch.</p>
              <div class="testimonial-name">VIKRAM SINGH</div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
</section>







   <section class="home-blog py-md-5 py-4">
  <div class="container">
    <!-- Section Heading -->
    <div class="row py-md-5">
      <div class="col-12">
                          <section class="py-3" style="background-color: #00558C; border-radius: 24px 24px 0 0;">
  <div class="container py-2">
    <h3 class="fw-bold mb-2 text-start text-white text-center" data-aos="fade-up"
        style="font-size: 2.2rem; line-height: 1.2; text-shadow: 0 0 6px rgba(255,255,255,0.3), 0 0 12px rgba(255,255,255,0.2), 0 0 20px rgba(255,255,255,0.1);">
      Latest <span style="color: #F15A29; font-weight: 700;">News</span>
    </h3>
  </div>
</section>

        

    <!-- News Cards -->
    <div class="row g-4 mt-3">
      <asp:Repeater ID="rptNews" runat="server">
        <ItemTemplate>
          <div class="col-md-6 col-lg-4 d-flex">
            <div class="box bg-white rounded shadow-sm h-100 w-100 d-flex flex-column border border-light-subtle">
              
              <!-- Blog Image -->
              <img src='<%# ResolveUrl(Eval("BlogImage").ToString().Replace("~", "")) %>'
                   alt="Blog Image"
                   class="img-fluid rounded-top"
                   style="height: 180px; object-fit: cover;" />

              <!-- Blog Details -->
              <div class="details p-3 d-flex flex-column justify-content-between flex-grow-1">
                <div>
                  <small class="text-danger d-block mb-2">
                    <strong>Date:</strong> <%# Eval("BlogDate", "{0:dd MMM yyyy}") %> |
                    <strong>Author:</strong> <%# Eval("AuthorBy") %>
                  </small>

                  <h4 class="h6 text-dark mb-2">
                    <%# Eval("BlogTitle") %>: <%# Eval("BlogSubTitle") %>
                  </h4>

                  <p class="text-muted small mb-3">
                    <%# Eval("MetaDescription") %>
                  </p>
                </div>

                <div>
                  <a href='<%# "BlogNewsDetails?oId=" + Eval("BlogId") %>' class="text-primary fw-bold">
                    Read More →
                  </a>
                </div>
              </div>

            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>
    </div>
  </div>
</section>

   <section class="subscribe py-5" style="background: #1f3c88; color: #fff;">
  <div class="container">
    <div class="row justify-content-center text-center">
      <div class="col-lg-8">
        <h2 class="fw-bold mb-3">📬 Subscribe to our <span style="color: #ffcb05;">Newsletter</span></h2>
        <p class="mb-4">DON’T FALL BEHIND. Stay current with a recap of today’s computing news from Digital Trend — by <strong>Bonds Adda</strong>.</p>

        <asp:UpdatePanel ID="uPanel" runat="server">
          <ContentTemplate>
            <div class="input-group shadow-lg">
              <asp:TextBox ID="txtEmail" runat="server" class="form-control form-control-lg border-0" placeholder="Enter your Email Address" />
              <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe Now" class="btn btn-warning btn-lg px-4 fw-semibold" OnClick="btnSubscribe_Click" />
            </div>
          </ContentTemplate>
        </asp:UpdatePanel>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function () {
  const wordEl = document.getElementById("changing-word");
  const labelEl = document.getElementById("product-label");
  const chartCtx = document.getElementById("graphChart").getContext("2d");
  const ballSvg = document.getElementById("ballSvg").querySelector("circle");

  let index = 0;
  const words = ["FD", "Bonds"];

  const colors = {
    "FD": "#003366",     // Dark Blue
    "Bonds": "#c04d00",  // Dark Orange
  };

  const chartData = {
    "FD": {
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
      datasets: [{
        label: 'FD Growth',
        data: [6.5, 7, 7.6, 8.3, 9,11],
        borderColor: colors.FD,
        borderWidth: 3,
        fill: false,
        tension: 0.6
      }]
    },
    "Bonds": {
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
      datasets: [{
        label: 'Bond Yield',
        data: [9.8, 10.2, 10.6, 11.2, 11.9,14],
        borderColor: colors.Bonds,
        borderWidth: 3,
        fill: false,
        tension: 0.7
      }]
    },
  };

  let chartInstance;

  function renderChart(type) {
    if (chartInstance) chartInstance.destroy();
    chartInstance = new Chart(chartCtx, {
      type: 'line',
        data: chartData[type],
        layout: {
            padding: 10 // ✅ Correct way to add padding (number, no 'px')
        },
      options: {
        responsive: true,
        plugins: {
          legend: {
            labels: {
              color: '#640D5F',
              font: { weight: 'bold', size: 16 }
            }
          }
        },
        scales: {
          x: {
            title: {
              display: true,
              text: 'Months',
              color: '#333',
              font: {
                size: 15,
                weight: 'bold'
              }
            },
            ticks: {
              color: '#333', // Dark shiny text
              font: {
                weight: 'bold'
              }
            },
            grid: {
              color: 'rgba(80, 80, 80, 1)' // Shiny dark grid lines
            }
          },
          y: {
            title: {
              display: true,
              text: 'Yield %',
              color: '#333',
              font: {
                size: 15,
                weight: 'bold'
              }
            },
            ticks: {
              color: '#333', // Dark shiny text
              font: {
                weight: 'bold'
              }
            },
            grid: {
              color: 'rgba(80, 80, 80, 4)' // Shiny dark grid lines
            
            }
          }
        }
      }
    });
  }

  // Initial render
  renderChart("FD");

  setInterval(() => {
    index = (index + 1) % words.length;
    wordEl.style.opacity = 0;
    setTimeout(() => {
      const newWord = words[index];
      wordEl.textContent = newWord;
      labelEl.textContent = newWord;
      ballSvg.setAttribute("fill", colors[newWord]);
      wordEl.style.opacity = 1;
      renderChart(newWord);
    }, 300);
  }, 2500);
});

        const bondsData = [
      {
        "Company": "VEDIKA CREDIT CAPITAL LIMITED",
        "Face Value": "₹100000",
        "ISIN No": "INE04HY07289",
        "Credit Rating": "A-",
        "Coupon Rate": "12.00%",
        "Rate": "₹ 35.54",
        "Rating Agencies": "CARE",
        "IP Frequency": "Monthly",
        "Last Interest Payment Date": "04/04/2023",
        "Maturity Date": "04/04/2029",
        "Guaranteed By": "N/A",
        "Instrument Type": "SECURED",
        "Type of Bonds": "High Return Bonds",
        "Redemption Type": "Bullet Redemption",
        "Buy Now URL": "https://bondsadda.com/cashflow?oid=4892",
        "Image": "https://bondsadda.com/vimage/88108team_vedika_logo.jpeg"
      },
      {
        "Company": "EarlySalary Services Pvt Ltd",
        "Face Value": "₹100000",
        "ISIN No": "INE01I0743Z4",
        "Credit Rating": "BBB+",
        "Coupon Rate": "10.30%",
        "Rate": "₹ 38.23",
        "Rating Agencies": "CRISIL",
        "IP Frequency": "Monthly",
        "Last Interest Payment Date": "04/10/2027",
        "Maturity Date": "04/10/2027",
        "Guaranteed By": "Social Worth Technologies Private Limited",
        "Instrument Type": "SECURED",
        "Type of Bonds": "High Return Bonds",
        "Redemption Type": "Bullet Redemption",
        "Buy Now URL": "https://bondsadda.com/cashflow?oid=4855",
        "Image": "https://bondsadda.com/vimage/73786earlysalary.webp"
      },
      {
        "Company": "INDEL MONEY LIMITED",
        "Face Value": "₹100000",
        "ISIN No": "INE08US08G9",
        "Credit Rating": "BBB- BBB",
        "Coupon Rate": "11.00%",
        "Rate": "₹ 37.31",
        "Rating Agencies": "CRISIL",
        "IP Frequency": "Monthly",
        "Last Interest Payment Date": "11/11/2026",
        "Maturity Date": "11/11/2026",
        "Guaranteed By": "N/A",
        "Instrument Type": "SECURED",
        "Type of Bonds": "High Return Bonds",
        "Redemption Type": "Bullet Redemption",
        "Buy Now URL": "https://bondsadda.com/cashflow?oid=4849",
        "Image": "https://bondsadda.com/vimage/95068indelmoney_logo.jpeg"
      },
      {
        "Company": "KEERTANA FINSERY PRIVATE LIMITED",
        "Face Value": "₹100000",
        "ISIN No": "INE0NFS01626",
        "Credit Rating": "BBB- BBB",
        "Coupon Rate": "11.30%",
        "Rate": "₹ 37.18",
        "Rating Agencies": "CRISIL ICRA IND",
        "IP Frequency": "Monthly",
        "Last Interest Payment Date": "06/03/2027",
        "Maturity Date": "06/03/2027",
        "Guaranteed By": "N/A",
        "Instrument Type": "SECURED",
        "Type of Bonds": "High Return Bonds",
        "Redemption Type": "Bullet Redemption",
        "Buy Now URL": "https://bondsadda.com/cashflow?oid=4862",
        "Image": "https://bondsadda.com/vimage/47714keertana.png"
      },
      {
        "Company": "RDC CONCRETE(INDIA) LIMITED",
        "Face Value": "₹100000",
        "ISIN No": "INE067I07020",
        "Credit Rating": "A-",
        "Coupon Rate": "11.00%",
        "Rate": "₹ 37",
        "Rating Agencies": "IND",
        "IP Frequency": "Monthly",
        "Last Interest Payment Date": "12/03/2028",
        "Maturity Date": "12/03/2028",
        "Guaranteed By": "Robu Sildem Private Limited & Halls Infra Market Limited",
        "Instrument Type": "SECURED",
        "Type of Bonds": "High Return Bonds",
        "Redemption Type": "Bullet Redemption",
        "Buy Now URL": "https://bondsadda.com/cashflow?oid=4878",
        "Image": "	https://bondsadda.com/vimage/24414rdc%20concrete(india)%20limited.jpeg"
      }
    ];

    const bondList = document.getElementById('bond-list');

    bondsData.forEach(bond => {
      const slide = document.createElement("div");
      slide.className = "swiper-slide";

      slide.innerHTML = `
        <div class="bond-card w-100 p-3 shadow-sm border border-2 border-primary rounded-4">
  <div>
    <!-- Image -->
    <img src="${bond.Image}" alt="${bond.Company}" class="w-40 mb-3 rounded-3" style="height:150px; object-fit: cover;" />

    <!-- Badge -->
    <div class="bond-badge fw-bold text-uppercase text-dark bg-warning px-3 py-1 rounded-pill mb-2 d-inline-block">
      ${bond["Type of Bonds"]}
    </div>

    <!-- Company Title -->
    <h5 class="bond-title fw-bold mb-2 text-dark">${bond.Company}</h5>

    <hr class="my-2">

    <!-- Bond Info -->
    <div class="bond-info mt-2 text-dark">
      <p class="mb-2 fw-bold"><i class="bi bi-percent me-2 text-primary fw-bold"></i>Coupon Rate: <span class="fw-bold">${bond["Coupon Rate"]}</span></p>
      <p class="mb-2 fw-bold"><i class="bi bi-calendar3 me-2 text-primary fw-bold"></i>Maturity: <span class="fw-bold">${bond["Maturity Date"]}</span></p>
      <p class="mb-2 fw-bold"><i class="bi bi-bank me-2 text-primary fw-bold"></i>Credit Rating: <span class="fw-bold">${bond["Credit Rating"]}</span></p>
      <p class="mb-2 fw-bold"><i class="bi bi-lock me-2 text-primary fw-bold"></i>Instrument: <span class="fw-bold">${bond["Instrument Type"]}</span></p>
      <p class="mb-0 fw-bold"><i class="bi bi-code-slash me-2 text-primary fw-bold"></i>ISIN: <span class="fw-bold">${bond["ISIN No"]}</span></p>
    </div>
  </div>

  <!-- Action Buttons -->
  <div class="d-flex mt-4">
    <a href="${bond['Buy Now URL']}" class="btn btn-primary fw-bold px-4 rounded-pill" target="_blank">
      Buy Now
    </a>
    <button class="btn btn-outline-primary fw-bold ms-3 px-4 rounded-pill" onclick="shareBond('${bond.Company}', '${bond["Credit Rating"]}')">
      <i class="bi bi-share-fill me-1"></i> Share
    </button>
  </div>
</div>

      `;

      bondList.appendChild(slide);
    });

    function shareBond(company, rating) {
      const text = `${company} - Rating: ${rating}`;
      const shareData = {
        title: company,
        text: text,
        url: window.location.href
      };

      if (navigator.share) {
        navigator.share(shareData).catch((err) => console.error("Share failed:", err));
      } else {
        navigator.clipboard.writeText(`${text}\n${window.location.href}`).then(() => {
          alert("Bond info copied to clipboard!");
        });
      }
    }

    new Swiper('.mySwiper', {
      slidesPerView: 1,
      spaceBetween: 20,
      loop: true,
      autoplay: {
        delay: 3000,
      },
      breakpoints: {
        576: { slidesPerView: 1.2 },
        768: { slidesPerView: 2 },
        992: { slidesPerView: 3 },
      },
    });

    AOS.init();
VanillaTilt.init(document.querySelectorAll("[data-tilt]"), {
  max: 15,
  speed: 400,
  glare: true,
  "max-glare": 0.2
});

 $(document).ready(function () {
   $('#customers-testimonials').owlCarousel({
     loop: true,
     center: true,
     items: 3,
     margin: 0,
     autoplay: true,
     dots: true,
     autoplayTimeout: 6000,
     smartSpeed: 600,
     responsive: {
       0: { items: 1 },
       768: { items: 2 },
       1170: { items: 3 }
     }
   });
 });

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
  }
});
 function shareFD(name, rate, url) {
   const text = `🔥 Check out this Fixed Deposit offer from ${name} at ${rate} interest!\nApply here: ${url}`;
   if (navigator.share) {
     navigator.share({
       title: `${name} FD Offer`,
       text: text,
       url: url
     }).catch(err => console.log('Share failed:', err));
   } else {
     navigator.clipboard.writeText(text);
     alert("FD details copied! Share it anywhere.");
   }
 }
  </script>
</asp:Content>

 
