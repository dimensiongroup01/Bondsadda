 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="BSE_INTEGRATION_Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - BSE API</title>
  
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
    /* Media Queries for specific adjustments */
    @media (max-width: 768px) {
        .card {
            margin-bottom: 20px;
        }
        .box {
            max-width: 280px;  /* Smaller box size for mobile */
        }
    }

    .whatsapp-btn {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #25d366;
        color: white;
        padding: 15px 20px;
        border-radius: 50%;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        font-size: 24px;
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 1000;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .whatsapp-btn:hover {
        background-color: #128c7e;
    }

    .container-fluid {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0;
    }

    .content-wrapper {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 80%;
        height: 60%;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
        overflow: hidden;
        padding: 20px;
    }

    .left-section, .right-section {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .right-section {
        position: relative;
    }

    .video-container {
        position: relative;
        width: 90%;
        padding-top: 90%;  /* 1:1 Aspect Ratio (Square) */
        background-color: #333;
        border-radius: 10px;
        overflow: hidden;
    }
    .video-container iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
    }

    .button-container {
        max-width: 250px;
        text-align: center;
    }
    .button-container button {
        padding: 15px 25px;
        font-size: 18px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 8px;
        transition: background-color 0.3s;
    }
    .button-container button:hover {
        background-color: #0056b3;
    }

    /* Gradient Background for Cards */
    .home-page-investment-option {
        padding: 50px 0;
    }

    .color1 {
        color: #333;
    }
    .color2 {
        color: #ad5a3b;
    }

    .bgfirst {
        background: linear-gradient(90deg, rgba(174,225,238,1) 0%, rgba(80,195,169,1) 55%);
    }
    .bgsecond {
        background: linear-gradient(90deg, rgba(237,136,108,1) 0%, rgba(241,132,81,0.678) 55%);
    }
    .bgthree {
        background: linear-gradient(90deg, rgba(206,235,96,1) 0%, rgba(159,230,151,0.678) 55%);
    }
    .bgfourth {
        background: linear-gradient(90deg, rgba(231,174,240,1) 0%, rgba(167,150,235,0.678) 55%);
    }
    .bgfifith {
        background: linear-gradient(90deg, rgba(31,205,130,1) 0%, rgba(184,245,239,0.678) 55%);
    }
    .bgsix {
        background: linear-gradient(90deg, rgba(205,189,31,1) 0%, rgba(219,215,61,0.678) 55%);
    }
    .bgseven {
        background: linear-gradient(90deg, rgba(232,133,238,1) 0%, rgba(228,86,148,0.678) 55%);
    }
    .bgeight {
        background: #abbaab;   /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #ffffff, #abbaab);   /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #ffffff, #abbaab);  /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    }

    /* Collection Section */
    .collection {
        padding-top: 5rem;
        padding-bottom: 5rem;
    }
    .collection h2 {
        font-size: 2rem;
        color: white;
        text-transform: uppercase;
    }
    .collection h2 .text-warning {
        color: #FFA500;  /* Orange color */
    }

    /* Box Styling */
    .box {
        background-color: #333;  /* Dark background */
        padding: 1.5rem;
        border-radius: 8px;
        margin: 1rem 0;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
        text-align: center;
        max-width: 300px;  /* Smaller box width */
        margin: 0 auto;
    }
    .box:hover {
        transform: translateY(-10px);
    }
    .box .content p {
        font-size: 1rem;
        color: #ddd;
    }
    .box .btn {
        background-color: #333;
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
        margin-top: 1rem;
        transition: background-color 0.3s ease;
    }
    .box .btn:hover {
        background-color: #FF8C00;  /* Slightly darker orange on hover */
    }
    .box i {
        font-size: 2.5rem;
        color: #FFA500;  /* Orange color */
        margin-bottom: 1rem;
    }

    /* Container & Grid */
    .container {
        max-width: 85%;  /* Ensuring container not too wide */
        margin: 0 auto;
    }
    .row {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }
    .col-lg-3,
    .col-md-4,
    .col-12 {
        display: flex;
        justify-content: center;
    }

    /* New CSS */
    .box-style {
        background: #ffffff;
        border-radius: 20px;
        padding: 30px 25px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        transition: all 0.4s ease;
        text-align: center;
        position: relative;
        overflow: hidden;
        margin-bottom: 30px;
    }
    .box-style::before {
        content: '';
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: linear-gradient(120deg, #007bff, #00c6ff);
        transform: rotate(45deg);
        z-index: 0;
        opacity: 0;
        transition: opacity 0.4s ease;
    }
    .box-style:hover::before {
        opacity: 0.07;
    }
    .box-style i {
        font-size: 3rem;
        color: #007bff;
        margin-bottom: 15px;
        z-index: 1;
        position: relative;
    }
    .box-style h2 {
        font-size: 1.6rem;
        color: #333;
        margin-bottom: 12px;
        font-weight: 600;
        z-index: 1;
        position: relative;
    }
    .box-style .content p {
        font-size: 0.95rem;
        color: #555;
        line-height: 1.6;
        z-index: 1;
        position: relative;
    }
    .box-style .btn {
        margin-top: 20px;
        padding: 10px 25px;
        border-radius: 30px;
        background: linear-gradient(135deg, #007bff, #00bcd4);
        color: #fff;
        border: none;
        font-weight: 500;
        text-decoration: none;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        display: inline-block;
        z-index: 1;
        position: relative;
    }
    .box-style .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 15px rgba(0, 123, 255, 0.3);
    }

    .gold {
        color: #DAA520;
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
    .rotating-tagline {
        font-size: 1.8rem;
        height: 40px;
        margin-top: 20px;
        transition: all 0.5s ease;
    }
    .card-stats {
        background: #fff3d1;
        border: 2px solid #DAA520;
        border-radius: 15px;
        text-align: center;
        padding: 25px;
        color: #B8860B;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .card-stats h3 {
        font-size: 2.2rem;
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
    .step-card {
        background: white;
        border-radius: 20px;
        padding: 25px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        height: 100%;
    }
    .step-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }
    .step-icon {
        font-size: 2.2rem;
        color: #0d6efd;
        margin-right: 20px;
    }
    .step-header {
        font-size: 1.25rem;
        font-weight: 600;
        color: #0a2c4d;
    }
    .step-description {
        font-size: 0.95rem;
        color: #4a4a4a;
        margin-top: 5px;
    }
    .card-body-wrapper {
        display: flex;
        align-items: flex-start;
    }

    .sizelogo {
        height: 50px;
    }
    .dealer-label {
        margin-right: 20px;
        font-weight: 600;
        color: #333;
        font-size: 1rem;
        vertical-align: middle;
    }
    .icon-btn {
        font-size: 1.2rem;
        color: #555;
        position: relative;
        cursor: pointer;
        margin-right: 20px;
    }
    .icon-btn:hover {
        color: #007bff;
    }
    .notification-badge {
        position: absolute;
        top: 0;
        right: -6px;
        background: red;
        color: white;
        border-radius: 50%;
        font-size: 0.7rem;
        padding: 2px 5px;
    }
    .dropdown-menu {
        min-width: 220px;
    }
    .upload-label {
        cursor: pointer;
        padding: 8px 12px;
        display: block;
        color: #212529;
    }
    .upload-label:hover {
        background-color: #f8f9fa;
    }
    #uploadProfileImage {
        display: none;
    }
</style>

       <!-- Tagline Rotator Script -->
<script>
  // Rotating Taglines
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

  // Animated Counters
  function animateValue(id, start, end, duration) {
    const range = end - start;
    let startTime = null;

    function step(timestamp) {
      if (!startTime) startTime = timestamp;
      const progress = Math.min((timestamp - startTime) / duration, 1);
      document.getElementById(id).innerText = Math.floor(progress * range + start);
      if (progress < 1) requestAnimationFrame(step);
    }

    requestAnimationFrame(step);
  }

  animateValue("client-count", 0, 100, 2000);
  animateValue("transaction-count", 0, 200, 2500);

  // Bond Calculator Sync and Calculate
  document.addEventListener('DOMContentLoaded', () => {
    const amountRange = document.getElementById("amountRange");
    const rateRange = document.getElementById("rateRange");
    const yearsRange = document.getElementById("yearsRange");

    const amountVal = document.getElementById("amountVal");
    const rateVal = document.getElementById("rateVal");
    const yearsVal = document.getElementById("yearsVal");

    // Sync inputs and sliders bidirectionally
    function syncRangeAndInput(range, input) {
      range.oninput = () => input.value = range.value;
      input.oninput = () => range.value = input.value;
    }

    syncRangeAndInput(amountRange, amountVal);
    syncRangeAndInput(rateRange, rateVal);
    syncRangeAndInput(yearsRange, yearsVal);

    // Calculate compound returns and display result
    function calculateReturns() {
      const amount = parseFloat(amountVal.value) || 0;
      const rate = parseFloat(rateVal.value) || 0;
      const years = parseFloat(yearsVal.value) || 0;
      const finalAmount = amount * Math.pow(1 + rate / 100, years);
      document.getElementById("result").textContent = `₹${finalAmount.toFixed(2)}`;
    }

    document.getElementById("calculateBtn").onclick = calculateReturns;
  });
</script>


<!-- Bootstrap 5 JS (Make sure you have Bootstrap JS for dropdowns) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body class="bg-light text-dark">
   


   <form id="form1" runat="server">
    <div class="container my-3 p-2">
        <!-- Navbar -->
        <div class="d-flex justify-content-between align-items-center p-3 rounded-top bg-light shadow-sm">
            <!-- Left side: Logo -->
            <div class="d-flex align-items-center">
                <img src="https://bondsadda.com/img/logo.png" alt="Bondsadda Logo" class="sizelogo" />
            </div>

            <!-- Right side -->
            <div class="d-flex align-items-center">
                <asp:Label ID="lblDealerID" runat="server" CssClass="dealer-label" Text="Dealer ID: 12345" />

                <!-- Notification Icon -->
                <div class="icon-btn position-relative" title="Notifications" id="notificationBtn">
                    <i class="fa-solid fa-bell"></i>
                    <span class="notification-badge" id="notificationCount">3</span>
                </div>

                <div class="dropdown">
                    <a href="#" class="icon-btn text-decoration-none text-dark" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" title="Admin Profile">
                        <i class="fa-solid fa-user-circle"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                        <li>
                            <asp:LinkButton ID="btnLogout" runat="server" CssClass="dropdown-item text-danger" OnClick="btnLogout_Click" Text="Logout" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <%-- HERO SECTION --%>
        <div class="container py-5">
            <div class="row align-items-center">
                <!-- LEFT SIDE -->
                <div class="col-md-6 mb-5 mb-md-0">
                    <h1 class="display-5 fw-bold" style="color: #001f3f;">
                        Invest smart, Earn big, with <span class="gold">BONDSADDA</span>
                    </h1>

                    <!-- Animated Tagline (Golden, No Icons) -->
                    <div class="rotating-tagline gold fw-semibold" id="taglineDisplay">Regular Income</div>

                    <div class="row mt-4">
                        <div class="col-6">
                            <div class="card-stats">
                                <h3><span id="client-count">0</span>+</h3>
                                <p class="mb-0">Happy Clients</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card-stats">
                                <h3>₹<span id="transaction-count">0</span> Cr+</h3>
                                <p class="mb-0">Transactions</p>
                            </div>
                        </div>
                    </div>

                    <a href="https://bondsadda.com/OurCollections" class="btn btn-invest mt-4">Invest Now</a>
                </div>

                <!-- RIGHT SIDE: BOND CALCULATOR -->
                <div class="col-md-6">
                    <div class="bond-calculator">
                        <h3 class="mb-4 gold">Bond Calculator</h3>
                        <form>
                            <label for="amountRange">Investment Amount (₹)</label>
                            <div class="input-group mb-3">
                                <input type="range" class="form-range" min="10000" max="1000000" step="10000" id="amountRange" />
                                <input type="number" class="form-control" id="amountVal" value="100000" />
                            </div>

                            <label for="rateRange">Expected Return (%)</label>
                            <div class="input-group mb-3">
                                <input type="range" class="form-range" min="5" max="15" step="0.5" id="rateRange" />
                                <input type="number" class="form-control" id="rateVal" value="10" />
                            </div>

                            <label for="yearsRange">Years</label>
                            <div class="input-group mb-3">
                                <input type="range" class="form-range" min="1" max="10" id="yearsRange" />
                                <input type="number" class="form-control" id="yearsVal" value="5" />
                            </div>

                            <button type="button" class="btn btn-invest w-100" id="calculateBtn">Calculate</button>

                            <div class="mt-4">
                                <strong>Estimated Returns:</strong> <span id="result">--</span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <section class="pt-md-5 pt-4 collection">
            <div class="container">
                <div class="row py-md-5">
                    <div class="col-12 text-center">
                        <h2 class="h3 text-dark font-weight-normal">Our
                            <span class="text-warning">Bond Collections</span>
                        </h2>
                    </div>
                </div>

                <div class="section home-page-investment-option">
                    <div class="container">
                        <div class="row justify-content-center">
                            <!-- High Return Bonds -->
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="box-style">
                                    <i class="fa-solid fa-arrow-up-right-dots"></i>
                                    <h2>High Return Bonds</h2>
                                    <div class="content">
                                        <p><b>High-return bonds offering great opportunities for aggressive investors.</b></p>
                                    </div>
                                    <a href="https://bondsadda.com/OurCollections?oId=16" class="btn">Explore</a>
                                </div>
                            </div>

                            <!-- Monthly Income Bonds -->
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="box-style">
                                    <i class="fa-solid fa-calendar-days"></i>
                                    <h2>Monthly Income Bonds</h2>
                                    <div class="content">
                                        <p><b>Invest in monthly income bonds for regular returns.</b></p>
                                    </div>
                                    <a href="https://bondsadda.com/OurCollections?oId=13" class="btn">Explore</a>
                                </div>
                            </div>

                            <!-- Bank Bonds: PSU & PVT Bonds -->
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="box-style">
                                    <i class="fa-solid fa-lock"></i>
                                    <h2>Bank Bonds: PSU & PVT Bonds</h2>
                                    <div class="content">
                                        <p><b>Choose between PSU or private bank bonds for high security and stability.</b></p>
                                    </div>
                                    <a href="https://bondsadda.com/OurCollections?oId=14" class="btn">Explore</a>
                                </div>
                            </div>

                            <!-- Public Sector Bonds -->
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="box-style">
                                    <i class="fa-solid fa-people-group"></i>
                                    <h2>Public Sector Bonds</h2>
                                    <div class="content">
                                        <p><b>Invest in public sector bonds for lower risk and government backing.</b></p>
                                    </div>
                                    <a href="https://bondsadda.com/OurCollections?oId=26" class="btn">Explore</a>
                                </div>
                            </div>

                            <!-- Sovereign Rated Bonds -->
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="box-style">
                                    <i class="fa-solid fa-crown"></i>
                                    <h2>Sovereign Rated Bonds</h2>
                                    <div class="content">
                                        <p><b>Government-backed sovereign bonds that are safe and offer stable returns.</b></p>
                                    </div>
                                    <a href="https://bondsadda.com/OurCollections?oId=28" class="btn">Explore</a>
                                </div>
                            </div>

                            <!-- Tax Free Bonds -->
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="box-style">
                                    <i class="fa-solid fa-seedling"></i>
                                    <h2>Tax Free Bonds</h2>
                                    <div class="content">
                                        <p><b>Enjoy tax-free income with these bonds while preserving your capital.</b></p>
                                    </div>
                                    <a href="https://bondsadda.com/OurCollections?oId=17" class="btn">Explore</a>
                                </div>
                            </div>

                            <!-- Capital Gain Bonds -->
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="box-style">
                                    <i class="fa-solid fa-money-bill-1-wave"></i>
                                    <h2>Capital Gain Bonds (54EC)</h2>
                                    <div class="content">
                                        <p><b>Reduce your capital gains tax with these tax-saving bonds.</b></p>
                                    </div>
                                    <a href="https://bondsadda.com/OurCollections?oId=27" class="btn">Explore</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div>
            <div class="container py-5">
                <h2 class="text-center title">Bond Through BondsAdda</h2>
                <div class="row g-4">
                    <!-- Step 1 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="step-card">
                            <div class="card-body-wrapper d-flex align-items-center">
                                <i class="fas fa-envelope-open-text step-icon me-3"></i>
                                <div>
                                    <div class="step-header">Step 1: RFQ the Order</div>
                                    <div class="step-description">Initiate the Request for Quote for your desired bond order.</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 2 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="step-card">
                            <div class="card-body-wrapper d-flex align-items-center">
                                <i class="fas fa-edit step-icon me-3"></i>
                                <div>
                                    <div class="step-header">Step 2: Modify the Order</div>
                                    <div class="step-description">Make changes if required before confirming the order.</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 3 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="step-card">
                            <div class="card-body-wrapper d-flex align-items-center">
                                <i class="fas fa-check-circle step-icon me-3"></i>
                                <div>
                                    <div class="step-header">Step 3: Accept the Order</div>
                                    <div class="step-description">Accept the final order based on the quote received.</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 4 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="step-card">
                            <div class="card-body-wrapper d-flex align-items-center">
                                <i class="fas fa-flag step-icon me-3"></i>
                                <div>
                                    <div class="step-header">Step 4: Report the Order</div>
                                    <div class="step-description">Report the order to the appropriate platform or authority.</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 5 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="step-card">
                            <div class="card-body-wrapper d-flex align-items-center">
                                <i class="fas fa-thumbs-up step-icon me-3"></i>
                                <div>
                                    <div class="step-header">Step 5: Approve</div>
                                    <div class="step-description">Provide final approval to proceed to the next stage.</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 6 -->
                    <div class="col-md-6 col-lg-4">
                        <div class="step-card">
                            <div class="card-body-wrapper d-flex align-items-center">
                                <i class="fas fa-credit-card step-icon me-3"></i>
                                <div>
                                    <div class="step-header">Step 6: Go Through Payment</div>
                                    <div class="step-description">Enter the <strong>ICDM Order Number</strong> and <strong>Date</strong> to generate a payment link and complete the transaction.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Cards Section -->
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mt-5">
                <!-- UCC Management Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm bgfirst">
                        <div class="card-body text-center">
                            <h5 class="card-title">UCC Management</h5>
                            <p class="card-text">Manage your UCC information.</p>
                            <a href="UCCManagement.aspx" class="btn btn-outline-primary w-100">Go to UCC Management</a>
                        </div>
                    </div>
                </div>

                <!-- ICDM Order Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm bgsecond">
                        <div class="card-body text-center">
                            <h5 class="card-title">ICDM Order</h5>
                            <p class="card-text">Place or manage ICDM orders.</p>
                            <a href="ICDMOrder.aspx" class="btn btn-outline-primary w-100">Go to ICDM Order</a>
                        </div>
                    </div>
                </div>

                <!-- RFQ Order Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm bgthree">
                        <div class="card-body text-center">
                            <h5 class="card-title">RFQ Order</h5>
                            <p class="card-text">Request for Quote orders.</p>
                            <a href="RFQOrder.aspx" class="btn btn-outline-primary w-100">Go to RFQ Order</a>
                        </div>
                    </div>
                </div>

                <!-- Modify RFQ Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm bgfourth">
                        <div class="card-body text-center">
                            <h5 class="card-title">Modify RFQ</h5>
                            <p class="card-text">Modify your RFQ orders.</p>
                            <a href="RFQModify.aspx" class="btn btn-outline-primary w-100">Modify RFQ</a>
                        </div>
                    </div>
                </div>

                <!-- RFQQuoteAccept Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm bgfifith">
                        <div class="card-body text-center">
                            <h5 class="card-title">RFQQuoteAccept</h5>
                            <p class="card-text">Access real-time market data.</p>
                            <a href="RFQQuoteAccept.aspx" class="btn btn-outline-primary w-100">View Market Data</a>
                        </div>
                    </div>
                </div>

                <!-- RFQDealPropose Card -->
                <div class="col">
                    <div class="card h-100 shadow-sm bgsixth">
                        <div class="card-body text-center">
                            <h5 class="card-title">RFQDealPropose</h5>
                            <p class="card-text">Negotiate deals with brokers.</p>
                            <a href="RFQDealPropose.aspx" class="btn btn-outline-primary w-100">Negotiate Deals</a>
                        </div>
                    </div>
                </div>

                <!-----Payment --->
                 <div class="col">
                     <div class="card h-100 shadow-sm bgsixth">
                         <div class="card-body text-center">
                             <h5 class="card-title">RFQDealPropose</h5>
                             <p class="card-text">Negotiate deals with brokers.</p>
                             <a href="PaymenyGateway.aspx" class="btn btn-outline-primary w-100">Payment</a>
                         </div>
                     </div>
                 </div>
            </div>
        </div>

        <!-- WhatsApp Contact Button -->
        <a href="https://wa.me/916330053953" target="_blank" class="btn btn-success rounded-circle whatsapp-button" title="Contact us on WhatsApp">
            <i class="fa fa-whatsapp fa-2x"></i>
        </a>
    </div>
</form>
    <!-- Bootstrap JS (Optional for interactive elements) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    
</body>
</html>
