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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    
    
  </head>
  <body>
  
    <%
        ArrayList<Book> books  = (ArrayList<Book>) session.getAttribute("filtered_books");
        Map<Integer,Integer>bookCounts = (Map<Integer,Integer>)  session.getAttribute("book_counts");
        Customer c = (Customer) session.getAttribute("logged_in_customer");
        double cartTotal = 0.0;
        double orderTotal = 0.0;
        double totalPrice =  0.0;
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
    	<div class="col-lg-8">
    		<ul class="list-unstyled">
	    		<%
			    int i = 0;
			    for(Book book : books)
			    {
			  	  int quantity = bookCounts.get(book.getBookId());
			  	  double price = book.getPrice();
			  	  
			  	  totalPrice = book.getPrice() * quantity;
			  	  cartTotal = cartTotal + book.getPrice()*quantity;
			  	  System.out.println("Cart Total "+cartTotal);
			    %>
	    		<li class="media my-4">
	    			<img class="rounded" style="width:auto;height:70%" src="<%=book.getBookImage()%>"/>
	    			<div class="media-body" style="padding-left:20px">
		      			<h5 class="mt-0 mb-1"><%=book.getTitle()%></h5>
		      			ISBN: <%=book.geteBookISBN()%>
		      			<form name="f1">
			            	<input type="hidden" name="price" value="<%=price%>"/>
			            	<input type="hidden" name="cart_total" value="<%=cartTotal%>"/>
			            	Price: <label id="price_label<%=i%>">$<%=totalPrice%></label>
			            	<input type="hidden" name="cart_total" value="<%=price%>"/>
			            	
				           	<div class="input-group mb-2">
								<div class="input-group-prepend">
									<div class="input-group-text">Quantity</div>
								</div>
								<input type="number"  min="1" name="quantity" value="<%=quantity%>" style="text-align:center" oninput="calculateTotalPrice(price.value,this,price_label<%=i%>)"/>
						    </div>
			            </form>
			            <a href="/removeFromCart?bookId=<%=book.getBookId() %>" class="btn btn-secondary btn-md active" role="button" aria-pressed="true">Remove</a>
	    			</div>
	  			</li>
	  		</ul>
        	<hr>
      <% i++;}%>
      </div>
      <div class="col-lg-4">
      		<h4>Order Summary</h4>
      		<dl class="row">
	  			<dt class="col-sm-8">Cart Total</dt>
	  			<dd class="col-sm-4"><label id="cart_total_label">$<%=cartTotal%></label></dd>
	  			<dt class="col-sm-8">Applicable Tax</dt>
	  			<dd class="col-sm-4">VAT</dd>
	  			<dt class="col-sm-8"><br></dt>
	  			<dd class="col-sm-4"></dd>
	  			<dt class="col-sm-8">Order Total</dt>
	  			<dd class="col-sm-4"><label id="order_total_label"><b>$<%=cartTotal%></b></label></dd>
  			</dl>
      
        <input type="hidden" name="order_total" id="cart_total" value="<%=cartTotal %>"/>
        <input type="hidden" name="order_total" id="order_total" value="<%=cartTotal %>"/>
          
          <% if (c != null){	%>
          <form action="/checkout" method="post" id="checkout_form">
              <input type="hidden" name="order_total" value="<%=cartTotal %>"/>
              <input type="submit" class="btn btn-lg btn-primary btn-block btn-signin" value="Proceed to Checkout"/>
          </form>
          <% } else{ %>
		  <form class="form-signin" action="loginProcess" method="post" id="login_form">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="inputEmail" class="form-control" placeholder="Email Address" name="email" id="email" data-parsley-trigger="change" required autofocus>
                <p></p>
                <input type="password" class="form-control" placeholder="Password" name="password" id="password" data-parsley-trigger="change" required>
                <br>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" value="Login">Sign in</button>
          </form>
          <br>
          <a href="/register" class="btn btn-primary btn-lg btn-warning" style="width:100%">Register</a>
          <%
              }
          %>
      </div>  
    </div>
    
 </div>
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="js/elsevier.js"></script>
    <script src="js/update_cart.js"></script>
    <script src="js/round.js"></script>
    
    <script>
      $(document).foundation();
    </script> 
  </body>
</html>
