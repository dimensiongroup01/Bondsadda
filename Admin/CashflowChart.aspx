<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="CashflowChart.aspx.cs" Inherits="Admin_CashflowChart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

  <style>
              ul {
            background:#fff;
        }
  </style>
    
    <!-- App Css-->
    <link href="https://themesbrand.com/velzon/html/galaxy/assets/css/app.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
    <div class="main-content">


            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">CASH FLOW CHART</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">CASH FLOW CHART</a></li>
                                        <li class="breadcrumb-item active">CASH FLOW CHART</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>
                    <asp:UpdatePanel ID ="upnl" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID ="hfISINNumber" runat="server" />
    <asp:HiddenField ID ="hfCouponRate" runat="server" />
    <asp:HiddenField ID ="hfMaturityDate" runat="server" />
    <asp:HiddenField ID ="hfIPDate" runat="server" />
    <asp:HiddenField ID ="hfRatePrice" runat="server" />
    <asp:HiddenField ID ="hfFaceValueForBond" runat="server" />
    <asp:HiddenField ID ="hfDayValue" runat="server" />
    <asp:HiddenField ID ="hfMonth" runat="server" />
    <asp:HiddenField ID ="hfQuerterly" runat="server" />
    <asp:HiddenField ID ="hfYearly" runat="server" />
    <asp:HiddenField ID ="hfHalfYearly" runat="server" />
    <asp:HiddenField ID ="hfMonthlyInterest" runat="server" />
    <asp:HiddenField ID ="hfYearlyInterest" runat="server" />
    <asp:HiddenField ID ="hfQuarterlyInterest" runat="server" />
    <asp:HiddenField ID ="hfHalfYearlyInterest" runat="server" />
    <asp:HiddenField ID ="hfFirstIntDay" runat="server" />
    <asp:HiddenField ID ="hfSecondIntDay" runat="server" />
    <asp:HiddenField ID ="hfFirstMonthly" runat="server" />
    <asp:HiddenField ID ="hfFirstQuarterly" runat="server" />
    <asp:HiddenField ID ="hfFirstHalf" runat="server" />
    <asp:HiddenField ID ="hfFirstYearly" runat="server" />
                            <asp:HiddenField ID ="hfRemainingDay" runat="server" />
                            <asp:HiddenField ID ="hfRemainingMonth" runat="server" />
                            <asp:HiddenField ID ="hfLastMonthly" runat="server" />
                            <asp:HiddenField ID ="hfLastYearly" runat="server" />
                            <asp:HiddenField ID ="hfLastHalfYear" runat="server" />
                            <asp:HiddenField ID ="hfLastQuarterly" runat="server" />
                            <asp:HiddenField ID ="hfTotalMonth" runat="server" />
                            <asp:HiddenField ID ="hfTotalYear" runat="server" />
                            <asp:HiddenField ID ="hfTotalDay" runat="server" />
                            <asp:HiddenField ID ="hfIPDates" runat="server" />
                            <asp:HiddenField ID ="hfOneDayInterest" runat="server" />
                            <asp:HiddenField ID ="hfLastDate" runat="server" />
                            <asp:HiddenField ID ="hfPaymentType" runat="server" />
                            <asp:HiddenField ID ="hfTotalConserationAmount" runat="server" />
                            <asp:HiddenField ID="hfQuar" runat="server" />
                            <asp:HiddenField ID ="hfnewIPDate" runat="server" />
                            <asp:HiddenField ID="hftotalrowbond" runat="server" />
                            <asp:Panel ID ="pnlAdd" runat="server">
                        <div class="row">
                        <div class="col-xxl-12">
                            <div class="card">


                                <div class="card-body">
                                    <div class="live-preview">
                                        <div action="javascript:void(0);">
                                            <div class="row">

                                                

                                                
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Customer Name*</label>
                                                         <asp:DropDownList ID="ddlCustomerName" runat="server" CssClass="form-control" AutoPostBack="true">
                                                         </asp:DropDownList>
                                                    </div>
                                                </div>
                                                

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Security*</label>
                                                         <asp:DropDownList ID="ddlProductName" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProductName_SelectedIndexChanged" AutoPostBack="true">
                                                         </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">ISIN No</label>
                                           <asp:TextBox ID ="txtISIN" runat="server" class="form-control" ReadOnly="true" placeholder=""></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Coupon Rate</label>
                                           <asp:TextBox ID ="txtCoupon" runat="server" class="form-control" ReadOnly="true" placeholder=""></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Maturity Date</label>
                                           <asp:TextBox ID ="txtMaturity" runat="server" class="form-control" ReadOnly="true" placeholder=""></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">IPDate</label>
                                           <asp:TextBox ID ="txtIPDate" runat="server" class="form-control" ReadOnly="true" placeholder=""></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Rate/Price</label>
                                   <asp:TextBox ID ="txtRatePrice" runat="server" class="form-control" ReadOnly="true" placeholder=""></asp:TextBox>
                                                       
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Face Value For Bond</label>
                                           <asp:TextBox ID ="txtFaceValueForBond" runat="server" class="form-control" ReadOnly="true" placeholder=""></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Sattlement Date</label>
                                           <asp:TextBox ID ="txtSattlement" runat="server" class="form-control datepicker" OnTextChanged="txtSattlement_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                                                 
                                               <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Payment/Frequency*</label>
                                                         <asp:TextBox ID="ddlFrequency" runat="server" CssClass="form-control" ReadOnly="true">
                                                         </asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Frequency Number</label>
                                           <asp:TextBox ID ="txtNumber" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Face Value For Deal</label>
                                           <asp:TextBox ID ="txtFaceValueForDeal" runat="server" class="form-control" OnTextChanged="txtFaceValueForDeal_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Quantity</label>
                                           <asp:TextBox ID ="txtQuantity" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Principal Amount</label>
                                           <asp:TextBox ID ="txtPrincipalAmount" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Accured Interest</label>
                                           <asp:TextBox ID ="txtAccuredInterest" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Gross Consideration</label>
                                           <asp:TextBox ID ="txtGrossConsideration" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>

                                                <!--end col-->
                                                <div class="col-lg-12">
                                                    <div class="text-end">
            <asp:LinkButton ID="lnkAdd" runat="server" CssClass="btn btn-primary" OnClick="lnkAdd_Click" >Add Product</asp:LinkButton>
                                                        
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <!--end row-->
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div> <!-- end col -->

                         <!-- end col -->
                    </div>
                    </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <!-- end page title -->
                    
                    
                    <!--end row-->
                    
                    <asp:Panel ID ="pnlView" runat="server">
                        <div class="row">
                        <div class="col-xl-12">
                            <div class="card card-height-100">
                                
                                <!-- end cardheader -->

                                    
                                <div class="card-body">


                                      <div class="table-responsive table-card">
                            
                            <div class="col-md-12" runat="server" id="Div3">
                                <asp:GridView ID="grdData" OnRowDataBound="grdData_RowDataBound" runat="server" CssClass="table table-nowrap table-centered align-middle" HeaderStyle-CssClass="fixedheader" AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-Height="320">
                                <Columns>

                                    <asp:TemplateField HeaderText="S.N.">
                                        <ItemTemplate>
                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                  <asp:TemplateField HeaderText="Customer Name" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CFullName")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                  <asp:TemplateField HeaderText="Security" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("Security")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 
                                    <asp:TemplateField HeaderText="ISIN No" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("ISINNumber")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                   <asp:TemplateField HeaderText="CouponRate" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CouponRate") %> %
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                  <asp:TemplateField HeaderText="Maturity Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("MaturityDate")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                               <asp:TemplateField HeaderText="IP Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("IPDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("Price") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="YTM" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("YTM") %> %
                                        </ItemTemplate>
                                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Face Value For Bond" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FacevalueForBond") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 <asp:TemplateField HeaderText="PaymentType/Frequency" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("PaymentType") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sattlement Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FSattlementDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Face Value For Deal" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FFaceValueForDeal") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Principal Amount" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FPrincipalAmount") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                              <asp:TemplateField HeaderText="Total Interested" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FTotalAssuredInterest") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Gross Consideration" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FGrossConsideration") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField ItemStyle-CssClass="text-center" HeaderText="Cash Flow Chart">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfCashflowChartId" runat="server" Value='<%#Eval("CashFlowChartId") %>' />
                                            <!-- Button trigger modal -->


                                            
                                            <button type="button" class="btn btn-primary " data-bs-toggle="modal" data-bs-target="#myModal<%#Eval("CashFlowChartId") %>">
                                                View
                                            </button>

                                            <div id="myModal<%#Eval("CashFlowChartId") %>" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                                           

                                                <div class="modal-dialog">

                                                    <div class="modal-content">
                                                          <div style="max-height: 500px; overflow: auto;">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="myModalLabel">Interest Details</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>

                                                        <div class="modal-body">
                                                           <asp:GridView ID="grdItems" ClientIDMode="Static" runat="server" CssClass="table"
                                                                AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                EmptyDataRowStyle-VerticalAlign="Middle"
                                                                EmptyDataRowStyle-Height="200">
                                                                <Columns>

                                                                    <asp:TemplateField HeaderText="S.N.">
                                                                        <ItemTemplate>
                                                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                                                                                                                                       <asp:TemplateField HeaderText="Interest Date">
                                                                        <ItemTemplate>
                            <asp:HiddenField ID ="hfCFlowChartId" runat="server" Value='<%#Eval("CFlowChartDetailsId") %>' />
                              <asp:HiddenField ID ="hfInterest" runat="server" Value='<%#Eval("InterestStatus") %>' />
                                                                            <%#Eval("InterestDate")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Interest Amount">
                                                                        <ItemTemplate>
                                                                            <%#Eval("InterestValue")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                                                                                                                  <asp:TemplateField HeaderText="Interest Days">
                                                                        <ItemTemplate>
                                                                            <%#Eval("MonthDayValue")%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                                                                                                                                                             <asp:TemplateField HeaderText="Interest Approved">
                                                                        <ItemTemplate>

                                                                                                               <asp:LinkButton ID="lnkApprove" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("CFlowChartDetailsId") %>' OnClick="lnkApprove_Click">Approve</asp:LinkButton>
                                                                            <asp:Label ID="Label1" runat="server"></asp:Label>

                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>                                                      

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                                                           
                                                        </div>
                                                              </div>

                                                    </div><!-- /.modal-content -->
                                                </div><!-- /.modal-dialog -->
                                                    
                                            </div><!-- /.modal -->
                                       
                                        </ItemTemplate>
                                    </asp:TemplateField>



                                         <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                              <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("CashFlowChartId")%>'
                                                        OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />
