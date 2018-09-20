package com.qa.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.qa.models.BookOrder;
import com.qa.repositories.OrderRepository;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public Iterable<BookOrder> findOrders()
    {
        return orderRepository.findAll();
    }

    public BookOrder saveOrder(BookOrder order)
    {
        return orderRepository.save(order);
    }
}
