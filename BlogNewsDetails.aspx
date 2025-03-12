<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="BlogNewsDetails.aspx.cs" Inherits="BlogNewsDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        label.form-check-label {
            padding: 5px;
        }

        span .button {
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="SM1" EnableCdn="true" runat="server"></asp:ScriptManager>
    <section class="py-md-5 py-4">
        <div class="container">
            <div class="row">

                <div class="col-lg-8">
                    <asp:Repeater ID="rptBlogDetails" runat="server">
                        <ItemTemplate>
                            <div class="post-main-box">
                                <div class="blog-featured-image box">


                                    <div class="overlay p-md-4 py-3">
                                        <p class="mb-0">Date: <%#Eval("BlogDate") %> | Author: <%#Eval("AuthorBy") %></p>
                                        <h1 class="h4 font-weight-normal"><%#Eval("BlogTitle") %>: <%#Eval("BlogSubTitle") %></h1>
                                    </div>
                                    <%--                            <img src="img/blog/blog1.png" class="col-12 p-0 border-0" alt="">--%>
                                    <img src='<%#Eval("BlogImage").ToString().Replace("~/","") %>' class="col-12 p-0 border-0" alt="" />
                                </div>
                                <div class="content-area">
                                    <div class="summery py-md-5 px-md-1 py-4">
                                        <p class="h6"><q><i><%#Eval("MetaDescription") %></i></q></p>
                                    </div>
                                    <p><%#Eval("Description") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <%--<div class="col-lg-8">
                    <div class="post-main-box">
                        <div class="blog-featured-image box">

                            
                            <div class="overlay p-md-4 py-3">
                                <p class="mb-0">Date: 20 June 2022 | Author: Admin | Investment</p>
                                <h1 class="h4 font-weight-normal">Sovereign Gold Bond Scheme 2023-24: An Attractive Investment Opportunity</h1>
                            </div>
                            <img src="img/blog/blog1.png" class="col-12 p-0 border-0" alt="">
                        </div>
                        <div class="content-area">
                            <div class="summery py-md-5 px-md-1 py-4">
                                <p class="h6"><q><i>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et nam repellendus aliquid eveniet a earum aspernatur quis culpa! Sed suscipit exercitationem tenetur animi porro, veritatis minus facilis odio fuga perspiciatis.</i></q></p>
                            </div>
                            <p>Top 6 Telegram Channels For Crypto Trading Trading the cryptocurrencies definitely needs a lot of extensive research and analysis of the market. However, with the help of telegram channels you will be free from doing all the research all alone as the telegram admins will do all the research and help you with your trading game in the markets. In this article, we will suggest you the best telegram channels for crypto trading. Read this article and select the telegram channel which suits you the best.</p>

<p> Post content  1. Crypto Signals  2. Learn 2 Trade Crypto  3. Wolfx Signals  4. Alt Signals  5. MYC Signals  6. Onward BTC Here are few points which you need to consider while judging telegram channels: Subscribers Count: Subscriber count plays a major role in winning the trust of new members as they will give assurance that a lot of people are using their services and it builds the confidence. Success Rate: No matter how many groups you join. Ultimately everything boils down to the win rates and if the group is able to make its clients profitable. Transparency: Before joining any group, make sure that the group you are willing to join &lsquo;practice what they preach&rsquo;. Simply means, they should provide what they claim. By this, you will get the best crypto signals telegram channels according to your needs.</p>

<p> 1. Crypto Signals View Channel If you are looking for a crypto telegram channel which will satisfy all your needs then CryptoSignals.org is the right channel which you can choose to join right now. From investment decisions to daily and weekly trading calls. They are there to help you out completely. With over 44000+ subscribers they have been successful in making their clients profitable and happy too. In their free group they provide 2-3 trading calls weekly, and 12 calls monthly. However, if you opt for the VIP paid group you will get 3X calls than the free one with a success rate of 82%.</p>

<p> 2. Learn 2 Trade Crypto View Channel If you&rsquo;re looking for a place where you can get all the bitcoin and altcoin related trade ideas then learn2trade is the right option for you. A team of professionals with over 15 years of experience in the markets are able to serve daily 10000 subscribers. Their analysis is provided in the group and 2-3 trade ideas per week are posted in the free group. If you subscribe to their VIP channel you will get 3-5 trade ideas daily and 17-18 ideas weekly. If you want to level up your trading journey, then we highly recommend you to join their VIP paid group (details are in the free group) to benefit 4X in the market.</p>

<p> 3. Wolfx Signals View Channel If you are looking for a hassle-free crypto telegram group which can make you loads of profit then WOFFX signals is the right telegram channel for you. The USP of this group is that it provides ALGO-TRADING in more than 50 cryptocurrencies for people who don&rsquo;t have enough time to execute buy/sell orders. They are successful in serving 58000 clients in their free group and have grown exponentially. They also have a premium group where they charge you nominal monthly subscription fee in which they provide 2-3 trade signals daily along with entry point, stop-loss, and target. As a trader and investor, going for their premium subscription can be one of your best investments so far.</p>

<p> 4. Alt Signals View Channel This can be another option if you are interested in automated trading. I.e. algo-trading. Alt Signals is the best telegram channel for having clear results in your trading journey. With over 50000 subscribers they are able to gain a retention rate of over 75%. Till now they have provided 4000+ signals in their free group. Their mission isn&rsquo;t restricted to only trade ideas but they also want to coach traders to become more efficient in the markets. They have a very positive approach to the market and they will definitely help you hone your trading skills.</p>

<p>5. MYC Signals View Channel MYC signals is a leading crypto signals platform by cryptomeria- one of the leading crypto education websites. With the vision of empowering retail traders, they have been successful in serving 39000 clients at the time of writing. Their team experts provide 50-60 trade signals monthly which means 1-2 signals daily. And trust us, all trades are 90% profitable. So, if you seriously want to encash profits, do consider subscribing to their telegram channel.</p>

<p> 6. Onward BTC View Channel There are many telegram channels who offer profitable signals to their clients but there is a team of Onward BTC group which offers 9 different telegram channels for their clients to join as per there trading needs which are comprises of profitable setups and trading robots. The onward BTC platform was launched back in 2019 and it is currently handled by four market experts. The onward BTC&rsquo;s subscription is priced at $19.50 per month, allowing access to all the offered groups. In addition to their services their Onward BTC group supports Cornix, an automated trading robot which works best with the telegram signals. This means when you receive a trading signal in the group it will automatically place order on your behalf in case if you missed it to place manually. Ultimately the goal of the onward BTC is to make their traders profitable.</p>
                        </div>
                    </div>
                </div>--%>
                <div class="col-lg-4 pr-md-0">
                    <div class="main-box px-3 ">
                        <div class="row">
                            <div class="box p-4 col-lg-12 col-md-6 font_2">
                                <h2 class="h4 font-weight-normal color2">Filter</h2>
                                <hr>
                                <div class="bond-category">
                                    <h4 class="h6 font-weight-normal">Type of Bonds:</h4>

                                    <div action="" method="get">
                                        <asp:Repeater ID="rptTags" runat="server">
                                            <ItemTemplate>

                                                <asp:LinkButton ID="lnkdetail" runat="server"  style="text-decoration: none; color: #000;" CommandArgument='<%#Eval("BlogCategoryId") %>' OnClick="lnkdetail_Click"><%#Eval("BlogcategoryHead") %></asp:LinkButton>

<%--                                                <a style="text-decoration: none; color: #000;"
                                                    href="<%=ResolveUrl("~")%>BlogNewsData?oId=<%#Eval("BlogCategoryId") %>"><%#Eval("BlogcategoryHead") %></a>--%>
                                                <br />


                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>
                                </div>
                                <hr>
                                <div class="bond-rating">
                                    <h4 class="h6 font-weight-normal">Blog Tags</h4>
                                    <span class="button">
                                        <asp:Repeater ID="rptCreditRating" runat="server">
                                            <ItemTemplate>

                                                <asp:Button ID="btnCredit" runat="server" CssClass="button" OnClick="btnCredit_Click" CommandArgument='<%#Eval("TagsId") %>' Text='<%#Eval("TagsHead") %>' />

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </span>

                                </div>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <asp:UpdatePanel ID="uPanel" runat="server">
        <ContentTemplate>
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
                                            <p>
                                                DON’T FALL BEHIND<br />
                                                Stay current with a recap of today’s computing news from digital trend by bonds adda.
                                            </p>
                                            <div class="form-inline row">
                                                <div
                                                    class="form-group col-md-8 mb-2 pr-md-0">
                                                    <asp:TextBox ID="txtEmail" runat="server"
                                                        class="form-control col-12"
                                                        placeholder="Enter your Email Address"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4 mb-2 pl-md-0">
                                                    <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe Now"
                                                        class="btn btn-dark col-12 " OnClick="btnSubscribe_Click"></asp:Button>

                                                </div>

                                            </div>
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
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

