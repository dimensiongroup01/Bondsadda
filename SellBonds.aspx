<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="SellBonds.aspx.cs" Inherits="SellBonds" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .upload label {
            cursor: pointer;
            /* Style as you please, it will become the visible UI component. */
            
        }

        .upload #upload-photo {
            opacity: 1;
            /* position: absolute; */
            border: 3px dashed lightgray ;
            z-index: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ContentTemplate>
    <div class="container">
            <div class="row">
                <div class="col-12 py-md-5 py-4 text-center">

                    
                    <div class="jumbotron box">
                        <h1 class="h3 font-weight-normal color1">SELL <span class="color2">BOND</span> </h1>
               
                        <div class="form-box px-lg-5">
                           
                            <div class="text-left font_2 ">
                                <div class="row">
                                    <div class="form-group col-md-4 mb-md-3 mb-0">
                                        <label for="exampleFormControlInput1">Category Name<span style="color:red">*</span></label>
                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-0">
                                        <label for="exampleFormControlInput1">Security<span style="color:red">*</span></label>
                                          <asp:TextBox ID="txtProductName" runat="server" class="form-control"
                                            ></asp:TextBox>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">ISIN Number<span style="color:red">*</span></label>
                                        <asp:TextBox ID="txtISINNumber" runat="server" class=" form-control"
                                            placeholder=""></asp:TextBox>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Coupon Rate(%)<span style="color:red">*</span></label>
                                        <asp:TextBox ID="txtCouponRate" runat="server" class=" form-control"
                                            placeholder=""></asp:TextBox>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Yield(%)<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtYield" runat="server" class="form-control"
                                            ></asp:TextBox>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">IP Frequency<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtIPFrequency" runat="server" class=" form-control datepicker"
                                            placeholder=""></asp:TextBox>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="form-group col-md-4 mb-md-3 mb-0">
                                        <label for="exampleFormControlInput1">PaymentType/Frequency<span style="color:red">*</span></label>
                                        <asp:DropDownList ID="ddlPaymentType" runat="server" CssClass="form-control"></asp:DropDownList>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    

                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Maturity Date<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtMaturityDate" runat="server" class=" form-control datepicker"
                                            placeholder=""></asp:TextBox>
                                    </div>
                                   <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">YTC/Yield Semi</label>
                                        <asp:TextBox ID ="txtYieldSemi" runat="server" class=" form-control"
                                            placeholder=""></asp:TextBox>
                                    </div>
                                </div>
                                <hr>
                                <%--<div class="row">
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Credit Rating<span style="color:red">*</span></label>
                                        <asp:DropDownList ID="ddlCreditRating" runat="server" CssClass="form-control"></asp:DropDownList>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Rating Agencies<span style="color:red">*</span></label>
                                  <asp:DropDownList ID="ddlRatingAgencies" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>

                                    
                                   
                                </div>--%>
                                <hr />
                                <div class="row">
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Put/Call Date</label>
                                        <asp:TextBox ID ="txtPutCallDate" runat="server" class=" form-control datepicker"
                                            placeholder=""></asp:TextBox>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Rate/Price<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtRate" runat="server" class="form-control"
                                            placeholder=""></asp:TextBox>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Face Value For Bond<span style="color:red">*</span></label>
                                        <asp:TextBox ID ="txtFacevalueBond" runat="server" class=" form-control"
                                            placeholder=""></asp:TextBox>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Call Date</label>
                                        <asp:TextBox ID ="txtCallDate" runat="server" class=" form-control datepicker"
                                            placeholder=""></asp:TextBox>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1">Guaranteed By<span style="color:red">*</span></label>
                                        <asp:DropDownList ID="ddlGuaranteed" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="" Selected="True">Choose one</asp:ListItem>
                                            <asp:ListItem Value="State Govt.">State Govt.</asp:ListItem>
                                            <asp:ListItem Value="Central Govt.">Central Govt.</asp:ListItem>
                                        </asp:DropDownList>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%>
                                    </div>
                                    
                                    

                                </div>
                                <hr>
                                <%--<div class="row upload">
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="exampleFormControlInput1 ">Data Status</label>
                                        <asp:DropDownList ID="ddlDataStatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="" Selected="True">Choose One</asp:ListItem>
                                            <asp:ListItem Value="Secured">Secured</asp:ListItem>
                                            <asp:ListItem Value="UnSecured">UnSecured</asp:ListItem>
                                        </asp:DropDownList>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="upload-photo">Product Image</label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                         <progress id="AdharfileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfAdharFilePath" runat="server" />
                                       <%-- <input type="file" class="form-control" id="upload-photo"
                                            placeholder="">--%>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--
                                    </div>
                                    <div class="form-group col-md-4 mb-md-3 mb-3">
                                        <label for="upload-photo">Product File</label>
                                        <asp:FileUpload ID="FileUpload2" runat="server" CssClass="form-control" />
                                         <progress id="PANfileProgress" style="display: none"></progress>
                      <asp:HiddenField ID="hfPANFilePath" runat="server" />
                                     <%--   <input type="file" class="form-control" id="upload-photo"
                                            placeholder="">--%>
<%--                                        <small id="emailHelp" class="form-text text-muted"></small>--%
                                    </div>
                                </div>--%>
                                <div class="text-center">
                                    <asp:LinkButton ID="lnkSubmit" runat="server" CssClass="btn btn1" OnClick="lnkSubmit_Click">Submit</asp:LinkButton>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        </ContentTemplate>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

                <link href="chosen/chosen.css" rel="stylesheet" />
    <script src="chosen/chosen.jquery.js"></script>
    <script src="chosen/chosen.jquery.min.js"></script>

       <script>
            $(document).ready(function () {
                $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-10:+50" });
                $(".chosen").chosen();

                var prm = Sys.WebForms.PageRequestManager.getInstance();
                prm.add_endRequest(function () {
                    $(".datepicker").datepicker({ dateFormat: 'dd/mm/yy', changeYear: true, changeMonth: true, yearRange: "-10:+50" });
                    $(".chosen").chosen();
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

