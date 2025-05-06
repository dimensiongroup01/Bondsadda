<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="BSE_INTEGRATION_Dashboard" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - BSE API</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        /* Keyframe Animation for Moving the Form */
        @keyframes moveForm {
            0% { transform: translateX(0); }
            50% { transform: translateX(10px); }
            100% { transform: translateX(0); }
        }

        /* Applying animation to the container */
        .animated-container {
            animation: moveForm 1s ease-in-out infinite;
        }

        /* Card hover effect */
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px); /* Slight lift effect on hover */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Shadow increase */
        }

        /* Logo size */
        .sizelogo {
            width: 250px;
            height: auto;
        }

        /* Media Queries for specific adjustments */
        @media (max-width: 768px) {
            .card {
                margin-bottom: 20px;
            }
        }
         /* Feature Section */
 .feature-section {
     background-color: #fff;
     padding: 40px 0;
     text-align: center;
 }

 .feature-section .feature-card {
     box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
     padding: 20px;
 }

 .feature-icon {
     font-size: 2rem;
     color: #007bff;
 }
 
        /* Footer */
        .footer {
            text-align: center;
            margin-top: 50px;
            font-size: 0.9rem;
            color: #6c757d;
            padding: 30px;
            background-color: #f8f9fa;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
        }
        /* WhatsApp Button - Floating on Right Bottom */
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

        .left-section {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .right-section {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .video-container {
            position: relative;
            width: 90%;
            padding-top: 90%; /* 1:1 Aspect Ratio (Square) */
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

        .button-container {
            max-width: 250px;
            text-align: center;
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

        /* Card Container */
        .home-page-investment-option .box {
            height: 320px; /* Fixed height for all cards */
          background: rgb(246, 246, 246);

            border-radius: 12px;
            margin-bottom: 30px;
            padding: 20px;
            position: relative;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            opacity: 0.8;
            text-align: center;
        }

        /* Hover effect: reveal content */
        .home-page-investment-option .box:hover {
            opacity: 1;
            transform: translateY(-10px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
        }

        /* Icon styling */
        .home-page-investment-option .box i {
            background: #ad5a3b;
            color: white;
            margin-bottom: 15px;
            height: 60px;
            width: 60px;
            line-height: 60px;
            border-radius: 50%;
            font-size: 30px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        /* Hover effect for icon */
        .home-page-investment-option .box:hover i {
            background-color: #333;
        }

        /* Title styling */
        .home-page-investment-option .box h2 {
            font-size: 20px;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
            transition: color 0.3s ease;
        }

        /* Show full content on hover */
        .home-page-investment-option .box .content {
            display: none;
            margin-top: 10px;
            font-size: 10px;
            color: #555;
            transition: opacity 0.3s ease;
        }

        /* Show content when hovered */
        .home-page-investment-option .box:hover .content {
            display: block;
            opacity: 1;
        }

        /* Button styling */
        .home-page-investment-option .box a {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            padding: 12px 25px;
            border-radius: 30px;
            background: #ad5a3b;
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: background 0.3s ease, color 0.3s ease;
        }

        /* Hover effect for the Explore button */
        .home-page-investment-option .box:hover a {
            background: #333;
            color: white;
        }

        /* Responsive Layout */
        .home-page-investment-option .col-lg-4 {
            margin-bottom: 30px;
        }

        .home-page-investment-option .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
       .bgfirst{
         background: rgb(174,225,238);
background: linear-gradient(90deg, rgba(174,225,238,1) 0%, rgba(80,195,169,1) 55%);
       }
       .bgsecond{
         background: rgb(237,136,108);
background: linear-gradient(90deg, rgba(237,136,108,1) 0%, rgba(241,132,81,0.6783088235294117) 55%);
       }
       .bgthree{
           background: rgb(206,235,96);
background: linear-gradient(90deg, rgba(206,235,96,1) 0%, rgba(159,230,151,0.6783088235294117) 55%);
       }
       .bgfourth{
           background: rgb(231,174,240);
background: linear-gradient(90deg, rgba(231,174,240,1) 0%, rgba(167,150,235,0.6783088235294117) 55%);
       }
       .bgfifith{
           background: rgb(31,205,130);
background: linear-gradient(90deg, rgba(31,205,130,1) 0%, rgba(184,245,239,0.6783088235294117) 55%);
       }
       .bgsix{
           background: rgb(205,189,31);
background: linear-gradient(90deg, rgba(205,189,31,1) 0%, rgba(219,215,61,0.6783088235294117) 55%);
       }
       .bgseven{
background: rgb(232,133,238);
background: linear-gradient(90deg, rgba(232,133,238,1) 0%, rgba(228,86,148,0.6783088235294117) 55%);
       }
       /* Collection Section */
.collection {
   
    padding-top: 5rem;
    padding-bottom: 5rem;
}

/* Heading Styles */
.collection h2 {
    font-size: 2rem;
    color: white;
    text-transform: uppercase;
}

.collection h2 .text-warning {
    color: #FFA500; /* Orange color */
}

/* Box Styling */
.box {
    background-color:#333; /* Dark background for each box */
    padding: 1.5rem;
    border-radius: 8px;
    margin: 1rem 0; /* Reduced space between boxes */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
    text-align: center;
}

.box:hover {
    transform: translateY(-10px);
}

/* Box Content */
.box .content p {
    font-size: 1rem;
    color: #ddd;
}

.box .btn {
    background-color: #333; /* Orange button */
    color: white;
    padding: 0.5rem 1rem;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    margin-top: 1rem;
    transition: background-color 0.3s ease;
}

.box .btn:hover {
    background-color: #FF8C00; /* Slightly darker orange on hover */
}

/* Icon Styles */
.box i {
    font-size: 2.5rem;
    color: #FFA500; /* Orange color for icons */
    margin-bottom: 1rem;
}

/* Reducing Box Size */
.box {
    max-width: 300px; /* Smaller box width */
    margin: 0 auto;
}

@media (max-width: 768px) {
    .box {
        max-width: 280px; /* Smaller box size for mobile */
    }
}

/* Container */
.container {
    max-width: 1200px; /* Ensuring the container doesn't stretch too wide */
    margin: 0 auto;
}

/* Row Adjustments */
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

    </style>
</head>
<body class="bg-light text-dark">
   


    <form id="form1" runat="server">
        <div class="container my-5 p-4 rounded shadow-lg animated-container">
            <!-- Navbar -->
            <div class="d-flex justify-content-between align-items-center  p-3 rounded-top">
                <img src="https://bondsadda.com/img/logo.png" alt="Bondsadda Logo" class="sizelogo" />
                <div>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger text-white" OnClick="btnLogout_Click" />
                </div>
            </div>

            <h1 class="text-center text-3xl font-weight-bold mt-5"><b>"Invest smart, Earn big, with BONDSADDA"</b></h1>
            <p class="text-center text-muted mt-2">Your Dealer ID: <asp:Label ID="lblDealerID" runat="server" class="font-weight-semibold"></asp:Label></p>
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
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="box text-center box-style">
                            <i class="fa-solid fa-arrow-up-right-dots"></i>
                            <h2 class="#">High Return Bonds</h2>
                            <div class="content">
                                <p class="text-dark"><b>High-return bonds offering great opportunities for aggressive investors.</b></p>
                            </div>
                            <a href="https://bondsadda.com/OurCollections?oId=16" class="btn btn-primary">Explore</a>
                        </div>
                    </div>
                    <!-- Monthly Income Bonds -->
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="box text-center box-style">
                            <i class="fa-solid fa-calendar-days"></i>
                            <h2 class="text-dark">Monthly Income Bonds</h2>
                            <div class="content">
                                <p class="text-dark"><b>Invest in monthly income bonds for regular returns. </b></p>
                            </div>
                            <a href="https://bondsadda.com/OurCollections?oId=13" class="btn btn-primary">Explore</a>
                        </div>
                    </div>

                    <!-- Bank Bonds: PSU & PVT Bonds -->
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="box text-center box-style">
                            <i class="fa-solid fa-lock"></i>
                            <h2 class="text-dark">Bank Bonds: PSU & PVT Bonds</h2>
                            <div class="content">
                                <p class="text-dark"><b>Choose between PSU or private bank bonds for high security and stability.</b></p>
                            </div>
                            <a href="https://bondsadda.com/OurCollections?oId=14" class="btn btn-primary">Explore</a>
                        </div>
                    </div>

                    <!-- Public Sector Bonds -->
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="box text-center box-style">
                            <i class="fa-solid fa-people-group"></i>
                            <h2 class="text-dark">Public Sector Bonds</h2>
                            <div class="content">
                                <p class="text-dark"><b>Invest in public sector bonds for lower risk and government backing.</b></p>
                            </div>
                            <a href="https://bondsadda.com/OurCollections?oId=26" class="btn btn-primary">Explore</a>
                        </div>
                    </div>

                    <!-- Sovereign Rated Bonds -->
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="box text-center box-style">
                            <i class="fa-solid fa-crown"></i>
                            <h2 class="text-dark">Sovereign Rated Bonds</h2>
                            <div class="content">
                                <p class="text-dark"><b>Government-backed sovereign bonds that are safe and offer stable returns.</b></p>
                            </div>
                            <a href="https://bondsadda.com/OurCollections?oId=28" class="btn btn-primary">Explore</a>
                        </div>
                    </div>

                    <!-- Tax Free Bonds -->
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="box text-center box-style">
                            <i class="fa-solid fa-seedling"></i>
                            <h2 class="text-dark">Tax Free Bonds</h2>
                            <div class="content">
                                <p class="text-dark"><b>Enjoy tax-free income with these bonds while preserving your capital.</b></p>
                            </div>
                            <a href="https://bondsadda.com/OurCollections?oId=17" class="btn btn-primary">Explore</a>
                        </div>
                    </div>

                    <!-- Capital Gain Bonds -->
                    <div class="col-lg-3 col-md-4 col-12">
                        <div class="box text-center box-style">
                            <i class="fa-solid fa-money-bill-1-wave"></i>
                            <h2 class="text-dark">Capital Gain Bonds (54EC)</h2>
                            <div class="content">
                                <p class="text-dark"><b>Reduce your capital gains tax with these tax-saving bonds.</b></p>
                            </div>
                            <a href="https://bondsadda.com/OurCollections?oId=27" class="btn btn-primary">Explore</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
                      <!-- Dashboard Cards Section -->
          <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 mt-5">
              <!-- UCC Management Card -->
              <divs class="col  ">
                  <div class="card h-100 shadow-sm bgfirst ">
                      <div class="card-body text-center">
                          <h5 class="card-title">UCC Management</h5>
                          <p class="card-text">Manage your UCC information.</p>
                          <a href="UCCManagement.aspx" class="btn btn-outline-primary w-100">Go to UCC Management</a>
                      </div>
                  </div>
              </divs>

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
                  <div class="card h-100 shadow-sm bgsix">
                      <div class="card-body text-center">
                          <h5 class="card-title">RFQDealPropose</h5>
                          <p class="card-text">Access real-time market data.</p>
                          <a href="RFQDealPropose.aspx" class="btn btn-outline-primary w-100">View Market Data</a>
                      </div>
                  </div>
              </div>
               <!-- RFQApprove Card -->
               <div class="col">
                   <div class="card h-100 shadow-sm bgseven">
                       <div class="card-body text-center">
                           <h5 class="card-title">RFQ Approve</h5>
                           <p class="card-text">Access real-time market data.</p>
                           <a href="RFQApprove.aspx" class="btn btn-outline-primary w-100">View Market Data</a>
                       </div>
                   </div>
               </div>
          </div>
                        <div>
                  <div class="container-fluid">
                   <div class="content-wrapper">
                       <!-- Left Section: FAQ Button -->
                       <div class="left-section">
                           <div class="button-container">
                               <button onclick="window.open('https://bondsadda.com/FAQ.aspx', '_blank')" class="btn btn-primary">Visit Bondadda FAQ</button>
                           </div>
                       </div>

                       <!-- Right Section: Square Video -->
                       <div class="right-section">
                           <div class="video-container">
                               <iframe src="https://www.youtube.com/embed/u57IIt8mwKA" title="Time Video"></iframe>
                           </div>
                       </div>
               </div>
           </div>
   
          </div>
            <!-- Feature Section -->
<div class="feature-section">
    <h3>Why Choose BONDSADDA?</h3>
    <div class="row">
        <div class="col-md-4">
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-chart-line"></i></div>
                <h5>Smart Investing</h5>
                <p>Maximize your returns with our data-driven investment strategies.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-lock"></i></div>
                <h5>Secure Transactions</h5>
                <p>Your investments are secured with top-tier encryption and security measures.</p>
            </div>
        </div>
        <div class="col-md-4">
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-user-shield"></i></div>
                <h5>Personalized Support</h5>
                <p>Our experts are available to assist you with tailored investment advice.</p>
            </div>
        </div>
    </div>
</div>


      </div>
  </form>
        <!-- Footer Section -->
    <div class="footer">
        <p>&copy; 2025 BONDSADDA. All Rights Reserved.</p>
        <p>Contact us at <a href="mailto:customercare@bondsadda.com">customercare@bondsadda.com</a></p>
    </div>
</form>

            
           

           
    <!-- WhatsApp Button -->
<a href="https://wa.me/9650799566" target="_blank">
    <div class="whatsapp-btn">
        <i class="fab fa-whatsapp"></i> <!-- FontAwesome Icon for WhatsApp -->
    </div>
</a>

    <!-- Bootstrap JS (Optional for interactive elements) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
