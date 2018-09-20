package com.qa.models;

import jdk.nashorn.internal.objects.annotations.Constructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class BookOrder {

    @Id
    @GeneratedValue
    private int orderId;

    private int orderNumber;

    private int customerId;

    private int bookId;
/*
    public BookOrder(int orderNumber, int customerId, int bookId) {
        this.orderNumber = orderNumber;
        this.customerId = customerId;
        this.bookId = bookId;
    }*/

    public int getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(int orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }
}
