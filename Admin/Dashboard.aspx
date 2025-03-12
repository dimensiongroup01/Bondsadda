<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

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
                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="UserManagement.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">User</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                    <span runat="server" id ="divUser">0</span>
                                                        </h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="users" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>
                                    <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                       <a href="Products.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Bullet Product</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                            <span runat="server" id ="divBullet">0</span></h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="list" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                           </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->

                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                             <a href="AddStaggeredProducts.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Staggered Product</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                            <span runat="server" id ="divStaggered">0</span></h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="list" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                 </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>

                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                             <a href="AddCumulativeProduct.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Cumulative Product</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                            <span runat="server" id ="divcumulative">0</span></h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="list" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                 </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>

                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="ViewRegisteredCustomer.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Customer</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                    <span runat="server" id ="divCustomer">0</span>
                                                        </h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="users" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>

                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="Partner.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Business Partner</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                    <span runat="server" id ="divPartners">0</span>
                                                        </h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="users" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>

                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="SellBond.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Total Approved Sell Bonds</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                    <span runat="server" id ="divSellBond">0</span>
                                                        </h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="list" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>


                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="BlogNews.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Total Blogs</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                            <span runat="server" id ="divBlog">0</span></h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="file" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>
                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="SubscriberDetails.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Total Subscribers</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                            <span runat="server" id ="divSubscriber">0</span></h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="users" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>
<%--                                    <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="ListBanner.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Today's Sale</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                            <span runat="server" id ="divBanners">14</span></h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="dollar-sign" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->
                                <!-- end row-->

                                
                                    <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="ListMainCategory.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Available Bonds</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                            <span runat="server" id ="divMainCategory">16</span>
                                                        </h2>
                                                        
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="list" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->
                                

                                    <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="ListPaymentGetway.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Monthly Sale</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                            <span runat="server" id ="divPaymentGetWay">54</span>

                                                        </h2>
                                                        </div>
                                                       
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="dollar-sign" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->
                                 <!-- end row-->

                                                             
                                    <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="ListAddOn.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Booked Bond</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                    <span runat="server" id ="divAddOn">25</span>
                                                        </h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="plus-circle" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div> <!-- end col-->

                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="ListAddOn.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Item In Cart</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                    <span runat="server" id ="Span1">12</span>
                                                        </h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="plus-circle" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>

                                <div class="col-md-3">
                                        <div class="card card-animate">
                                            <div class="card-body">
                                                <a href="ListAddOn.aspx">
                                                <div class="d-flex justify-content-between">
                                                    <div>
                                                        <p class="fw-medium text-muted mb-0">Transaction</p>
                                                        <h2 class="mt-4 ff-secondary fw-semibold">
                                                    <span runat="server" id ="Span2">40</span>
                                                        </h2>
                                                       
                                                    </div>
                                                    <div>
                                                        <div class="avatar-sm flex-shrink-0">
                                                            <span class="avatar-title bg-soft-primary rounded-circle fs-2">
                                                                <i data-feather="plus-circle" class="text-primary"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </a>
                                            </div><!-- end card body -->
                                        </div> <!-- end card-->
                                    </div>--%>

                                

                                

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

