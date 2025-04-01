<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InsertInward.aspx.cs" Inherits="Shriram_InsertInward" Async="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>InserInward API Interaction</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="/css/style_shriram/css/styles.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="section">
                <h2>InsertInward API</h2>

                <!-- Personal Details Section -->
                <div class="section-title">
                    <h3>Personal Details</h3>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter1" runat="server" Text="Customer Title:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter1" runat="server" Placeholder="Mr"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter2" runat="server" Text="Customer First Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter2" runat="server" Placeholder="John"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter3" runat="server" Text="Customer Middle Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter3" runat="server" Placeholder="Doe"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter4" runat="server" Text="Customer Last Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter4" runat="server" Placeholder="Smith"></asp:TextBox><br />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter5" runat="server" Text="Customer Date of Birth:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter5" runat="server" Placeholder="01-01-1990"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter6" runat="server" Text="Gender:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter6" runat="server" Placeholder="Male"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter7" runat="server" Text="PAN Number:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter7" runat="server" Placeholder="Pan No"></asp:TextBox><br />
                    </div>
                    
                </div>

                <!-- Address Details Section -->
                <div class="section-title">
                    <h3>Address Details</h3>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter8" runat="server" Text="Customer Address1:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter8" runat="server" Placeholder="Street Address"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                         <asp:Label ID="lblParameter9" runat="server" Text="Customer Address2:"></asp:Label><br />
                         <asp:TextBox ID="txtParameter9" runat="server" Placeholder="Street Address"></asp:TextBox><br />
                     </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter10" runat="server" Text="Customer Area:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter10" runat="server" Placeholder="Area"></asp:TextBox><br />
                    </div>
                   <div class="form-group col-md-3">
                       <asp:Label ID="lblParameter11" runat="server" Text="Customer City:"></asp:Label><br />
                       <asp:TextBox ID="txtParameter11" runat="server" Placeholder="City"></asp:TextBox><br />
                   </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter12" runat="server" Text="Customer State:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter12" runat="server" Placeholder="State"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter13" runat="server" Text="Customer Country:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter13" runat="server" Placeholder="Country"></asp:TextBox><br />
                    </div>
                
               
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter14" runat="server" Text="Customer Pin Code:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter14" runat="server" Placeholder="Pin Code"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter15" runat="server" Text="Customer Mobile Number:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter15" runat="server" Placeholder="Mobile No"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter16" runat="server" Text="Customer Email:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter16" runat="server" Placeholder="email@example.com"></asp:TextBox><br />
                    </div>
                   <div class="form-group col-md-3">
                       <asp:Label ID="lblParameter17" runat="server" Text="Customer Phone Number:"></asp:Label><br />
                       <asp:TextBox ID="txtParameter17" runat="server" Placeholder="Phone No"></asp:TextBox><br />
                   </div>

                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter18" runat="server" Text="Customer TAXSTATUS :"></asp:Label><br />
                        <asp:TextBox ID="txtParameter18" runat="server" Placeholder="Tax Status"></asp:TextBox><br />
                    </div>
                </div>

                <!-- Employment Details Section -->
                <div class="section-title">
                    <h3>FD Details</h3>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter19" runat="server" Text="Select Scheme:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter19" runat="server" Placeholder="Scheme"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter20" runat="server" Text="Selected Interest Frequency:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter20" runat="server" Placeholder="Interest Frequency"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter21" runat="server" Text="Deposit Amount:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter21" runat="server" Placeholder="Amount"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter22" runat="server" Text="Maturity Instruction:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter22" runat="server" Placeholder="Instructions"></asp:TextBox><br />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter23" runat="server" Text="Tax Declaration:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter23" runat="server" Placeholder="Tax"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter24" runat="server" Text="Deposit Payable To:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter24" runat="server" Placeholder="Deposit Payable"></asp:TextBox><br />
                    </div>
                </div>


                                <!-- Bank Details Section -->
                <div class="section-title">
                    <h3>Bank Details </h3>
                </div>
                  <div class="form-row">
                <div class="form-group col-md-3">
                    <asp:Label ID="lblParameter25" runat="server" Text="Account Type:"></asp:Label><br />
                    <asp:TextBox ID="txtParameter25" runat="server" Placeholder="Account"></asp:TextBox><br />
                </div>
                <div class="form-group col-md-3">
                    <asp:Label ID="lblParameter26" runat="server" Text="IFSC Code:"></asp:Label><br />
                    <asp:TextBox ID="txtParameter26" runat="server" Placeholder="IFSC"></asp:TextBox><br />
                </div>
                <div class="form-group col-md-3">
                      <asp:Label ID="lblParameter27" runat="server" Text="Account No:"></asp:Label><br />
                      <asp:TextBox ID="txtParameter27" runat="server" Placeholder="Account No"></asp:TextBox><br />
                  </div>
              
                <div class="form-group col-md-3">
                    <asp:Label ID="lblParameter28" runat="server" Text="Name Of The Bank:"></asp:Label><br />
                    <asp:TextBox ID="txtParameter28" runat="server" Placeholder="Bank Name"></asp:TextBox><br />
                </div>
                <div class="form-group col-md-3">
                    <asp:Label ID="lblParameter29" runat="server" Text="Name Of The Branch:"></asp:Label><br />
                    <asp:TextBox ID="txtParameter29" runat="server" Placeholder="Branch Name"></asp:TextBox><br />
                </div>
                 
                </div>
                <!-- Nominee Details Section -->
                <div class="section-title">
                    <h3>Nominee Details</h3>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter30" runat="server" Text="Nominee Title:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter30" runat="server" Placeholder="Nominee Title"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter31" runat="server" Text="Nominee First Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter31" runat="server" Placeholder="Nominee First Name"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter32" runat="server" Text="Nominee Middle Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter32" runat="server" Placeholder="Middle Name"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter33" runat="server" Text="Nominee Last Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter33" runat="server" Placeholder="Nominee Last Name"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter34" runat="server" Text="Relation:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter34" runat="server" Placeholder="Relation"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter35" runat="server" Text="Nominee Date of Birth:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter35" runat="server" Placeholder="DOB"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                         <asp:Label ID="lblParameter36" runat="server" Text="Nominee Guardian Title:"></asp:Label><br />
                          <asp:TextBox ID="txtParameter36" runat="server" Placeholder="Nominee Guardian Title"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter37" runat="server" Text="Nominee Guardian First Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter37" runat="server" Placeholder="Nominee Guardian First Name"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter38" runat="server" Text="Nominee Guardian Midle Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter38" runat="server" Placeholder="Nominee Guardian Last Name"></asp:TextBox><br />
                    </div>
                    <div class="form-group col-md-3">
                        <asp:Label ID="lblParameter39" runat="server" Text="Nominee Guardian Last Name:"></asp:Label><br />
                        <asp:TextBox ID="txtParameter39" runat="server" Placeholder="Nominee Guardian Last Name"></asp:TextBox><br />
                    </div>
                    </div>
                     <!-- Joint Holder Section -->
                     <div class="section-title">
                         <h3>Joint Holder Detail</h3>
                     </div>
                     <div class="form-row">
                         <div class="form-group col-md-3">
                             <asp:Label ID="lblParameter40" runat="server" Text="First Joint Holder Title :"></asp:Label><br />
                             <asp:TextBox ID="txtParameter40" runat="server" Placeholder="Title"></asp:TextBox><br />
                         </div>
                         <div class="form-group col-md-3">
                             <asp:Label ID="lblParameter41" runat="server" Text="First Joint Holder Name :"></asp:Label><br />
                             <asp:TextBox ID="txtParameter41" runat="server" Placeholder="Name"></asp:TextBox><br />
                         </div>
                         <div class="form-group col-md-3">
                             <asp:Label ID="lblParameter42" runat="server" Text="Second Joint Holder Title "></asp:Label><br />
                             <asp:TextBox ID="txtParameter42" runat="server" Placeholder="Title"></asp:TextBox><br />
                         </div>
                         <div class="form-group col-md-3">
                             <asp:Label ID="lblParameter43" runat="server" Text="Second Joint Holder Name:"></asp:Label><br />
                             <asp:TextBox ID="txtParameter43" runat="server" Placeholder="Name"></asp:TextBox><br />
                         </div>
                     </div>
                     

                    <!-- Scheme and Payment Details Section -->
                    <div class="section-title">
                        <h3>Scheme and Payment Details</h3>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblParameter44" runat="server" Text="Bank Bazaar Unique ID: "></asp:Label><br />
                            <asp:TextBox ID="txtParameter44" runat="server" Placeholder="Unique ID"></asp:TextBox><br />
                        </div>
                         <div class="form-group col-md-3">
                             <asp:Label ID="lblParameter45" runat="server" Text="Scheme Period:"></asp:Label><br />
                             <asp:TextBox ID="txtParameter45" runat="server" Placeholder="Scheme Period"></asp:TextBox><br />
                         </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblParameter46" runat="server" Text="Rate Of Interest:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter46" runat="server" Placeholder="Rate Of Interest"></asp:TextBox><br />
                        </div>
                   
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblParameter47" runat="server" Text="Aadhar ID:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter47" runat="server" Placeholder="Aadhar ID"></asp:TextBox><br />
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblParameter48" runat="server" Text="Return URL:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter48" runat="server" Placeholder="Return URL"></asp:TextBox><br />
                        </div>
                          <div class="form-group col-md-3">
                              <asp:Label ID="lblParameter49" runat="server" Text="Company Name:"></asp:Label><br />
                              <asp:TextBox ID="txtParameter49" runat="server" Placeholder="Company Name"></asp:TextBox><br />
                          </div>
                      
                      
                    </div>

                    <!-- Payment Gateway Section -->
                    <div class="section-title">
                        <h3>Broker Details</h3>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblParameter50" runat="server" Text="Method Name:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter50" runat="server" Placeholder="Method Name"></asp:TextBox><br />
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblParameter51" runat="server" Text="Method Descr:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter51" runat="server" Placeholder="Method Descr"></asp:TextBox><br />
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblParameter52" runat="server" Text="SubBroker Code:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter52" runat="server" Placeholder="Broker Code"></asp:TextBox><br />
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lblParameter53" runat="server" Text="Branch State:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter53" runat="server" Placeholder="Branch State"></asp:TextBox><br />
                        </div>
                         <div class="form-group col-md-3">
                             <asp:Label ID="lb4Parameter54" runat="server" Text="Unit:"></asp:Label><br />
                             <asp:TextBox ID="txtParameter54" runat="server" Placeholder="Unit"></asp:TextBox><br />
                         </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lb4Parameter55" runat="server" Text="Branch Name:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter55" runat="server" Placeholder="Branch Name "></asp:TextBox><br />
                        </div>
                        <div class="form-group col-md-3">
                            <asp:Label ID="lb4Parameter56" runat="server" Text="CKYC Reference No:"></asp:Label><br />
                            <asp:TextBox ID="txtParameter56" runat="server" Placeholder="Reference No"></asp:TextBox><br />
                        </div>
                    </div>

               


                <!-- Continue adding all 57 parameters, repeating the form-row pattern above -->

                <!-- Submit Button -->
                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="Submit" />
                </div>
 

              
            </div>
        
    </form>
      <div class="response-container">
           <asp:Label ID="litResponse" runat="server" Text="" CssClass="response-label" Visible="true"></asp:Label>
  </div>
</body>
</html>
