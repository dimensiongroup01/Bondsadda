<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQDealPropose.aspx.cs" Inherits="BSE_INTEGRATION_RFQDealPropose" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
 <form id="form1" runat="server">
     <div class="container mt-4">
         <h2 class="text-center">Modify RFQ Order</h2>

         <div class="row">
             <div class="col-md-6">
                 <label>Bond Type:</label>
                 <asp:DropDownList ID="ddlBondType" runat="server" CssClass="form-control">
                     <asp:ListItem Value="ICDM">ICDM</asp:ListItem>
                     <asp:ListItem Value="GSEC">GSEC</asp:ListItem>
                     <asp:ListItem Value="CP">CP</asp:ListItem>
                     <asp:ListItem Value="CD">CD</asp:ListItem>
                 </asp:DropDownList>
             </div>
              <div class="col-md-6">
                <label>Deal Type:</label>
                <asp:DropDownList ID="ddlDealType" runat="server" CssClass="form-control">
                    <asp:ListItem Value="DIRECT">DIRECT</asp:ListItem>
                    <asp:ListItem Value="BROKER">BROKER</asp:ListItem>
                </asp:DropDownList>
            </div>

              <div class="col-md-6">
               
                  <div class="col-md-6">
                  <label>RFQ Order Number:</label>
                  <asp:TextBox ID="txtRFQOrderNumber" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
              </div>

             
              <div class="col-md-6">
                  <label>RFQ Deal Id:</label>
                  <asp:TextBox ID="txtRfqDealId" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
               <label>Bid Yield Type:</label>
                  <asp:DropDownList ID="ddlBidYieldType" runat="server" CssClass="form-control">
                      <asp:ListItem Text="YTM" Value="YTM"></asp:ListItem>
                      <asp:ListItem Text="YTP" Value="YTP"></asp:ListItem>
                      <asp:ListItem Text="YTC" Value="YTC"></asp:ListItem>
                </asp:DropDownList>
             <div class="col-md-6">
                <label>Yield</label>
                <asp:TextBox ID="txtYield" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

             <div class="col-md-6">
                <label>Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
         </div>
        </div>
    </form>
</body>
</html>
