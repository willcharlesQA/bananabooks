<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping </title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    
    <!-- Start Top Bar -->
    <div class="top-bar">
      <div class="top-bar-left">
        <ul class="menu">
          <li><a href="/"><img src="images/LogoV1.png" width="100" height="100"/></a></li>
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
              <a href="/viewCart"> <img src="images/cart.png" width="50" height="50"/></a>
              <ul class="submenu menu vertical" data-submenu>
                <li><a href="/viewCart"><img src="images/cart.png" width="50" height="50"/> View Cart </a></li>
                <li><a href="/login">Register | Login</a></li>
              </ul>
            </li>
            <li><a href="/aboutUs">About Us</a></li>
            <li><a href="/contactUs">Contact</a></li>
          </ul>
          
      </div>
    </div>
    <!-- End Top Bar -->

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


    