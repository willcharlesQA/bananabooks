package com.qa.controllers;

import com.qa.models.Book;
import com.qa.models.BookOrder;
import com.qa.models.Customer;
import com.qa.services.BookService;
import com.qa.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Map;

@SessionAttributes(names={"orders", "logged_in_customer"})
@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    @Autowired
    BookService bookService;

    @RequestMapping("/orderhistory")
    public ModelAndView orderhistory (@ModelAttribute("logged_in_customer") Customer c){

        ModelAndView modelAndView = new ModelAndView("order_history");
        Iterable<BookOrder> totalOrders = orderService.findOrders();
        ArrayList<BookOrder> orders = getCustomerOrders(totalOrders, c.getCustomerId());
        modelAndView.addObject("orders", orders);

        Iterable<Book> books = bookService.findAllBooks();
        modelAndView.addObject("books", books);

        return modelAndView;
    }

    private ArrayList<BookOrder> getCustomerOrders(Iterable<BookOrder> totalOrders, int customerId){
        ArrayList<BookOrder> orders = new ArrayList<>();
        for(BookOrder order : totalOrders)
        {
            if(order.getCustomerId() == customerId){
                orders.add(order);
            }
        }
        return orders;
    }
/*
    @RequestMapping("/saveOrder")
    public ModelAndView saveorder (@ModelAttribute("filtered_books") ArrayList<Book> books, @ModelAttribute("logged_in_customer") Customer c){
        ModelAndView modelAndView  = null;

        int orderNumber = orderService.getLatestOrderNumber()+1;
        int customerId = c.getCustomerId();
        int totalBooks = books.size();

        for (int i = 0; i < totalBooks; i++){
            int bookId = books.get(i).getBookId();
            BookOrder order = new BookOrder(orderNumber, customerId, bookId);
            BookOrder bookOrder = orderService.saveOrder(order);

            System.out.println(bookOrder.getCustomerId());
            System.out.println(bookOrder.getBookId());
            System.out.println(bookOrder.getOrderId());
            System.out.println(bookOrder.getOrderNumber());
        }

        return new ModelAndView("index");
    }*/
}
