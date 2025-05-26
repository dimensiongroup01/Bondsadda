<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_Dashboard.aspx.cs" Inherits="BSE_INTEGRATION_users_user_Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>User Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  
  <!-- Bootstrap & FontAwesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8f9fa;
      padding: 40px 20px;
      color: #001f3f;
    }

    h2 {
      text-align: center;
      color: #001f3f;
      font-weight: 700;
      margin-bottom: 40px;
    }

    .status-badge {
      padding: 5px 12px;
      border-radius: 50px;
      font-size: 0.85rem;
      font-weight: 600;
      display: inline-block;
    }

    .status-pending {
      background-color: #ffc107;
      color: #000;
    }

    .status-settled {
      background-color: #198754;
      color: #fff;
    }

    .btn-custom {
      background-color: transparent;
      color: #ff851b;
      border: 1px solid #ff851b;
      border-radius: 6px;
      padding: 5px 10px;
      transition: 0.3s;
    }

    .btn-custom:hover {
      background-color: #ff851b;
      color: #fff;
    }

    .card-box {
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }

    .chart-card {
      margin-top: 40px;
    }

    .section-heading {
      color: #ff851b;
      font-weight: 600;
    }
  </style>
</head>
<body>
  <form id="form1" runat="server">
    <div class="container">
      <h2><i class="fas fa-chart-bar me-2"></i>User Dashboard</h2>

      <!-- Bond Table -->
      <div class="card-box mb-5">
        <asp:GridView ID="gvBonds" runat="server" AutoGenerateColumns="False" CssClass="table table-hover align-middle" DataKeyNames="ID" OnRowCommand="gvBonds_RowCommand">
          <Columns>
            <asp:BoundField DataField="Name" HeaderText="Bond" />
            <asp:TemplateField HeaderText="Status">
              <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' 
                           CssClass='<%# Eval("Status").ToString().ToLower() == "pending" ? "status-badge status-pending" : "status-badge status-settled" %>'>
                </asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Value" HeaderText="Value (₹)" DataFormatString="{0:N0}" />
            <asp:BoundField DataField="Allocation" HeaderText="Allocation (%)" />
            <asp:TemplateField HeaderText="Action">
              <ItemTemplate>
                <asp:Button ID="btnSettle" runat="server" Text="Settle" CommandName="Settle" CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-sm btn-custom me-1" />
                <asp:Button ID="btnPreview" runat="server" Text="Preview" CommandName="Preview" CommandArgument="<%# Container.DataItemIndex %>" CssClass="btn btn-sm btn-outline-secondary" />
              </ItemTemplate>
            </asp:TemplateField>
          </Columns>
        </asp:GridView>
      </div>

      <!-- Chart Section -->
      <div class="row chart-card">
        <div class="col-md-6 mb-4">
          <div class="card-box">
            <h5 class="section-heading"><i class="fas fa-chart-line me-2"></i>Performance</h5>
            <canvas id="performanceChart" height="220"></canvas>
          </div>
        </div>
        <div class="col-md-6 mb-4">
          <div class="card-box">
            <h5 class="section-heading"><i class="fas fa-chart-pie me-2"></i>Allocation</h5>
            <canvas id="allocationChart" height="220"></canvas>
          </div>
        </div>
      </div>
    </div>
  </form>

  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
      // Placeholder Chart.js setup for demo UI
      const ctx1 = document.getElementById('performanceChart').getContext('2d');
      const performanceChart = new Chart(ctx1, {
          type: 'line',
          data: {
              labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
              datasets: [{
                  label: 'Growth',
                  data: [5, 10, 8, 15, 12],
                  borderColor: '#ff851b',
                  backgroundColor: 'rgba(255,133,27,0.2)',
                  fill: true,
                  tension: 0.3
              }]
          }
      });

      const ctx2 = document.getElementById('allocationChart').getContext('2d');
      const allocationChart = new Chart(ctx2, {
          type: 'doughnut',
          data: {
              labels: ['Bond A', 'Bond B', 'Bond C'],
              datasets: [{
                  data: [40, 35, 25],
                  backgroundColor: ['#001f3f', '#ff851b', '#6c757d']
              }]
          }
      });
  </script>
</body>
</html>
