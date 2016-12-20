package com.bin.dao.impl;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseDaoImpl;
import com.bin.dao.UserDao;
import com.bin.model.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User, Integer> implements UserDao{

}
