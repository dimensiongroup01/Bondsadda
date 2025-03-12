<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintDealConfirmation.aspx.cs" Inherits="PrintDealConfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deal Confirmation</title>
</head>
<body  onload="window.print()">
    
  <table style="width:100%;">
    <tr>
        <td style="width:75%">
            <h3 style="margin-bottom:-10px;"><strong>Dimension Financial Solutions Pvt Ltd</strong></h3>
            <p>Plot No-10, Third Floor, Dimension Group Building,<br />Commercial Area, Kaushambi, Ghaziabad U.P -
                201010<br />
              <strong>CIN</strong> - U74140DL2009PTC186563<br />
               <strong>Email Id </strong> - debt@dimensiongroup.co.in<br />
              <strong>Mobile No </strong> - +91 9650700244 / 9650799558<br />
           
            <strong>Deal Ref No:-</strong> DFS/227/2023-24,<br />to<br /><strong><asp:Label ID="lblCustomer" runat="server"></asp:Label></strong></p>
           
<%--            <p><strong>As per our mutual discussion(s) we confirm to Sale the following securities as per details
                    given below:</strong></p>--%>
        </td>
        <td style="width:25%">
           <img src="Signup/Picture1.png" style="width:100%;"/>
        </td>
    </tr>
</table>
<table style="width: 100%;" border="1">
    <tr>
        <td><strong>Transaction Type</strong></td>
        <td colspan="3"><strong>Security Sale</strong></td>
    </tr>
    <tr>
        <td>Deal Date</td>
        <td><asp:Label ID="lblDealDate" runat="server"></asp:Label></td>
        <td>Settlement Date</td>
        <td><asp:Label ID ="lblSattlementDate" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="4">Security Details :-</td>
    </tr>
    <tr>
        <td>Name of Security</td>
        <td colspan="3"><asp:Label ID="lblSecurity" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>ISIN Number</td>
        <td colspan="3"><asp:Label ID="lblISINNumber" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Coupon Rate</td>
        <td colspan="3"><asp:Label ID="lblCouponRate" runat="server"></asp:Label>%</td>
    </tr>
    <tr>
        <td>Date of Allotment</td>
        <td colspan="3"><asp:Label ID="lblDateofallotment" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Interest Payment Date</td>
        <td colspan="3"><asp:Label ID="lblMaturitytype" runat="server"></asp:Label>-<asp:Label ID="lblIPDate" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Maturity Date</td>
        <td colspan="3"><asp:Label ID="lblMaturityDate" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Put/Call Option</td>
        <td colspan="3"><asp:Label ID="lblPutDate" runat="server"></asp:Label>/<asp:Label ID="lblCallDate" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Last Interest Payment Date</td>
        <td colspan="3"><asp:Label ID="lblLastIPDate" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Number of Days</td>
        <td colspan="3"><asp:Label ID="lblNoOfDays" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Face Value of Per Bond</td>
        <td colspan="3"><asp:Label ID="lblFacevaluebond" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Quantity</td>
        <td colspan="3"><asp:Label ID="lblQuantity" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td>Rate (Rs.)</td>
        <td><asp:Label ID="lblRate" runat="server"></asp:Label></td>
        <td>YTM</td>
        <td><asp:Label ID="lblYTM" runat="server"></asp:Label> %</td>
    </tr>
    <tr>
        <td>Face Value of Deal (Rs.)</td>
        <td colspan="3"><asp:Label ID="lblFaceValueofdeal" runat="server"></asp:Label></td>
    </tr>
            <tr>
        <td>Principal Amount (Rs.)</td>
        <td colspan="3"><asp:Label ID="lblPrincipalAmount" runat="server"></asp:Label></td>
    </tr>
            <tr>
        <td>Accured Interest (Rs.)</td>
        <td colspan="3"><asp:Label ID="lblAccuredInterest" runat="server"></asp:Label></td>
    </tr>
            <tr>
        <td>Total Consideration (Rs.)</td>
        <td colspan="3"><asp:Label ID="lblTotalConsideration" runat="server"></asp:Label></td>
    </tr>
            <tr>
        <td>Stamp Duty (Rs.)</td>
        <td colspan="3"><asp:Label ID="lblStampduty" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td style="padding: 5px 0;">
            <strong> Total Consideration (Rs.) With Stamp Duty</strong>
        </td>
        <td colspan="3"><asp:Label ID="lblConsiderationwithduty" runat="server"></asp:Label></td>
    </tr>
</table>
<p>**This document is system genrated, doesn't require any signature..**</p>
<table style="width: 100%;">
    <tr>
        <td>Yours Faithfully</td>
    </tr>
    <tr>
        <td>We hereby confirm the deal</td>
        <td>We are agreeable to buy the security as per terms mentioned above</td>
    </tr>
    <tr>
        <td>For Dimension Financial Solutions Pvt. Ltd.</td>
        <td>For <strong><asp:Label ID="lblCustomerName" runat="server"></asp:Label></strong></td>
    </tr>
    <tr>
        <td>(Authorised Signatory)<br>

            Our Pan : AADCD0669G
<%--                            <img src="Signup/Picture2.jpg" style="height: 70px;" alt=""/>--%>
           <%-- <img src="#stamp Image" style="height: 60px;" alt="">--%>
        </td>
        <td style="text-align: center;">Authorised Signatory</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center;">

            Dimension Financial Solutions Pvt. Ltd.<br>
            Regd. Office: 302, Dakha Chamber, 38/2068, Naiwala Karol Bagh, New Delhi-110005 <br>
            Tel.: 0120-4376552, 4336551-52 Fax: +91-0120-4151349 <br>
            Website: www.dimensiongroup.co.in

        </td>
    </tr>

</table>
</body>
</html>
