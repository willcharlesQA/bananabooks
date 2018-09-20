<!doctype html>
<%@page import="com.qa.models.Customer"%>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  </head>
  <body>
  
  <%
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
    
       
       <div class="row">
        
       
        <div class="large-6 columns">
           <h3> Address </h3>
                
              <form action="/updateAddress" method="post">
               <label>Address Line1 * </label>
               <input type="text" placeholder="Enter AddressLine2" name="addressLine1" id="addressLine1"/> 
               <label>Address Line2 * </label>
               <input type="text" placeholder="Enter Address Line2" name="addressLine2" id="addressLine2"/> 
               <label>City * </label>
                <input type="text" placeholder="Enter City" name="city" id="city"/> 
                  <label>Postcode * </label>
                <input type="text" placeholder="Enter Postcode" name="postcode" id="postcode"/> 
                
                
                  <label>State/County * </label>
                <input type="text" placeholder="Enter State/County" name="state" id="state"/> 
                
                
                  <label>Country * </label>
                <input type="text" placeholder="Enter Country" name="country" id="county"/> 
                
                
                  <label>Phone Number * </label>
                <input type="text" placeholder="Enter Phone number" name="phoneNumber" id="phoneNumber"/> 
                
                 
                <input type="hidden" name="addressType" id="addressType" value="billing"/> 
                
                
                <input type="submit" class="button create account" value="Update Address">
               </form>
            </div>
      </div>
      
  
       
       
  <!--   </div> -->

    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="js/elsevier2.js"></script>
    <script>
      $(document).foundation();
    </script>
  </body>
</html>


    