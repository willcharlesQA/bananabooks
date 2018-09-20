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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

<%
    ArrayList<BookOrder> orders = (ArrayList<BookOrder>) session.getAttribute("orders");
    ArrayList<Book> books = (ArrayList<Book>) request.getAttribute("books");
%>

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


