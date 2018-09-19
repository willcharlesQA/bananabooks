<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> Contact Us | Elsevier </title>
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

    <div class="row column text-center">
        <h1> Contact us!</h1>
              <form action="contactUs" method="post" id="contact_form">
                  <label>Name * </label>
                  <input  placeholder="Enter name" data-parsley-trigger="change" required/>
                  <label>Email * </label>
                  <input type="email" placeholder="Enter email" name="email" id="email" data-parsley-trigger="change" required/>
                  <label>Message * </label>
                  <input type="text" placeholder="Sup?" data-parsley-minlength="5" data-parsley-trigger="change" required/>
                  <input type="submit" class="button expanded" value="Submit">
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


    