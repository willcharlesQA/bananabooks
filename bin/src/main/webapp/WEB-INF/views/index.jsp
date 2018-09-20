<!doctype html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.qa.models.Book"%>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Online Shopping</title>
    
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  </head>
  <body>
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
    
    <div class="container" style="padding-top:90px">
	    <h2>Our Newest Books</h2><hr>
	    <div class="row row-offcanvas row-offcanvas-right text-center">
      	<% Iterable<Book> books = (Iterable<Book>) session.getAttribute("books"); %>
      	<% for(Book book: books){ %>
	    <div class="col-lg-3 col-md-6 mb-4">
	      <div class="card">
	        <a href="/bookDetails?bookId=<%=book.getBookId()%>"><img class="card-img-top" src="<%=book.getBookImage()%>"></a>
	        <div class="card-body">
		        <h6 class="card-title"><%= book.getTitle()%></h6>
		        <p class="card-text">$<%= book.getPrice()%></p>
	        </div>
	        <div class="card-footer">
	        	<a href="/bookDetails?bookId=<%=book.getBookId()%>" class="button expanded">View book details</a>
	        </div>
	      </div>
	    </div>
    	<% } %>  
    	</div>
	</div>
    <hr>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script src="js/elsevier.js"></script>
    <script>
      $(document).foundation();
    </script> 
  </body>
</html>
