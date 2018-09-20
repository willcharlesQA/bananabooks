package com.qa.controllers;

import com.qa.models.BookOrder;
import com.qa.models.Customer;
import com.qa.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@SessionAttributes(names={"orders", "logged_in_customer"})
@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @RequestMapping("/orderhistory")
    public ModelAndView orderhistory (@ModelAttribute("logged_in_customer") Customer c){

        ModelAndView modelAndView = new ModelAndView("order_history");
        Iterable<BookOrder> totalOrders = orderService.findOrders();
        ArrayList<BookOrder> orders = getCustomerOrders(totalOrders, c.getCustomerId());
        modelAndView.addObject("orders", orders);

        return modelAndView;
    }

    public ArrayList<BookOrder> getCustomerOrders(Iterable<BookOrder> totalOrders, int customerId){
        ArrayList<BookOrder> orders = new ArrayList<>();
        for(BookOrder order : totalOrders)
        {
            if(order.getCustomerId() == customerId){
                orders.add(order);
            }
        }
        return orders;
    }
}
