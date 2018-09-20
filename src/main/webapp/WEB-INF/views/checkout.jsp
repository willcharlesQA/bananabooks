<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.qa.models.Book"%>
<%@ page import="com.qa.models.Customer" %>
<%@ page import="com.qa.models.Address" %>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Bananabooks - Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>

<%
    double orderTotal = (Double) request.getAttribute("order_total");
    Address address = (Address) request.getAttribute("address");
    ArrayList<Book> books = (ArrayList<Book>) session.getAttribute("filtered_books");
    Customer c = (Customer) session.getAttribute("logged_in_customer");

%>

<!-- Static navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/"><img src="images/LogoV1.png" width="125"/></a>
        <form class="form-inline" action="/results">
    		<input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
    		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
  		</form>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="/aboutUs">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contactUs">Contact</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/login">Register | Login</a>
            </li>
            <li class="nav-item">
  				<a class="nav-link" href="/viewCart"><img src="images/cart.png" width="30"/></a>
  			</li>
          </ul>
        </div>
      </div>
    </nav>
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

        <h2> Address </h2>
        <div class="row small-up-shiping">

            <% if (address != null){
            %>
            <form action="confirmation" method="post" id="checkout_form" data-parsley-validate="parsley">

                <div class="columns">
                    <label> First name * </label>
                    <input value="<%=c.getFirstName()%>" type="text" name="first" id="first" size="30" data-parsley-trigger="change" data-parsley-type="alphanum"     required/>
                </div>

                <div class="columns">
                    <label> Last name * </label>
                    <input value="<%=c.getLastName()%>" type="text" name="last" id="last" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                </div>

                <div class="columns">
                    <label> Address line 1* </label>
                    <input value="<%=address.getAddressLine1()%>" type="text" name="addressLine1" id="addressLine1" size="30" data-parsley-trigger="change" required/>
                </div>

                <div class="columns">
                    <label> Address line 2* </label>
                    <input value="<%=address.getAddressLine2()%>" type="text" name="addressLine2" id="addressLine2" size="30" data-parsley-trigger="change" required/>
                </div>

                <div class="columns">
                    <label> City * </label>
                    <input value="<%=address.getCity()%>" type="text" name="city" id="city" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                </div>

                <div class="columns">
                    <label> Post/ZIP code * </label>
                    <input value="<%=address.getPostcode()%>" type="text" name="postcode" id="postcode" size="30" data-parsley-trigger="change" data-parsley-maxlength="7" required/>
                </div>

                <div class="columns">
                    <label> Country *</label>
                    <input value="<%=address.getCountry()%>" type="text" name="country" id="country" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                </div>

                <div class="columns">
                    <label> Phone Number </label>
                    <input value="<%=address.getPhoneNumber()%>" type="text" name="phone" id="phone" size="30" data-parsley-type="digits"     />
                </div>
                <%
                    } else{
                %>
                <form action="confirmation" method="post" id="checkout_form" data-parsley-validate="parsley">

                    <div class="columns">
                        <label> First name * </label>
                        <input type="text" name="first" id="first" size="30" data-parsley-trigger="change" data-parsley-type="alphanum"     required/>
                    </div>

                    <div class="columns">
                        <label> Last name * </label>
                        <input type="text" name="last" id="last" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                    </div>

                    <div class="columns">
                        <label> Address line 1* </label>
                        <input type="text" name="addressLine1" id="addressLine1" size="30" data-parsley-trigger="change" required/>
                    </div>

                    <div class="columns">
                        <label> Address line 2* </label>
                        <input type="text" name="addressLine2" id="addressLine2" size="30" data-parsley-trigger="change" required/>
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
                    <%
                        }
                    %>
                <input type="hidden" name="order_total" value="<%=orderTotal %>"/>
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
                <form action="loginCheckout" method="post" id="login_form">

                    <label>Email ID * </label>
                    <input type="email" placeholder="Enter email" name="email" id="email" data-parsley-trigger="change" required/>
                    <label>Password * </label>
                    <input type="password" placeholder="Enter Password" name="password" id="password" data-parsley-trigger="change" required/>
                    <input type="submit" class="button expanded" value="Login">

                </form>
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
       
					<input type="hidden" name="order_total" value="<%=orderTotal %>"/>   
			        <input type="submit" class="button large expanded" value="Proceed to Confirmation"/>
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