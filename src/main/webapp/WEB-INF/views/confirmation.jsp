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
<div class="container" style="padding-top:90px">
   	<div class="row">
	    <nav aria-label="breadcrumb">
		  	<ol class="breadcrumb" style="background:none">
		  		<li class="breadcrumb-item"><a href="#">Home</a></li>
			    <li class="breadcrumb-item active" aria-current="page">View Basket</li>
		  	</ol>
		</nav>
    </div>
    <div class="row">
	    <div class="col">
	        <h3> Shipping address confirmation </h3>
	            <p><%=c.getFirstName() + " " + c.getLastName()%><br>
	            <%=request.getParameter("addressLine1")%><br>
	            <%=request.getParameter("addressLine2")%><br>
	            <%=request.getParameter("city")%><br>
	            <%=request.getParameter("postcode")%><br>
	            <%=request.getParameter("country")%><br>
	            <%=request.getParameter("phone")%></p><br>
	        <hr>
	
	    </div>
	</div>
	<div class="row">
	    <div class="col">
	            <h3>Order Summary </h3>
	            <p> </p>
	
	            <div class="row">
					<ul class="list-unstyled" style="padding-left:20px">
               			<%
		                   int i = 0;
		                   for(Book book : books)
		                   {
		                 %>
	                   <li class="media my-2" >
	    					<img class="rounded" style="width:auto;height:30%" src="<%=book.getBookImage()%>"/>
		    				<div class="media-body" style="padding-left:20px">
			      				<h5 class="mt-0 mb-1"><%=book.getTitle()%></h5>
			      				ISBN: <%=book.geteBookISBN()%><br>
			      				Price: $<%=book.getPrice()%>
		    				</div>
		  				</li>
                   		<%
	                       i++;
	                       }
                   		%>
                   </ul>
               </div>
	    </div>
	    <div class="col">
	    	<dl class="row">
	  			<dt class="col-sm-8">Order Total</dt>
	  			<dd class="col-sm-4"><label id="order_total_label"><b>$<%=orderTotal%></b></label></dd>
	  		</dl>
	    	<div class="row">
	              <script
				    src="https://checkout.stripe.com/checkout.js" class="stripe-button"
				    data-key="pk_test_21SqCOUdFzdvifRrHfRFiV74"
				    data-amount="<%=orderTotal*100%>"
				    data-name="BananaBooks"
				    data-description="Please enter details below"
				    data-image="images/Bunch.png"
				    data-locale="auto">
	  				</script>
	  				<br>
	  			</div>
	    </div>

    <%-- <input type="hidden" name="order_total" value="<%=orderTotal %>"/>
<input type="submit" class="button large expanded" value="Checkout"/> --%>

</div>
</div>

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/elsevier.js"></script>
<script src="js/update_cart.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>