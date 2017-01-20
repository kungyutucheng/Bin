package com.bin.dao.impl;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseDaoImpl;
import com.bin.dao.AddressDao;
import com.bin.model.Address;

@Repository
public class AddressDaoImpl extends BaseDaoImpl<Address, Integer> implements AddressDao{

}
