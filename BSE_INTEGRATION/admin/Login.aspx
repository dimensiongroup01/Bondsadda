<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="BSE_INTEGRATION_Login" Async="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - BSE Integration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            height: 100vh; /* Full viewport height */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-wrapper {
            border: 2px solid #007bff;
            border-radius: 10px;
            padding: 30px;
            width: 100%;
            max-width: 900px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            background-color: white;
            transition: all 0.3s ease;
        }

        /* Add hover effect on the main wrapper */
        .main-wrapper:hover {
            transform: translateY(-10px); /* Lift the wrapper on hover */
            box-shadow: 0 16px 32px rgba(0, 0, 0, 0.2); /* Increase shadow on hover */
        }

        .left-column {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .left-column img {
            width: 300px;
            height: auto;
        }

        .right-column {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.25);
            width: 100%;
            max-width: 500px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        /* Add hover effect on the form */
        .login-container:hover {
            transform: translateY(-5px); /* Form slightly moves on hover */
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3); /* Larger shadow on hover */
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05); /* Button grows slightly on hover */
        }

        .form-control {
            margin-bottom: 15px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.6);
            border-color: #007bff;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 18px;
        }

        /* Responsive adjustments */
        @media (max-width: 767px) {
            .left-column, .right-column {
                flex: 1 1 100%;
                text-align: center;
            }

            .login-container {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper">
            <div class="row w-100">
                <!-- Left Column: Bondsadda Logo -->
                <div class="col-md-6 left-column">
                    <img src="https://bondsadda.com/img/logo.png" alt="Bondsadda Logo" />
                    
                </div>

                <!-- Right Column: Login Form -->
                <div class="col-md-6 right-column">
                    <div class="login-container">
                        <h2 class="text-center">BSE Login</h2>
                        <asp:Label ID="lblMessage" runat="server" CssClass="error-message"></asp:Label>

                        <!-- Participant ID Field -->
                        <div class="mb-3">
                            <label for="txtParticipantID" class="form-label">Participant ID:</label>
                            <asp:TextBox ID="txtParticipantID" runat="server" CssClass="form-control" placeholder="Enter Participant ID"></asp:TextBox>
                        </div>

                        <!-- Dealer ID Field -->
                        <div class="mb-3">
                            <label for="txtDealerID" class="form-label">Dealer ID:</label>
                            <asp:TextBox ID="txtDealerID" runat="server" CssClass="form-control" placeholder="Enter Dealer ID"></asp:TextBox>
                        </div>

                        <!-- Password Field -->
                        <div class="mb-3">
                            <label for="txtPassword" class="form-label">Password:</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                        </div>

                        <!-- Login Button -->
                        <div class="btn-container">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
</body>
</html>
