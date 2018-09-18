<!doctype html>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qa.models.Book"%>
<%@ page import="com.qa.models.Customer" %>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bananabooks - Shopping Cart</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<%
    double orderTotal = (Double) request.getAttribute("order_total");
    ArrayList<Book> books = (ArrayList<Book>) session.getAttribute("filtered_books");
    Customer c = (Customer) session.getAttribute("logged_in_customer");

%>

<!-- Start Top Bar -->
<div class="top-bar">
    <div class="top-bar-left">
        <ul class="menu">
            <li><a href="/"><img src="images/LogoV1.png" width="100" height="100"/></a></li>
            
        </ul>
    </div>
    <div class="top-bar-right">

        <ul class="dropdown menu" data-dropdown-menu>
            <li id="cart_items"></li>
            <li class="has-submenu">
                <a href="/viewCart"> <img src="images/cart.jpg" width="50" height="50"/></a>
                <ul class="submenu menu vertical" data-submenu>
                    <li><a href="/viewCart"><img src="images/cart.jpg" width="50" height="50"/> View Cart </a></li>
                    <li><a href="/login">Register | Login</a></li>
                </ul>
            </li>
            <li><a href="/aboutUs">About Us</a></li>
            <li><a href="/contactUs">Contact</a></li>
        </ul>

    </div>
</div>
<!-- End Top Bar -->
<br>
<!-- You can now combine a row and column if you just need a 12 column row -->
<div class="row columns">
    <nav aria-label="You are here:" role="navigation">
        <ul class="breadcrumbs">

            
            <li>
                <span class="show-for-sr">Current: </span> Cart Details
            </li>
        </ul>
    </nav>
</div>

<div class="row">

    <div class="medium-6 columns">

        <h2> Shipping Address </h2>
        <div class="row small-up-shiping">

            <form action="checkoutProcess" method="post" id="checkout_form" data-parsley-validate="parsley">

                <div class="columns">
                    <label> First name * </label>
                    <input type="text" name="firstName" id="firstName" size="30" data-parsley-trigger="change" data-parsley-type="alphanum"     required/>
                </div>

                <div class="columns">
                    <label> Last name * </label>
                    <input type="text" name="lastName" id="lastName" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                </div>

                <div class="columns">
                    <label> Address * </label>
                    <input type="text" name="addressLine1" id="addressLine1" size="30" data-parsley-trigger="change" required/>
                </div>

                <div class="columns">
                    <label> City * </label>
                    <input type="text" name="city" id="city" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                </div>

                <div class="columns">
                    <label> Post/ZIP code * </label>
                    <input type="text" name="postcode" id="postcode" size="30" data-parsley-trigger="change" data-parsley-maxlength="7" required/>
                </div>

                <div class="columns">
                    <label> Country *</label>
                    <input type="text" name="country" id="country" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                </div>

                <div class="columns">
                    <label> Phone Number </label>
                    <input type="text" name="phone" id="phone" size="30" data-parsley-type="digits"     />
                </div>

                <input type="hidden" name="order_total" value="<%=orderTotal %>"/>
            <!--
            <div class="column">
              <input type="checkbox" name="same" id="same"/> My billing and shipping address are the same
            </div> -->

        </div>

        <div class="row small-up-4">

            <div class="column">

            </div>

        </div>

        <hr>

    </div>
    <div class="medium-6 large-5 columns">


        <!--  <div class="login_in_shipping">


        <div class="row">
          <div class="small-3 columns">
            <h4>Already have an account </h4>
            <p> Login to check out using your saved details </p>
            <label> Email * </label>
            <input type="text" name="email" placeholder="Enter your email ID" size="40"/>
             <label> Password * </label>
            <input type="password" name="password" placeholder="Enter your password" size="40"/>

           <input type="submit" id="login_submit" value="Login"/>

          </div>


       </div>

      </div> -->
        <%
            if (c == null){
        %>

        <h3>Already have an account? </h3>
        <p> Please login using saved details</p>

        <div class="row">

            <div class="small-3 columns">

                <!--     Email *
                   <input type="text" id="email" name="email" size="30"/>

                   Password *
                   <input type="password" id="password" name="password" size="30"/>  -->
                <a href="/loginThroughCheckout?order_total=<%=orderTotal%>" class="button large expanded">Login</a>
            </div>

        </div>

        <div class="row">
            <div class="small-3 columns">
                <label for="middle-label" class="middle">VAT </label>
            </div>
            <div class="small-3 columns">
                <label for="middle-label" class="middle">Applicable Tax </label>
            </div>

        </div>

        <div class="row">
            <div class="small-3 columns">
                <label for="middle-label" class="middle">Order Total  </label>
            </div>
            <div class="small-3 columns">

                <label for="middle-label" class="middle" id="order_total_label">$<%=orderTotal%></label>
            </div>

        </div>

        <%
            }
            else{
        %>
            <h1> Nice choice <%=c.getFirstName() %>! <h1>
                <h3>Order Summary </h3>
                <p> </p>

                <div class="row">

                <%
                    int i = 0;
                    for(Book book : books)
                    {
                    %>
                    <div class="row small-up-3">

                        <div class="column">
                            <%=book.getTitle()%>
                        </div>
                        <div class="column">
                            <img class="thumbnail" src="<%=book.getBookImage()%>"/>
                        </div>
                    </div>
                    <%
                            i++;
                        }
                    %>
                    <div class="small-3 columns">
                        <label for="middle-label" class="middle">Order Total  </label>
                    </div>
                    <div class="small-3 columns">
                        <label for="middle-label" class="middle" id="order_total_label">$<%=orderTotal%></label>
                    </div>
                </div>
                <div>
                    <input type="submit" class="button large expanded" value="Checkout"/>
                </div>
            </form>
            <%
            }
        %>

    </div>


    <%-- <input type="hidden" name="order_total" value="<%=orderTotal %>"/>
<input type="submit" class="button large expanded" value="Checkout"/> --%>

</div>

</div>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://parsleyjs.org/dist/parsley.min.js"></script>

<script src="js/elsevier.js"></script>
<script src="js/update_cart.js"></script>
<script>
    $(function () {
        $('#checkout_form').parsley().on('field:validated', function() {
            var ok = $('.parsley-error').length === 0;
            $('.bs-callout-info').toggleClass('hidden', !ok);
            $('.bs-callout-warning').toggleClass('hidden', ok);
        })
            .on('form:submit', function() {
                // form is valid
                return true;
            });
    });
</script>
<script>
    $(document).foundation();
</script>
</body>
</html>