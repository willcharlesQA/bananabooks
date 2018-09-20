package com.qa.repositories;

import com.qa.models.BookOrder;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.qa.models.BookOrder;

@Repository
public interface OrderRepository extends CrudRepository<BookOrder,Integer> {
}
