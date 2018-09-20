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
    <link rel="stylesheet" href="css/style.css">

</head>
<body>

<%
    double orderTotal = (Double) request.getAttribute("order_total");
    Address address = (Address) request.getAttribute("address");
    ArrayList<Book> books = (ArrayList<Book>) session.getAttribute("filtered_books");
    Customer c = (Customer) session.getAttribute("logged_in_customer");
%>

<!-- Start Top Bar -->
<div class="top-bar">
    <div class="top-bar-left">
        <ul class="menu">
            <li class="menu-text" style="color:red">Online Shopping</li>
            <li><a href="/">Home</a></li>
            <li><form action="/results">
      			<input type="text" placeholder="Search.." name="search">
      			<button type="submit">Submit</button>
    		</form></li>
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
					    data-image="images/LogoV1.png"
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