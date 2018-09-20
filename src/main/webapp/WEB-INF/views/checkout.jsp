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
    	<div class="col-lg-6">
    		<h2> Address </h2>
    		<% if (address != null){ %>
            <form action="confirmation" method="post" id="checkout_form" data-parsley-validate="parsley">
                <div class="form-group">
                    <label>First name</label>
                    <input class="form-control" value="<%=c.getFirstName()%>" type="text" name="first" id="first" size="30" data-parsley-trigger="change" data-parsley-type="alphanum"     required/>
                
                    <label>Last name</label>
                    <input class="form-control" value="<%=c.getLastName()%>" type="text" name="last" id="last" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                </div>

                <div class="form-group">
                    <label> Address line 1</label>
                    <input class="form-control" value="<%=address.getAddressLine1()%>" type="text" name="addressLine1" id="addressLine1" size="30" data-parsley-trigger="change" required/>
               
                    <label> Address line 2</label>
                    <input class="form-control" value="<%=address.getAddressLine2()%>" type="text" name="addressLine2" id="addressLine2" size="30" data-parsley-trigger="change" required/>
                
                    <label> City</label>
                    <input class="form-control" value="<%=address.getCity()%>" type="text" name="city" id="city" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                
                    <label> Post/ZIP Code</label>
                    <input class="form-control" value="<%=address.getPostcode()%>" type="text" name="postcode" id="postcode" size="30" data-parsley-trigger="change" data-parsley-maxlength="7" required/>
                
                    <label> Country</label>
                    <input class="form-control" value="<%=address.getCountry()%>" type="text" name="country" id="country" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                </div>

                <div class="columns">
                    <label> Phone Number </label>
                    <input class="form-control" value="<%=address.getPhoneNumber()%>" type="text" name="phone" id="phone" size="30" data-parsley-type="digits"     />
                </div>
                <%
                    } else{
                %>
            <form action="confirmation" method="post" id="checkout_form" data-parsley-validate="parsley">
				<div class="form-group">
                    <div class="columns">
                        <label> First name</label>
                        <input class="form-control" type="text" name="first" id="first" size="30" data-parsley-trigger="change" data-parsley-type="alphanum"     required/>
                    </div>

                    <div class="columns">
                        <label> Last name</label>
                        <input class="form-control" type="text" name="last" id="last" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                    </div>
				</div>
				<div class="form-group">
                    <div class="columns">
                        <label> Address line 1</label>
                        <input class="form-control" type="text" name="addressLine1" id="addressLine1" size="30" data-parsley-trigger="change" required/>
                    </div>

                    <div class="columns">
                        <label> Address line 2</label>
                        <input class="form-control" type="text" name="addressLine2" id="addressLine2" size="30" data-parsley-trigger="change" required/>
                    </div>

                    <div class="columns">
                        <label> City</label>
                        <input class="form-control" type="text" name="city" id="city" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                    </div>

                    <div class="columns">
                        <label> Post/ZIP code</label>
                        <input class="form-control" type="text" name="postcode" id="postcode" size="30" data-parsley-trigger="change" data-parsley-maxlength="7" required/>
                    </div>

                    <div class="columns">
                        <label> Country</label>
                        <input class="form-control" type="text" name="country" id="country" size="30" data-parsley-trigger="change" data-parsley-type="alphanum" required/>
                    </div>
				</div>
                <div class="columns">
                    <label> Phone Number </label>
                    <input class="form-control" type="text" name="phone" id="phone" size="30" data-parsley-type="digits"     />
                </div>
                    <%
                        }
                    %>
    	</div>
    	<div class="col-lg-6">
    		<input type="hidden" name="order_total" value="<%=orderTotal %>"/>
    		<h1> Nice choice <%=c.getFirstName() %>! </h1>
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
      
				<dl class="row">
		  			<dt class="col-sm-8">Order Total</dt>
		  			<dd class="col-sm-4"><label id="order_total_label"><b>$<%=orderTotal%></b></label></dd>
		  		</dl>   
		        <input type="submit" class="btn btn-lg btn-primary btn-block" value="Proceed to Confirmation"/>
       		</form>
    	</div>
	</div>
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