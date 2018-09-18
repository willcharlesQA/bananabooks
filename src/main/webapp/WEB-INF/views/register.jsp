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
            <li class="menu-text" style="color:red">Online Shopping</li>
            <li><a href="/">Home</a></li>

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
    <div class="medium-6">
        <h3> Create an account  </h3>

        <form action="registerProcess" method="post" id="register_form">
            <label>First name * </label>
            <input type="text" placeholder="Enter firstname" name="firstName" id="firstName" data-parsley-trigger="change" required/>
            <label>Last name * </label>
            <input type="text" placeholder="Enter lastname" name="lastName" id="lastName" data-parsley-trigger="change" required/>
            <label>Email * </label>
            <input type="text" placeholder="Enter email" name="email" id="email" data-parsley-type="email" data-parsley-trigger="change" required/>
            <label>Password * </label>
            <input type="password" placeholder="Enter Password" name="password" id="password" data-parsley-minlength="7" data-parsley-trigger="change" required/>
            <label>Confirm password * </label>
            <input type="password" placeholder="Enter Password" name="password" id="password2" data-parsley-trigger="change" required data-parsley-equalto="#password"
            />
    </div>

    <div class="medium-6">

        <input type="checkbox" name="aggreement"/> I have read and understood the
        <a href="/registered_user_agreement">Registered User Agreement </a> and agree to be bound by all of its terms.

    </div>

    <input type="submit" class="button create account" value="Create Account">
    </form>



</div>
</div>


<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://parsleyjs.org/dist/parsley.min.js"></script>
<script src="js/elsevier.js"></script>
<script>
    $(function () {
        $('#register_form').parsley().on('field:validated', function() {
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


    