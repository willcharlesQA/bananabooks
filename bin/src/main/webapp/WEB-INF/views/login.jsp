<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  </head>
  <body>
    
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

    <div class="callout large">
      <div class="row column">
        
        
        <div class="medium-6">
           <h3> Please login using your stored credentials  </h3>
                
               <form action="loginProcess" method="post" id="login_form">
              
               <label>Email ID * </label>
                <input type="email" placeholder="Enter email" name="email" id="email" data-parsley-trigger="change" required/>
                <label>Password * </label>
				 <input type="password" placeholder="Enter Password" name="password" id="password" data-parsley-trigger="change" required/>
            	<input type="submit" class="button expanded" value="Login">
              
              </form>
            </div>
      
      <div class="medium-6">
           
           <p> New Customer?  </p> <a href="/register" class="button large expanded">Register</a>
         
            </div>
      
       
      </div>
    </div>
    
   
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="http://parsleyjs.org/dist/parsley.min.js"></script>
    <script src="js/elsevier.js"></script>
    <script>
        $(function () {
            $('#login_form').parsley().on('field:validated', function() {
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


    