<%@ page import="java.util.ArrayList" %>
<%@ page import="com.qa.models.BookOrder" %>
<%@ page import="com.sun.xml.internal.bind.v2.TODO" %>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping </title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<%
    ArrayList<BookOrder> orders = (ArrayList<BookOrder>) session.getAttribute("orders");
%>

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

<%
    if (orders.size() == 0){
        %>
<h1> Nothing bought yet, what are you waiting for? </h1>
<%
    }
    else{
        %>
<h1> Orders </h1>
<%
    int i = 0;
    for(BookOrder order : orders)
    {
%>
<div class="row small-up-3">

    <div class="column">
        <%=order.getBookId()%>
    </div>
    <div class="column">
        <img class="thumbnail" src="<%=order.getQuantity()%>"/>
    </div>
</div>
<%
        i++;
    }
    // NEED TO SHOW BOOK IMAGE, QUANTITY, AND COST - image will need a query

%>
<%
    }
%>


</body>

<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/elsevier.js"></script>
<script>
    $(document).foundation();
</script>
</body>
</html>


