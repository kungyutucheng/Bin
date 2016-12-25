package com.bin.base;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.apache.tools.ant.taskdefs.Execute;
import org.hibernate.Session;

public interface BaseDao<T , PK extends Serializable> {
	
	public Session getSession();

	public PK save(T entity);
	
	public void update(T entity);
	
	public void delete(T entity);
	
	public void delete(Class<T> clazz,PK id);
	
	public T get(Class<T> clazz,PK id);
	
	public void saveAll(List<T> entityList , Class<T> clazz) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	
	public void updateAll(List<T> entityList , Class<T> clazz) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	
	public void updateAll(List<T> entityList , Class<T> clazz,List<String> columnNames) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;
	
	public void batchDelete(Class<T> clazz,String ids);
	
	public List<T> getAll(Class<T> clazz);
	
	public void batchUpdate(String sql,Object...params);
	
	public Long getCount(String hql,Object...params);
	
	public Long getCount(Class<T> clazz);
	
	public List<T> queryList(String hql,Object...params);
	
	public T queryUnique(String hql,Object...params);
	
	public List<T> getPageResult(String hql,Integer pageNo,Integer pageSize,Object...params);
	
	public void execute(String hql,Object...params);
	
	public T fingUniqueByExample(Class<T> clazz , T entity) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException;
}
