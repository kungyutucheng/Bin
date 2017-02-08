package com.bin.home.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bin.annotation.MyException;
import com.bin.base.BaseController;
import com.bin.contant.ViewName;
import com.bin.context.UserContext;
import com.bin.databinder.helper.CommentListForm;
import com.bin.model.Comment;
import com.bin.model.Good;
import com.bin.model.GoodProperty;
import com.bin.model.Order;
import com.bin.model.User;
import com.bin.service.CommentService;
import com.bin.service.GoodPropertyService;
import com.bin.service.GoodService;
import com.bin.service.OrderService;
import com.bin.service.UserService;

@Controller
@RequestMapping(value = "/home/comment")
public class CommentController extends BaseController{
	
	public static final Integer PAGE_SIZE = 5;

	@Autowired
	private CommentService commentService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private GoodService goodService;
	
	@Autowired
	private GoodPropertyService goodPropertyService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	@MyException
	public ModelAndView save(CommentListForm commentListForm,Boolean isAnonymous,Integer[] score) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_COMMENT_SUCCESS);
		Date createTime = new Date();
		Comment comment;
		List<Comment> comments = new ArrayList<Comment>();
		Good good;
		List<Good> goods = new ArrayList<Good>();
		for(int i = 1 ; i < commentListForm.getComments().size() ; i++){
			comment = commentListForm.getComments().get(i);
			comment.setCreateTime(createTime);
			comment.setIsAnonymous(isAnonymous == null ? 1 : 2);
			comment.setUid(UserContext.getContext().getUser().getId());
			comment.setScore(score[i-1]);
			comments.add(comment);
			good = goodService.get(Good.class, comment.getGid());
			good.setCommentNum(good.getCommentNum() + 1);
			goods.add(good);
		}
		commentService.saveAll(comments, Comment.class);
		goodService.updateAll(goods, Good.class);
		
		Order order = orderService.get(Order.class, comments.get(0).getOid());
		order.setStatus(Order.STATUS_FINISH);
		order.setFinishTime(createTime);
		orderService.update(order);
		return modelAndView;
	}
	
	@RequestMapping(value = "/list/{id}/{pageNo}/{type}" , method = RequestMethod.GET)
	@MyException
	public ModelAndView list(@PathVariable Integer id , @PathVariable Integer pageNo , @PathVariable Integer type){
		ModelAndView modelAndView = new ModelAndView(ViewName.HOME_COMMENT_LIST);
		String hql = "from Comment where gid = ?";
		if(type == 1){
			hql += " and score > 3";
		}else if(type == 2){
			hql += " and score = 3";
		}else if(type == 3){
			hql += " and score < 3";
		}
		List<Comment> comments = commentService.getPageResult(hql, 
				pageNo, CommentController.PAGE_SIZE, id);
		Good good;
		GoodProperty goodProperty;
		User user;
		for(Comment comment : comments){
			good = goodService.get(Good.class, comment.getGid());
			goodProperty = goodPropertyService.get(GoodProperty.class, comment.getGpid());
			user = userService.get(User.class, comment.getUid());
			comment.setGood(good);
			comment.setGoodProperty(goodProperty);
			comment.setUser(user);
		}
		Long total = commentService.getCount(hql, id);
		Long pageCount = (total % PAGE_SIZE == 0) ? total / PAGE_SIZE : total / PAGE_SIZE + 1l;
		modelAndView.addObject("comments", comments);
		modelAndView.addObject("id", id);
		modelAndView.addObject("pageNo", pageNo);
		modelAndView.addObject("pageCount", pageCount);
		modelAndView.addObject("type", type);
		return modelAndView;
	}
}
