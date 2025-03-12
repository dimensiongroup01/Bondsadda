<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="BlogNewsData.aspx.cs" Inherits="BlogNewsData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        img.col-12.p-0 {
    height: 200px;
}
        span.abcd {
      overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-box;
   -webkit-line-clamp: 2; /* number of lines to show */
           line-clamp: 2;
   -webkit-box-orient: vertical;
}

                span.defg {
      overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-box;
   -webkit-line-clamp: 4; /* number of lines to show */
           line-clamp: 4;
   -webkit-box-orient: vertical;
}


/*
     .box span {
    font-size: 25px;
    font-weight: 600;
    text-align:center;
    padding-left:25px;
}*/
     label.form-check-label {
    padding: 5px;
}
                    span .button{
                   background: none;
    margin-bottom: 4px;
    padding: 5px 15px;
    border: none;
    font-size: 14px;
    border-radius: 5px;
    background: #e7fde9;
    border: 2px solid #02a713;
    color: #02a713;
    cursor: pointer
               }
                    a:hover {
   
    text-decoration: blink !important;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="SM1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <asp:HiddenField ID ="hfDataa" runat="server" />
    <section class="breadcrumb-collection  py-md-4 gradient">
            <div class="container">
                <div class="row">
                    <div class="col-12 p-md-3 p-0">
                        <div
                            class="breadcrumbs py-md-2 pt-md-3 px-md-5 pt-3 py-2  px-3 text-white">
                            <h1 class="h3 font-weight-normal ">News</h1>
                            <p class=" font_2">Home / News</p>
                        </div>
                    </div>
                </div>
                
            </div>
        </section>
        <section class="news-page mb-md-5 mb-3">
            <div class="container">
                <div class="row">

                        <div class="col-md-8">
                                                        <div class="row">
                        <asp:Repeater ID ="rptNews" runat="server">
                            <ItemTemplate>

                                    <div class="col-md-6 py-2">
                                <div class="box">
                                    <img src='<%#Eval("BlogImage").ToString().Replace("~/","") %>' class="col-12 p-0" alt="" />
                                    <div class="details p-3 ">
                                        <small class="text-danger font_2"><strong> Date:</strong> <%--20 June  2022--%><%#Eval("BlogDate") %> | <strong> Author:</strong> <%--Admin | Investment--%><%#Eval("AuthorBy") %> </small>
                                        <span class="abcd">
                                            <a href="<%=ResolveUrl("~")%>BlogNewsDetails?oId=<%#Eval("BlogId") %>">
                           <h4 class="h5 font_2 font-weight-normal" style="color:black; text-decoration:blink;"><%--Sovereign Gold Bond Scheme 2023-24--%><%#Eval("BlogTitle") %>:  <%--An Attractive Investment Opportunity--%> <%#Eval("BlogSubTitle") %></h4></a>
                                             </span>
                                        <span class="defg">
                                                                                    <p><small><%--Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?--%> <%#Eval("MetaDescription") %></small></p>
                                        </span>
                                        <asp:LinkButton ID="lnkviewdetails" runat="server" CssClass="color1 font_1" CommandArgument='<%#Eval("BlogId") %>' OnClick="lnkviewdetails_Click">Read More</asp:LinkButton>
<%--                                        <a href="<%=ResolveUrl("~")%>BlogNewsDetails?oId=<%#Eval("BlogId") %>" class="color1 font_1">Read More</a>--%>
                                    </div>
                                </div>
                            </div>
                                
                            </ItemTemplate>
                        </asp:Repeater>


                                                            <%--<asp:Panel ID="pnlDefailBlog" runat="server">
                                                                  <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
    <source src="mp4/bg.mp4" type="video/mp4">
  </video>

  <div class="masthead">
    <div class="masthead-bg"></div>
    <div class="container h-100">
      <div class="row h-100">
        <div class="col-12 my-auto">
          <div class="masthead-content text-white py-5 py-md-0">
            <h1 class="mb-3">Coming Soon!</h1>
            <p class="mb-5">We're working hard to finish the development of website.<br /> Have patience and wait till launching!</p>
            <img src="logo.png" class="img-thumbnail" />
          </div>
        </div>
      </div>
    </div>
  </div>
                                                            </asp:Panel>--%>
                                                            </div>
                        <%--<div class="row">
                            <div class="col-md-6 py-2">
                                <div class="box">
                                    <img src="img/blog/blog1.png" class="col-12 p-0" alt="">
                                    <div class="details p-3 ">
                                        <small class="text-danger font_2"><strong> Date:</strong> 20 June  2022 | <strong> Author:</strong> Admin | Investment </small>
                                        <h4 class="h5 font_2 font-weight-normal">Sovereign Gold Bond Scheme 2023-24:  An Attractive Investment Opportunity</h4>
                                        <p><small>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?</small></p>
                                        <a href="#" class="color1 font_1">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 py-2">
                                <div class="box">
                                    <img src="img/blog/blog1.png" class="col-12 p-0" alt="">
                                    <div class="details p-3 ">
                                        <small class="text-danger font_2"><strong> Date:</strong> 20 June  2022 | <strong> Author:</strong> Admin | Investment </small>
                                        <h4 class="h5 font_2 font-weight-normal">Sovereign Gold Bond Scheme 2023-24:  An Attractive Investment Opportunity</h4>
                                        <p><small>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?</small></p>
                                        <a href="#" class="color1 font_1">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 py-2">
                                <div class="box">
                                    <img src="img/blog/blog1.png" class="col-12 p-0" alt="">
                                    <div class="details p-3 ">
                                        <small class="text-danger font_2"><strong> Date:</strong> 20 June  2022 | <strong> Author:</strong> Admin | Investment </small>
                                        <h4 class="h5 font_2 font-weight-normal">Sovereign Gold Bond Scheme 2023-24:  An Attractive Investment Opportunity</h4>
                                        <p><small>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?</small></p>
                                        <a href="#" class="color1 font_1">Read More</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 py-2">
                                <div class="box">
                                    <img src="img/blog/blog1.png" class="col-12 p-0" alt="">
                                    <div class="details p-3 ">
                                        <small class="text-danger font_2"><strong> Date:</strong> 20 June  2022 | <strong> Author:</strong> Admin | Investment </small>
                                        <h4 class="h5 font_2 font-weight-normal">Sovereign Gold Bond Scheme 2023-24:  An Attractive Investment Opportunity</h4>
                                        <p><small>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi porro fugit nostrum, consequuntur magni quas nobis ullam minus ea repellendus maxime et in, consequatur sunt debitis rem, blanditiis placeat minima?</small></p>
                                        <a href="#" class="color1 font_1">Read More</a>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    
                    
                    <div class="col-md-4 pr-md-0">
                    <div class="main-box px-3 ">
                        <div class="row">
                            <div class="box p-4 col-lg-12 col-md-6 font_2">
                                <h2 class="h4 font-weight-normal color2">Filter</h2>
                                <hr>
                                <div class="bond-category">
                                    <h4 class="h6 font-weight-normal">Type of Bonds:</h4>
                                    
                                    <div action="" method="get">
                                        <asp:Repeater ID ="rptTags" runat="server" OnItemDataBound="rptCategory_ItemDataBound">
                                        <ItemTemplate>

                

                                                <asp:LinkButton ID="lnkdetail" runat="server"  style="text-decoration: none; color: #000;" CommandArgument='<%#Eval("BlogCategoryId") %>' OnClick="lnkdetail_Click"><%#Eval("BlogcategoryHead") %></asp:LinkButton>
                                              <br />
                                            
                                        
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    </div>
                                </div>
                                <hr>
                                <div class="bond-rating">
                                    <h4 class="h6 font-weight-normal">Blog Tags</h4>
                                                                                <span class="button">
                                    <asp:Repeater ID ="rptCreditRating" runat="server">
                                        <ItemTemplate>

                             <asp:Button ID ="btnCredit" runat="server" CssClass="button" OnClick="btnCredit_Click" CommandArgument='<%#Eval("TagsId") %>' Text='<%#Eval("TagsHead") %>' />
                                                
                                        </ItemTemplate>
                                    </asp:Repeater>
                                                                                    </span>

                                </div>
                                <hr>

                                

                            </div>
                        </div>
                    </div>
                </div>
                    <%--<div class="col-md-4 mt-md-2">
                        <div class="box p-4">
                            <div class="box ">
                                <div class="offer-banner bg-light p-2  text-dark">
                                   <p class=""> <span class="h4 font_2  ">Blog Categories</span></p>
<%--                                    <small>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias qui quibusdam molestias, ipsam cum, suscipit eius inventore sed explicabo eum cumque error perferendis consectetur optio libero unde, iusto ipsa dolorem.</small>---
                                     
                                    <asp:Repeater ID ="rptTagss" runat="server">
                                        <ItemTemplate>

                                              <ul class="ul_style">
                                                  <li>
                                                      <a style="text-decoration: none;
    color: #000;" href="BlogNewsDetails.aspx?oId=<%#Eval("BlogId") %>"><%#Eval("BlogcategoryHead") %></a>
                                                  </li>
                                              </ul>
                                                    
                                                
<%--                                                                               <span class="h3_style"><a style="text-decoration: none;" href="BlogNewsDetails.aspx?oId=<%#Eval("BlogId") %>"><%#Eval("BlogcategoryHead") %></a></span>---
                                            

                                        </ItemTemplate>
                                    </asp:Repeater>
                             
                                </div>
                            </div>
                            <div class="Recent-Post my-md-4 my-3">
                                <h2 class="h5 font-weight-normal py-2 color1">Latest <span class="color2">News</span></h2>
                                <div class="recent-post-list">
                                    <asp:Repeater ID ="rptNewsSide" runat="server">
                                        <ItemTemplate>
                                <a href="BlogNewsDetails.aspx?oId=<%#Eval("BlogId") %>" class="text-dark"><%#Eval("BlogTitle") %>: <%#Eval("BlogSubTitle") %></a>
                                    <hr>
                                        </ItemTemplate>
                                    </asp:Repeater> 
<%--                                <a href="" class="text-dark">Sovereign Gold Bond Scheme 2023-24: An Attractive Investment Opportunity</a>
                                    <hr>
                                    <a href="" class="text-dark">Sovereign Gold Bond Scheme 2023-24: An Attractive Investment Opportunity</a>
                                    <hr>
                                    <a href="" class="text-dark">Sovereign Gold Bond Scheme 2023-24: An Attractive Investment Opportunity</a>
                                    <hr>
                                    <a href="" class="text-dark">Sovereign Gold Bond Scheme 2023-24: An Attractive Investment Opportunity</a>
                                    <hr>
                                    <a href="" class="text-dark">Sovereign Gold Bond Scheme 2023-24: An Attractive Investment Opportunity</a>--
                                </div>
                            </div>
                            
                        </div>
                    </div>--%>
                
            </div>
                </div>
        </section>
        <section class="subscribe pb-md-5 pb-3">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="box2 ">
                            <div class="row">
                                <div
                                    class="col-md-7 p-md-5 p-5 text-md-left text-center d-flex justify-content-center align-items-center">
                                    <div
                                        class>
                                        <h2 class="font-weight-normal color1 h3">Subscribe
                                            to
                                            our <span class="color2">Newsletter</span></h2>
                                         <p>DON’T FALL BEHIND<br />
Stay current with a recap of today’s computing news from digital trend by bonds adda.</p>
                                        <asp:UpdatePanel ID ="uPnl" runat="server">
                                            <ContentTemplate>
                                                <div class="form-inline row">
                                            <div
                                                class="form-group col-md-8 mb-2 pr-md-0">
                                                <asp:TextBox ID ="txtEmail" runat="server"
                                                    class="form-control col-12"
                                                    
                                                    placeholder="Enter your Email Address"></asp:TextBox>
                                            </div>
                                            <div class="col-md-4 mb-2 pl-md-0">
                                                <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe Now"
                                                    class="btn btn-dark col-12 " OnClick="btnSubscribe_Click"></asp:Button>
                                            </div>
    
                                        </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        
                                    </div>
    
                                </div>
                                <div class="col-md-1"></div>
                                <div class="col-md-3 ">
                                    <img class="d-lg-block d-md-block d-none" src="img/news.svg" alt="">
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

