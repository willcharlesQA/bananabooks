<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Contact Us | Elsevier </title>
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
	    <div class="jumbotron" style="background:none">
	    	<h1>Contact Us</h1>
             <form action="contactUs" method="post" id="contact_form">
  			 	<div class="form-group">
  			 		<input  class="form-control" placeholder="Enter name" data-parsley-trigger="change" required/>
  			 		<br>
    				<input type="email" class="form-control" placeholder="name@example.com" name="email" id="email" data-parsley-trigger="change" required>
    				<br>
  				</div>
  				<div class="form-group">
				    <textarea type="text" placeholder="Sup?" class="form-control" id="exampleFormControlTextarea1" rows="5" data-parsley-minlength="5" data-parsley-trigger="change"></textarea>
  				</div>
  				<button type="submit" class="btn btn-primary" value="Submit">Submit</button>
			</form>   
	    </div>
    </div>
    
    
   
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="http://parsleyjs.org/dist/parsley.min.js"></script>

    <script src="js/elsevier.js"></script>
    <script>
        $(function () {
            $('#contact_form').parsley().on('field:validated', function() {
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


    