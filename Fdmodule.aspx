<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="Fdmodule.aspx.cs" Inherits="Fdmodule" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>FD Registration Dashboard</title>
        <!-- SweetAlert2 for modern popup -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <style>
            html, body {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', sans-serif;
                background: linear-gradient(to right, #fdfbfb, #ebedee);
            }

            .navbar-custom {
                background: #ffffff;
                padding: 10px 20px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                
            }

            .btn-nav {
                background: linear-gradient(135deg, #007bff, #6610f2);
                color: #fff;
                font-weight: 600;
                padding: 8px 18px;
                border: none;
                border-radius: 25px;
            }

            .dashboard-top, .main-grid {
                padding: 20px 40px;
            }

            .dashboard-card {
                background: #fff;
                border-radius: 20px;
                padding: 25px;
                text-align: center;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out;
            }

            .dashboard-card:hover {
                transform: translateY(-5px);
            }

            .main-grid {
                display: grid;
                grid-template-columns: 2fr 1.5fr;
                gap: 30px;
            }

             .chart-box {
                background: #fff;
                border-radius: 20px;
                padding: 20px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                height:330px;
            }

            .chart-title, .form-title {
                text-align: center;
                font-weight: bold;
                color: #343a40;
                
            }

            .form-control:focus {
                box-shadow: 0 0 0 0.15rem rgba(0, 123, 255, 0.25);
            }

            .btn-primary {
                width: 100%;
                padding: 12px;
                border-radius: 30px;
                font-weight: bold;
                font-size: 16px;
                background: linear-gradient(135deg, #007bff, #6610f2);
                border: none;
            }

            .btn-primary:hover {
                background: linear-gradient(135deg, #6610f2, #007bff);
            }

            .hidden {
                display: none;
            }

            footer {
                font-size: 0.875rem;
            }
             .form-box{
             height:auto;
                background: #fff;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
             }
            .social-icon {
  width: 40px;
  height: 40px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  font-size: 18px;
  transition: all 0.3s ease;
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.05);
}

.group:hover .social-icon {
  transform: scale(1.1);
  box-shadow: 0 0 15px rgba(241, 90, 41, 0.6);
  background-color: #f15a29;
  color: #fff !important;
}

.group:hover span:last-child {
  color: #f8f9fa;
}
     .footer h2 {
     font-size: 1.1rem;
     margin-bottom: 15px;
     border-bottom: 1px solid rgba(255, 255, 255, 0.2);
     padding-bottom: 5px;
 }

 .footer .btn-link {
     display: inline-block;
     margin: 4px 0;
     font-size: 0.95rem;
     transition: all 0.3s ease;
 }

 .footer .btn-link:hover {
     text-decoration: underline;
     color: #fffbe0;
 }

 .footer i {
     margin-right: 8px;
     color: #ffeb3b;
 }

 .footer .read-more-content {
     display: none;
     margin-top: 10px;
 }

 .footer .read-more-toggle {
     cursor: pointer;
     font-weight: 500;
     display: inline-block;
     margin-top: 10px;
     text-decoration: underline;
     color: #ffffff;
 }

 @media (max-width: 767.98px) {
     .footer .col-lg-3,
     .footer .col-lg-2,
     .footer .col-lg-4 {
         margin-bottom: 25px;
     }

     .footer h2 {
         font-size: 1rem;
     }
 }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">

            <!-- NAVBAR -->
            <nav class="navbar navbar-expand-lg navbar-custom sticky-top shadow-sm">
                <div class="container d-flex justify-content-between align-items-center px-3">
                    <a class="navbar-brand" href="index.aspx">
                        <img src="img/logo.png" alt="Logo" style="height: 40px;" />
                    </a>
                    <button type="button" class="btn btn-nav bg-warning text-light fw-semibold" onclick="showFDForm()">
                        🚀 FD Registration
                    </button>
                </div>
            </nav>

            <!-- DASHBOARD SECTION -->
            <div id="dashboardSection" class="container py-4">
                <div class="row g-3">
                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="dashboard-card">
                            <h6>Total Users</h6>
                            <div class="count fs-4 fw-bold">800 +</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="dashboard-card">
                            <h6>Monthly Growth</h6>
                            <div class="count text-success fs-4 fw-bold">+28%</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="dashboard-card">
                            <h6>Pending Verifications</h6>
                            <div class="count text-warning fs-4 fw-bold">34</div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-3">
                        <div class="dashboard-card">
                            <h6>Active FDs</h6>
                            <div class="count text-primary fs-4 fw-bold">612</div>
                        </div>
                    </div>
                </div>

                <!-- CHARTS -->
                <div class="row mt-4 g-4">
                    <div class="col-lg-6 mb-4">
                        <div class="chart-box">
                            <h5 class="chart-title">User Registrations - Last 6 Months</h5>
                            <canvas id="userBarChart" class="w-100" height="250"></canvas>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="chart-box">
                            <h5 class="chart-title">FD Distribution</h5>
                            <canvas id="fdChart" class="w-100" style="max-height: 250px;"></canvas>

                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="chart-box">
                            <h5 class="chart-title">Growth Over Time</h5>
                            <canvas id="lineChart" class="w-100" height="250"></canvas>
                        </div>
                    </div>
                    <div class="col-lg-6 mb-4">
                        <div class="chart-box">
                            <h5 class="chart-title">FD Type Comparison</h5>
                            <canvas id="doughnutChart" class="w-100" style="max-height: 250px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FD REGISTRATION FORM -->
            <div id="fdFormSection" class="container my-4 hidden ">
                <button type="button" class="btn btn-outline-secondary mb-3" onclick="showDashboard()">← Back to Dashboard</button>
                <div class="form-box">
                    <h4 class="form-title"><i class="fas fa-file-signature text-danger me-2"></i> FD Registration</h4>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-2">
                                <label for="txtName">Full Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"   ReadOnly="true" placeholder="Enter your full name" />
                            </div>
                            <div class="mb-2">
                                <label for="txtEmail">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"   ReadOnly="true" TextMode="Email" placeholder="example@email.com" />
                            </div>
                            <div class="mb-2">
                                <label for="txtMobile">Mobile Number</label>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"   ReadOnly="true" MaxLength="10" placeholder="Enter 10-digit mobile number" TextMode="SingleLine" oninput="this.value = this.value.replace(/[^0-9]/g, '');" />
                            </div>
                            <div class="mb-2">
                                <label for="txtPAN">PAN Number</label>
                                <asp:TextBox ID="txtPAN" runat="server" CssClass="form-control text-uppercase" MaxLength="10" placeholder="ABCDE1234F" />
                            </div>
                         
                        </div>
                        <div class="col-md-6">
                            <div class="mb-2">
                                <label for="txtAadhaar">Aadhaar Number</label>
                                <asp:TextBox ID="txtAadhaar" runat="server" CssClass="form-control" MaxLength="12" placeholder="XXXX-XXXX-XXXX" />
                            </div>
                            <div class="mb-2">
                                <label for="fuPAN">Upload PAN Card</label>
                                <asp:FileUpload ID="fuPAN" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-2">
                                <label for="fuAadhaar">Upload Aadhaar Card</label>
                                <asp:FileUpload ID="fuAadhaar" runat="server" CssClass="form-control" />
                            </div>

                           <div class="mb-2">
                           <label for="ddlFDType">Select FD Type</label>
                           <asp:DropDownList ID="ddlFDType" runat="server" CssClass="form-control">
                               <asp:ListItem Text="-- Select --" Value="" />
                               <asp:ListItem Text="LIC Housing Finance Ltd." Value="SANCHAY" />
                               <asp:ListItem Text="Shriram Transport Finance Company Ltd." Value="SHRIRAM" />
                               <asp:ListItem Text="Bajaj Finance Ltd." Value="BAJAJ" />
                               <asp:ListItem Text="PNB Housing Finance Ltd." Value="PNB" />
                           </asp:DropDownList>
                        </div>
                        </div>
                    </div>

                    <div class="text-center mt-4">
                        <asp:Button ID="btnSubmit" runat="server" Text="🚀 Submit Application" CssClass="btn btn-warning px-4 py-2 fw-bold shadow-sm rounded-pill" OnClick="btnSubmit_Click" data-toggle="modal" data-target="#fdRegistrationModal" />
                    </div>
                </div>
            </div>

            <!-- FOOTER DISCLAIMER -->
            <footer class="footer text-white font_2" style="background: linear-gradient(to bottom, #ffffff, #00354D);">
  <div class="container py-5">
    <div class="row gy-4">
      <!-- Logo & About -->
      <div class="col-lg-3">
        <img src="img/logo.png" class="img-fluid mb-3" alt="Bonds Adda Logo">
        <p class="text-dark fs-5">
  BondsAdda is an online platform or marketplace powered by Dimension Financial Solutions Pvt Ltd to buy or sell bonds.
  Invest in fixed return bonds and trade them easily.
</p>
      </div>

      <!-- Quick Links -->
      <div class="col-lg-3">
        <h5 class="text-dark mb-3">Quick Links</h5>
        <div class="row">
          <div class="col-6">
            <a href="#" class="d-block text-dark mb-2">Bonds</a>
            <a href="<%=ResolveUrl("~")%>OurCollections" class="d-block text-dark mb-2">Collections</a>
            <a href="<%=ResolveUrl("~")%>PrivacyPolicy" class="d-block text-dark mb-2">Privacy Policy</a>
            <a href="<%=ResolveUrl("~")%>BlogNewsData" class="d-block text-dark mb-2">Blogs</a>
            <a href="<%=ResolveUrl("~")%>TermsAndCondition" class="d-block text-dark mb-2">Terms & Conditions</a>
          </div>
          <div class="col-6">
            <a href="<%=ResolveUrl("~")%>FAQ" class="d-block text-dark mb-2">FAQ</a>
            <a href="<%=ResolveUrl("~")%>Contact" class="d-block text-dark mb-2">Contact Us</a>
            <a href="<%=ResolveUrl("~")%>CodeOfConduct" class="d-block text-dark mb-2">Code of Conduct</a>
            <a href="Image/Investor%20Grievance_DFS.pdf" download class="d-block text-dark mb-2">Grievance</a>
          </div>
        </div>
      </div>

      <!-- Corporate Office -->
      <div class="col-lg-4">
        <h5 class="text-dark mb-3">Corporate Office</h5>
        <p class="text-dark mb-2">
          <i class="fas fa-map-marker-alt me-2"></i>
          Dimension Tower, Plot No-10, 3rd Floor, Commercial Area, Kaushambi, Ghaziabad, U.P-201010.
        </p>
        <p class="text-dark mb-2"><i class="fas fa-phone me-2"></i>0120-4376552, 0120-4151349</p>
        <p class="text-dark mb-2"><i class="fas fa-envelope me-2"></i>customercare@bondsadda.com</p>
        <p class="text-dark mb-2">SEBI REGISTRATION No.: INZ000313233</p>
        <p class="text-dark">BSE Member ID: 6824</p>
      </div>

      <!-- Social Links -->
      <div class="col-lg-2 col-md-6">
        <h5 class="fw-bold text-uppercase text-dark mb-4">Follow Us</h5>
        <ul class="list-unstyled d-flex flex-column gap-3">
          <li>
            <a href="https://www.facebook.com/profile.php?id=100094572825123" target="_blank" class="d-flex align-items-center text-dark text-decoration-none">
              <i class="fab fa-facebook-f me-2 bg-white text-primary p-2 rounded-circle"></i> Facebook
            </a>
          </li>
          <li>
            <a href="https://www.instagram.com/bondsadda/" target="_blank" class="d-flex align-items-center text-dark text-decoration-none">
              <i class="fab fa-instagram me-2 bg-white text-danger p-2 rounded-circle"></i> Instagram
            </a>
          </li>
          <li>
            <a href="https://twitter.com/bondsadda" target="_blank" class="d-flex align-items-center text-dark text-decoration-none">
              <i class="fab fa-twitter me-2 bg-white text-info p-2 rounded-circle"></i> Twitter
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <!-- Bottom Bar -->
  <div class="container py-4 border-top border-light-subtle">
    <div class="row">
      <div class="col-12">
        <h3 class="fw-bold mb-2 text-warning">Welcome to BondsAdda</h3>
        <p class="text-white-50 mb-0">Dimension Financial Solutions Private Limited | SEBI Registration No.: INZ000313233</p>
      </div>
    </div>

    <!-- Disclaimer Section -->
    <div class="row mt-4">
      <div class="col-12">
        <div id="readMoreContent" class="read-more-content bg-light p-4 rounded-4 shadow-sm">
          <h3 class="fw-bold mb-3 text-dark"><i class="fas fa-shield-alt text-primary me-2"></i> Disclaimer</h3>

          <p class="mb-2 text-dark">BondsAdda is a brand name of the website of <strong>Dimension Financial Solutions Private Limited</strong> – a SEBI registered and BSE debt market broker providing an Online Bond Providing Platform (OBPP) enabling investors to trade bonds and debentures in the secondary market.</p>

          <p class="mb-3 text-dark">Before using our website and services, please read the following disclaimer carefully:</p>

          <div class="alert alert-warning rounded-3 mb-4" role="alert">
            <strong><i class="fas fa-exclamation-triangle me-2"></i>Market Risk:</strong> Investments in debt securities are subject to market risks. Read all the offer/scheme related documents carefully before investing.
          </div>

          <ol class="ps-3 text-dark">
            <li class="mb-3"><strong>Investment Risks:</strong><br>BondsAdda.com is a marketplace for buying and selling bonds. Investments involve risks, and past performance is not indicative of future returns. Always do your own research or seek expert advice.</li>
            <li class="mb-3"><strong>Information Accuracy:</strong><br>While we strive for accuracy, we cannot guarantee completeness or reliability. Please verify information independently.</li>
            <li class="mb-3"><strong>Financial Advice:</strong><br>We do not offer personalized financial advice. The content is for informational purposes only.</li>
            <li class="mb-3"><strong>User Responsibility:</strong><br>You are solely responsible for your decisions and investments. BondsAdda and Dimension Group are not liable for losses.</li>
            <li class="mb-3"><strong>Third-Party Links:</strong><br>External links are for convenience. We do not endorse their content or services.</li>
            <li class="mb-3"><strong>Regulatory Compliance:</strong><br>Ensure you comply with applicable laws in your region. We are not responsible for consequences of non-compliance.</li>
            <li class="mb-3"><strong>Platform Modifications:</strong><br>We may change or update features without notice. Please check the disclaimer periodically.</li>
          </ol>

          <p class="mt-4 text-dark">By using BondsAdda.com, you confirm that you accept this disclaimer. If you disagree with any part, please stop using our platform.</p>

          <p class="text-dark">For queries, contact: <a href="mailto:customercare@bondsadda.com" class="text-decoration-underline text-primary">customercare@bondsadda.com</a></p>

          <hr class="my-4">

          <div class="pt-2">
            <h5 class="fw-semibold"><i class="fas fa-user-shield text-secondary me-2"></i> Compliance Officer</h5>
            <p class="mb-1 text-dark">RAVI KANT MATHUR</p>
            <p class="mb-1 text-dark">Tel. No.: <a href="tel:01204151349" class="text-decoration-none text-dark">0120-4151349</a></p>
            <p class="mb-1 text-dark">Email: <a href="mailto:compliance@dimensiongroup.co.in" class="text-decoration-underline text-primary">compliance@dimensiongroup.co.in</a></p>
            <p class="mb-2 text-muted fst-italic">(For compliance & grievance-related complaints)</p>
            <p class="mb-0 text-dark"><strong>Directors:</strong> RAVI KANT MATHUR, PRACHI CHOPRA & VIVEK GAUTAM</p>
          </div>

          <hr class="my-4">

          <p class="mb-1 text-dark">Thank you for choosing <strong>BondsAdda.com</strong> for your financial needs.</p>
          <p class="text-dark">Important links:
            <a href="#" class="text-decoration-underline text-secondary">Indian Clearing Corporation Ltd (ICCL)</a> |
            <a href="#" class="text-decoration-underline text-secondary">NSDL</a> |
            <a href="#" class="text-decoration-underline text-secondary">CDSL</a> |
            <a href="#" class="text-decoration-underline text-secondary">BSE</a>
          </p>
        </div>

        <!-- View More Toggle -->
        <span id="readMoreToggle" class="read-more-toggle text-primary mt-3 d-inline-block" style="cursor: pointer;" onclick="toggleReadMore()">View More ▼</span>
      </div>
    </div>
  </div>
</footer>

         
               
            <!-- TOGGLE JS -->
          <script>
              function showFDForm() {
                  document.getElementById("dashboardSection").classList.add("hidden");
                  document.getElementById("fdFormSection").classList.remove("hidden");
              }

              function showDashboard() {
                  document.getElementById("fdFormSection").classList.add("hidden");
                  document.getElementById("dashboardSection").classList.remove("hidden");
              }

              // Automatically show FD form when the page loads
              window.onload = function () {
                  showFDForm();
              };
          </script>


            <!-- CHART JS SETUP -->
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const charts = {
                        userBarChart: {
                            type: 'bar',
                            data: {
                                labels: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                                datasets: [{
                                    label: 'Users',
                                    data: [120, 150, 110, 220, 90, 270],
                                    backgroundColor: '#ffc107'
                                }]
                            }
                        },
                        fdChart: {
                            type: 'pie',
                            data: {
                                labels: ['Corporate FD', 'Bank FD', 'NBFC FD'],
                                datasets: [{
                                    data: [50, 40, 10],
                                    backgroundColor: ['#0d6efd', '#198754', '#ffc107']
                                }]
                            }
                        },
                        lineChart: {
                            type: 'line',
                            data: {
                                labels: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                                datasets: [{
                                    label: 'Growth %',
                                    data: [5, 10, 15, 25, 30, 40],
                                    borderColor: '#198754',
                                    fill: false
                                }]
                            }
                        },
                        doughnutChart: {
                            type: 'doughnut',
                            data: {
                                labels: ['Shriram Transport Finance Company Ltd.', 'PNB Housing Finance Ltd.', 'Bajaj Finance Ltd', 'LIC Housing Finance Ltd'],
                                datasets: [{
                                    data: [120, 90, 60, 40],
                                    backgroundColor: ['#f44336', '#4caf50', '#ff9800', '#9c27b0']
                                }]
                            }
                        }
                    };

                    for (const id in charts) {
                        const canvas = document.getElementById(id);
                        if (canvas) {
                            new Chart(canvas, charts[id]);
                        }
                    }
                });
            </script>

            <!-- FILE SIZE VALIDATION -->
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const maxBytes = 4 * 1024 * 1024;
                    document.querySelector("form").addEventListener("submit", function (e) {
                        const pan = document.getElementById("<%= fuPAN.ClientID %>");
                        const aadhaar = document.getElementById("<%= fuAadhaar.ClientID %>");
                        if (pan.files[0] && pan.files[0].size > maxBytes) {
                            alert("❌ PAN file exceeds 4MB.");
                            e.preventDefault();
                        }
                        if (aadhaar.files[0] && aadhaar.files[0].size > maxBytes) {
                            alert("❌ Aadhaar file exceeds 4MB.");
                            e.preventDefault();
                        }
                    });
                });
                function downloadFDDetails() {
    const content = `
    ✅ FD Details Saved!

    Name: ${document.querySelector(".swal2-html-container strong:nth-of-type(1)").nextSibling.textContent.trim()}
    Email: ${document.querySelector(".swal2-html-container strong:nth-of-type(2)").nextSibling.textContent.trim()}
    Mobile: ${document.querySelector(".swal2-html-container strong:nth-of-type(3)").nextSibling.textContent.trim()}
    PAN: ${document.querySelector(".swal2-html-container strong:nth-of-type(4)").nextSibling.textContent.trim()}
    Aadhaar: ${document.querySelector(".swal2-html-container strong:nth-of-type(5)").nextSibling.textContent.trim()}
    FD Type: ${document.querySelector(".swal2-html-container strong:nth-of-type(6)").nextSibling.textContent.trim()}
    Created On: ${document.querySelector(".swal2-html-container strong:nth-of-type(7)").nextSibling.textContent.trim()}
    `;

    const blob = new Blob([content], { type: "text/plain" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "FD_Receipt.txt";
    a.click();
    URL.revokeObjectURL(url);
}
 function toggleReadMore() {
     var content = document.getElementById("readMoreContent");
     var toggle = document.getElementById("readMoreToggle");
     if (content.style.display === "none" || content.style.display === "") {
         content.style.display = "block";
         toggle.innerText = "View Less ▲";
     } else {
         content.style.display = "none";
         toggle.innerText = "View More ▼";
     }
 }
            </script>

        </form>
    </body>
    </html>
