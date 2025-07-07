<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f7fa;
        }

        .faq-header {
            background-color: #2C3E50;
            color: white;
            padding: 40px 0;
            text-align: center;
        }

        .faq-header h2 {
            font-size: 28px;
            font-weight: 500;
            margin-bottom: 10px;
        }

        .faq-header p {
            font-size: 15px;
            opacity: 0.85;
        }

        .faq-container {
            padding: 40px 20px;
            max-width: 900px;
            margin: auto;
        }

        .accordion {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 12px;
            overflow: hidden;
            border: 1px solid #ddd;
            transition: all 0.3s ease-in-out;
        }

        .accordion-header {
            padding: 14px 20px;
            background-color: #f1f1f1;
            color: black;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .accordion-header:hover {
            background-color: #e2e6ea;
        }

        .accordion-header h3 {
            margin: 0;
            font-size: 16px;
            font-weight: 500;
        }

        .accordion .icon {
            font-size: 20px;
            font-weight: bold;
            transition: transform 0.3s ease;
        }

        .accordion.active .icon {
            transform: rotate(45deg);
        }

        .accordion-body {
            display: none;
            padding: 15px 20px;
            background-color: #ffffff;
            border-top: 1px solid #ddd;
            color: #333;
        }

        .accordion.active .accordion-body {
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <!-- Header -->
    <section class="faq-header">
        <div class="container">
            <h2>Frequently Asked Questions</h2>
            <p>Find answers to commonly asked queries</p>
        </div>
    </section>

    <!-- Accordion Body -->
    <section class="faq-container">
        <asp:Panel ID="pnlView" runat="server">
            <asp:Repeater ID="rptFAQ" runat="server">
                <ItemTemplate>
                    <div class="accordion">
                        <div class="accordion-header">
                            <h3><%# Eval("Question") %></h3>
                            <div class="icon">+</div>
                        </div>
                        <div class="accordion-body">
                            <p><%# Eval("Answer") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>
    </section>

  
</asp:Content>
