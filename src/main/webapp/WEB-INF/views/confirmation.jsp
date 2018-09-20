<!doctype html>
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
        <a class="navbar-brand" href="/"><img src="images/LogoHQ.png" width="125"/></a>
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

            <li><a href="/">Home</a></li>
            <li>
                <span class="show-for-sr">Current: </span> Cart Details
            </li>
        </ul>
    </nav>
</div>

<div class="row">

    <div class="medium-6 columns">
        <h3> Shipping address confirmation </h3>
        <div class="row small-up-shiping">
            <p><%=c.getFirstName() + " " + c.getLastName()%></p>
            <p><%=request.getParameter("addressLine1")%></p>
            <p><%=request.getParameter("addressLine2")%></p>
            <p><%=request.getParameter("city")%></p>
            <p><%=request.getParameter("postcode")%></p>
            <p><%=request.getParameter("country")%></p>
            <p><%=request.getParameter("phone")%></p>
        </div>
        <hr>

    </div>
    <div class="medium-6 large-5 columns">

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
                    <!--  <input type="submit" class="button large expanded" value="Checkout"/> -->
                  <script
					    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
					    data-key="pk_test_21SqCOUdFzdvifRrHfRFiV74"
					    data-amount="<%=orderTotal*100%>"
					    data-name="BananaBooks"
					    data-description="Please enter details below"
					    data-image="images/Bunch.png"
					    data-locale="auto">
				  </script>
                </div>

    </div>

    <%-- <input type="hidden" name="order_total" value="<%=orderTotal %>"/>
<input type="submit" class="button large expanded" value="Checkout"/> --%>

</div>

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/elsevier.js"></script>
<script src="js/update_cart.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>