<%--                                 <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("CashFlowChartId")%>' OnClick="lnkEdit_Click">
                                                    <i class="material-icons">border_color</i></asp:LinkButton>--%>
                                           
                                      </ItemTemplate>
                                    </asp:TemplateField>
                                                                             <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Delete" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("CashFlowChartId")%>' OnClick="lnkDelete_Click">
                                                    <i class="material-icons">delete</i></asp:LinkButton>
                                           </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                 

                                </Columns>
                            </asp:GridView>
                            </div>
                                </div>
                                       

                                    

                                </div><!-- end card body -->
                            </div><!-- end card -->
                        </div><!-- end col -->

                        <!-- end col -->
                    </div>
                    </asp:Panel>

                </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->


            
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!--select2 cdn-->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<%--    <script src="https://themesbrand.com/velzon/html/galaxy/assets/js/pages/select2.init.js"></script>--%>
<script src="../assets/js/pages/select2.init.js"></script>
    <!-- App js -->

            <link href="../dist/chosen/chosen.css" rel="stylesheet" />
    <script src="../dist/chosen/chosen.jquery.js"></script>
    <script src="../dist/chosen/chosen.jquery.min.js"></script>
<%--    <script src="../ckeditor/build-config.js"></script>
    <script src="../ckeditor/config.js"></script>
    <link href="../ckeditor/contents.css" rel="stylesheet" />
    <script src="../ckeditor/styles.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>--%>

     <style>
     .abc {
        border: 5px solid #333;
        border-radius: 14px;
        padding: 10px;
        height: 200px;
     }
      .col-md-12.Header {
        font-size: 20px;
      }
      .mainhead {
        border: 5px solid #333;
        padding: 10px;
        border-radius: 15px;
        height: 350px;
        margin-top: 60px;
}
      .col-md-12.Main {
        font-size: 20px;
      }
