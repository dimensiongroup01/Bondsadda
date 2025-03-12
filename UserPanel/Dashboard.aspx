<%@ Page Title="" Language="C#" MasterPageFile="~/UserPanel/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="UserPanel_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        p.fw-medium.text-muted.mb-0 {
    font-size: 15px;
}
        .mg {
    height: auto;
}
        .d-flex.justify-content-between {
    margin-left: 10px;
}
 span.avatar-title.bg-soft-primary.rounded-circle.fs-1 {
    margin-left: -25px;
}
 .text-primary {
    --vz-text-opacity: 1;
     color: gray!important; 
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main-content">

            <div class="page-content">
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Dashboard</h4>

                                

                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                         <!-- end col-->

                        <div class="col-md-12">
                            <div class="row">

                                    <div class="col-md-12">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <h3 class="mt-4 ff-secondary fw-semibold">Recent News</h3>
                                                        <h4 class="fw-medium text-muted mb-0">
                                                            <span runat="server" id ="divSales">The success of your new product press release getting published in the news can often decide on the success of your product/sales and can prove key to your PR and marketing strategy.</span></h4>
                                                       
                                                    </div>
                                                    <div>
                                                        
                                                    </div>
                                                </div>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->

                                    <div class="col-md-12">
                                        <div class="card card-animate">
                                            <div class="card-body">

                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <h3 class="mt-4 ff-secondary fw-semibold">Top Bonds</h3>
                                                        <h4 class="fw-medium text-muted mb-0">
                                                            <span runat="server" id ="divBanners">Nokia,Apple,Dell</span></h4>
                                                       
                                                    </div>
                                                    
                                                </div>
                                                   
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->
                                <!-- end row-->

                                
                                    <div class="col-md-12">
                                        <div class="card card-animate">
                                            <div class="card-body">

                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <h3 class="mt-4 ff-secondary fw-semibold">Recent Bonds</h3>
                                                        <h4 class="fw-medium text-muted mb-0">
                                                            <span runat="server" id ="divMainCategory">Redmi,Realme,Lenovo</span>
                                                        </h4>
                                                        
                                                    </div>
                                                    
                                                </div>
                                                   
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->
                                

                                    <div class="col-md-12">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <h3 class="mt-4 ff-secondary fw-semibold">Highest Return Bonds</h3>
                                                        <h4 class="fw-medium text-muted mb-0">
                                                            <span runat="server" id ="divPaymentGetWay">In this time there is no any highest return bonds.</span>

                                                        </h4>
                                                        </div>
                                                       
                                                    
                                                </div>
                                                    
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->
                                 <!-- end row-->

                                                             
                                     <!-- end col-->

                                <!-- end row-->
                                </div>
                                

                        </div><!-- end col -->
                    </div><!-- end row-->

                </div>
                <!-- container-fluid -->
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

