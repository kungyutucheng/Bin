package com.bin.dao.impl;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseDaoImpl;
import com.bin.dao.CartDao;
import com.bin.model.Cart;

@Repository
public class CartDaoImpl extends BaseDaoImpl<Cart, Integer> implements CartDao{

}
