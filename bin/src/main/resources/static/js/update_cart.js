
function calculateTotalPrice(price,element,price_label)
{
	    	
	       var cartTotal = document.getElementById("cart_total").value;
	       var orderTotal = document.getElementById("order_total").value;
	       var totalPrice = parseFloat(price).toFixed(2);
	       
	       
	       
	       var oldQuantity = element.defaultValue;
	       var newQuantity = element.value;
	       
	       var difference = newQuantity - oldQuantity;
	       price_label.innerHTML = "$"+totalPrice;
	       
	       cTotal  = (	parseFloat(cartTotal) + (difference * parseFloat(price)) ).toFixed(2);
	       oTotal = (parseFloat(orderTotal) + (difference * parseFloat(price)) ).toFixed(2);
	       
	       document.getElementById("cart_total_label").innerHTML = "$"+cTotal;
	       document.getElementById("order_total_label").innerHTML = "$"+oTotal;
	       
	       //document.getElementById("price").value = totalPrice;
	       
	       
	       document.getElementById("cart_total").value = cTotal;
	       document.getElementById("order_total").value = oTotal;
	       
	       
	       //console.log(quantity);
	       console.log(price_label);
	       //console.log(old_quantity);
	       
	       element.defaultValue = newQuantity;
	       
	       //alert("Cart Total is "+cartTotal);
	       //alert("Order Total is "+orderTotal);
//	        var xmlhttp = new XMLHttpRequest();
//	        xmlhttp.onreadystatechange = function() {
//	            if (this.readyState == 4 && this.status == 200) {
//	                price_label.innerHTML = "$"+this.responseText;
//	                document.getElementById("cart_total_label").innerHTML = cartTotal+parseFloat(this.responseText);
//	               // document.getElementById("order_total_label").innerHTML = (parseFloat(orderTotal)+parseFloat(this.responseText));
//	            	
//	                //theField.form.price_label.innerHTML = "$"+this.responseText;
//	            }
//	        };
//	        xmlhttp.open("GET", "/updatePrice?price=" + price+"&quantity="+quantity, true);
//	        xmlhttp.send();
	    
}
	