.abd img {
    width: 180px;
/*    margin-left: -34px;
    margin-top: 30px;*/
}
      textarea#ContentPlaceHolder1_TextBox1 {
    
    border-radius: 5px;
    height: 90px;
}
      .col-md-2 {
    margin-top: 25px;
}
      .dc {
    font-size: 15px;
    padding: 3px;
}
      .taskview {
    font-size: 25px;
    padding-bottom: 10px;
}
      .updatedetail {
    border: 2px solid rgba(0,0,0,0.08);
    border-radius: 5px;
    padding: 10px;
    height: 115px;
}
      .def {
    font-size: 22px;
}
      .fgh {
    width: 400px;
}
      .align {
    text-align: left;
}

    </style>
    <style>
         .hidden { display: none; }
      .visible { display: block; }
    </style>
         <%--<script>
             const showImageButton = document.getElementById("show-image-button");
             const myImage = document.getElementById("img");
             showImageButton.addEventListener("click", () => {
                 myImage.classList.toggle("visible");
             });
         </script>--%>
     
         <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">

      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script>
            $(document).ready(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy',minDate:0, changeYear: true, changeMonth: true, yearRange: "-10:+50" });

                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', minDate: 0, changeYear: true, changeMonth: true, yearRange: "-10:+50" });
                });

                debugger;
                var current = location.pathname.replace('/team/', '');
                $('.list li a').each(function () {
                    var $this = $(this);
                    // if the current path is like this link, make it active
                    if ($this.attr('href').indexOf(current) !== -1) {
                        debugger;
                        $this.closest('li').addClass('active');
                        $this.closest('ul').show();
                        var $thisu = $this.closest('ul');
                        if ($thisu.hasClass("ml-menu")) {
                            $thisu.parent().find('a').addClass('toggled');
                        }
                    }
                })
            });
    </script>
</asp:Content>

