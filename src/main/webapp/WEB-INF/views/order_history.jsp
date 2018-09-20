<%@ page import="java.util.ArrayList" %>
<%@ page import="com.qa.models.BookOrder" %>
<%@ page import="com.sun.xml.internal.bind.v2.TODO" %>
<%@ page import="com.qa.models.Book" %>
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
    ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
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
<table>
    <tr>
        <th>Order</th>
        <th></th>
        <th>Title</th>
        <th>Price</th>
    </tr>
    <%
    for(BookOrder order : orders){
        double price = books.get(order.getBookId()-1).getPrice();
        String title = books.get(order.getBookId()-1).getTitle();
        String imageURL = books.get(order.getBookId()-1).getBookImage();
%>
<tr>
    <td> <%=order.getOrderNumber()%> </td>
    <td> <%=title%> </td>
    <td> <%=price%> </td>
    <td><img class="thumbnail" src=<%=imageURL%>/></td>
</tr>
<%
    }
%>
</table>
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


