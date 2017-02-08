package com.bin.dao.impl;

import org.springframework.stereotype.Repository;

import com.bin.base.BaseDaoImpl;
import com.bin.dao.CommentDao;
import com.bin.model.Comment;

@Repository
public class CommentDaoImpl extends BaseDaoImpl<Comment, Integer> implements CommentDao{

}
