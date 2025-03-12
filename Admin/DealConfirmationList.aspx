<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="DealConfirmationList.aspx.cs" Inherits="Admin_DealConfirmationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
    <div class="main-content">


            <div class="page-content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">DEAL CONFIRMATION CHART</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">DEAL CONFIRMATION CHART</a></li>
                                        <li class="breadcrumb-item active">DEAL CONFIRMATION CHART</li>
                                    </ol>
                                </div>

                            </div>
                        </div>
                    </div>

                    <asp:Panel ID ="pnlView" runat="server">
                        <div class="row">

                            <div class="col-md-4">
                                <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                            <div class="col-md-12">
                                                            <br />
                            </div>


                        <div class="col-xl-12">
                            <div class="card card-height-100">
                                
                                <!-- end cardheader -->

                                    
                                <div class="card-body">


                                      <div class="table-responsive table-card">
                            
                            <div class="col-md-12" runat="server" id="Div3">
                                <asp:GridView ID="grdData" runat="server" CssClass="table table-nowrap table-centered align-middle" HeaderStyle-CssClass="fixedheader" AutoGenerateColumns="false" BorderStyle="None" BorderWidth="0" ShowHeaderWhenEmpty="true"
                                EmptyDataText="No Records Available..!!!" EmptyDataRowStyle-HorizontalAlign="Center" EmptyDataRowStyle-VerticalAlign="Middle" EmptyDataRowStyle-Height="320">
                                <Columns>

                                    <asp:TemplateField HeaderText="S.N.">
                                        <ItemTemplate>
                                            <strong><%#Container.DataItemIndex+1 %></strong>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("EntryDate")%>
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

                                  <asp:TemplateField HeaderText="Redemption Type" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("MaturityType")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                               <asp:TemplateField HeaderText="IP Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DLastIPDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="Price" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DRate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="YTM" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("YTM") %> %
                                        </ItemTemplate>
                                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Face Value For Bond(Rs.)" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("FacevalueForBond") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 <asp:TemplateField HeaderText="PaymentType/Frequency" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("PaymentTypeHead") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sattlement Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DSattlementDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Face Value For Deal(Rs.)" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DDealValue") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Quantity" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DQuantity") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="PutDate" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("PutCallDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                             <asp:TemplateField HeaderText="Call Date" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("CallDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="No Of Days" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DNoOfDays") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Principal Amount(Rs.)" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DPrincipalAmount") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                              <asp:TemplateField HeaderText="Total Interested(Rs.)" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DAccuredInterest") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                              <asp:TemplateField HeaderText="Gross Consideration(Rs.)" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DGrossConsideration") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                            <asp:TemplateField HeaderText="Stamp(Rs.)" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DStampDuty") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Consideration with Stamp(Rs.)" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                           
                                            <%#Eval("DConsiderationStamp") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      



<%--                                         <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Action" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                              <asp:CheckBox ID="chkIsActive"  runat="server" Checked='<%#Eval("IsActive")%>' ToolTip='<%#Eval("CloseDealId")%>'
                                                        OnCheckedChanged="chkIsActive_CheckedChanged" AutoPostBack="true" />
<%--                                 <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("CashFlowChartId")%>' OnClick="lnkEdit_Click">
                                                    <i class="material-icons">border_color</i></asp:LinkButton>--%
                                           
                                      </ItemTemplate>
                                    </asp:TemplateField>
                                                                             <asp:TemplateField  ItemStyle-HorizontalAlign="Center" HeaderText="Delete" HeaderStyle-CssClass="hidecolum" ItemStyle-CssClass="hidecolum" HeaderStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                             <asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("CloseDealId")%>' OnClick="lnkDelete_Click">
                                                    <i class="material-icons">delete</i></asp:LinkButton>
                                           </ItemTemplate>
                                    </asp:TemplateField>--%>
                                  
                                 

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

