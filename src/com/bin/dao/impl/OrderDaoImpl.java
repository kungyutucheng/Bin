package com.bin.dao.impl;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseDaoImpl;
import com.bin.dao.OrderDao;
import com.bin.model.Order;

@Repository
public class OrderDaoImpl extends BaseDaoImpl<Order, Integer> implements OrderDao{

}
