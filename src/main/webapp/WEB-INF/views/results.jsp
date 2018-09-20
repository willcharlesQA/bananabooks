<!doctype html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.qa.models.Book"%>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping - Search Results</title>
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
	    <h2>Search results for "${searchTerm}"</h2><hr>
	    <div class="row row-offcanvas row-offcanvas-right text-center">
      	<% Iterable<Book> books = (Iterable<Book>) session.getAttribute("filtered_books"); %>
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

    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="js/elsevier.js"></script>
    <script>
      $(document).foundation();
    </script> 
  </body>
</html>
