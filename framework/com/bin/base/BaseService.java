package com.bin.base;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseService<T , PK extends Serializable> {

	@Autowired
	private BaseDao<T, Serializable> baseDao;
	
	public PK save(T entity){
		return (PK) baseDao.save(entity);
	}
	
	public void update(T entity){
		baseDao.update(entity);
	}
	
	public void delete(T entity){
		baseDao.delete(entity);
	}
	
	public void delete(Class<T> clazz , PK id){
		baseDao.delete(clazz, id);
	}
	
	public T get(Class<T> clazz , PK id){
		return baseDao.get(clazz, id);
	}
	
	public void saveAll(List<T> entityList , Class<T> clazz) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		baseDao.saveAll(entityList, clazz);
	}
	
	public void updateAll(List<T> entityList , Class<T> clazz) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		baseDao.updateAll(entityList, clazz);
	}
	
	public void updateAll(List<T> entityList , Class<T> clazz , List<String> columnNames) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		baseDao.updateAll(entityList, clazz , columnNames);
	}
	
	public void batchDelete(Class<T> clazz , String ids){
		baseDao.batchDelete(clazz, ids);
	}
	
	public List<T> getAll(Class<T> clazz){
		return baseDao.getAll(clazz);
	}
	
	public void batchUpdate(String sql,Object...params){
		baseDao.batchUpdate(sql, params);
	}
	
	public Long getCount(String hql , Object...params){
		return baseDao.getCount(hql,params);
	}
	
	public Long getCount(Class<T> clazz){
		return baseDao.getCount(clazz);
	}
	
	public List<T> queryList(String hql , Object...params){
		return baseDao.queryList(hql, params);
	}
	
	public T queryUnique(String hql , Object...params){
		return baseDao.queryUnique(hql, params);
	}
	
	public List<T> getPageResult(String hql ,Integer pageNo ,Integer pageSize,Object...params){
		return baseDao.getPageResult(hql, pageNo, pageSize, params);
	}
	
	public void execute(String hql , Object...params){
		baseDao.execute(hql, params);
	}
	
	public T fingUniqueByExample(Class<T> clazz , T entity) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		return baseDao.fingUniqueByExample(clazz, entity);
	}
}
