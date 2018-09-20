package com.qa.repositories;

import com.qa.models.BookOrder;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends CrudRepository<BookOrder,Integer>{
    @Query("SELECT MAX(orderNumber) from BookOrder")
    public int getLatestOrderNumber();
}
