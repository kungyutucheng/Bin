package com.bin.base;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Table;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDaoImpl<T , PK extends Serializable> implements BaseDao<T, PK>{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/**
	 * 保存实体
	 * @param entity
	 * @return
	 */
	@Override
	public PK save(T entity){
		return (PK) getSession().save(entity);
	}
	
	/**
	 * 更新实体
	 * @param entity
	 */
	@Override
	public void update(T entity){
		getSession().update(entity);
	}

	/**
	 * 删除实体
	 * @param entity
	 */
	@Override
	public void delete(T entity) {
		getSession().delete(entity);
	}

	/**
	 * 根据实体类型和主键id删除
	 * @param clazz
	 * @param id
	 */
	@Override
	public void delete(Class<T> clazz, PK id) {
		getSession().delete(get(clazz, id));
	}

	/**
	 * 根据实体类型和主键id获取实体具体数据
	 * @param clazz
	 * @param id
	 * @return
	 */
	@Override
	public T get(Class<T> clazz,PK id) {
		return (T) getSession().get(clazz, id);
	}

	
	/**
	 * 批量插入
	 * @param entityList
	 * @param clazz
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 */
	@Override
	public void saveAll(List<T> entityList, Class<T> clazz) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		StringBuilder builder = new StringBuilder();
		//获取表明
		String tableName = clazz.getAnnotation(Table.class).name();
		
		//获取实体类全部字段
		Field[] fields = clazz.getDeclaredFields();
		List<Field> columnFields = new ArrayList<Field>();
		for(Field field : fields){
			if(field.getAnnotation(Column.class) != null){
				columnFields.add(field);
			}
		}
		
		Method [] methods = clazz.getDeclaredMethods();
		List<Method> dbFieldMethodList = new ArrayList<Method>();
		
		for(Field field : columnFields){
			String getterName = "get" + field.getName();
			for(Method method : methods){
				if(getterName.equalsIgnoreCase(method.getName())){
					dbFieldMethodList.add(method);
				}
			}
		}
		
		//拼接sql
		builder.append("insert into ").append("`").append(tableName).append("`").append(" (");
		for(Field columnField : columnFields){
			builder.append("`").append(columnField.getAnnotation(Column.class).name()).append("`");
		}
		builder.deleteCharAt(builder.length() - 1);
		builder.append(") values ");
		for(int i = 0 ;i < entityList.size();i++){
			builder.append("(");
			for(int j = 0; j < columnFields.size();j++){
				builder.append("?,");
			}
			builder.deleteCharAt(builder.length() - 1).append("),");
		}
		builder.deleteCharAt(builder.length() - 1);
		
		SQLQuery query = getSession().createSQLQuery(builder.toString());
		
		//填充数据
		int index = 0;
		for(T entity : entityList){
			for(Method getter : dbFieldMethodList){
				query.setParameter(index, getter.invoke(entity));
			}
		}
		
		//执行sql
		query.executeUpdate();
	}

	/**
	 * 批量删除数据
	 * @param clazz
	 * @param ids
	 */
	@Override
	public void batchDelete(Class<T> clazz,String ids) {
		if(ids != null){
			String idStrings [] = ids.split(",");
			StringBuilder builder = new StringBuilder();
			String tableName = clazz.getAnnotation(Table.class).name();
			builder.append("delete from ").append(tableName).append(" where id in (");
			for(String id : idStrings){
				builder.append(Integer.valueOf(id)).append(",");
			}
			builder.deleteCharAt(builder.length() - 1).append(")");
			SQLQuery query = getSession().createSQLQuery(builder.toString());
			query.executeUpdate();
		}
		
	}

	/**
	 * 获取某个表的全部数据，通常作为获取基础数据使用
	 * @param clazz
	 * @return
	 */
	@Override
	public List<T> getAll(Class<T> clazz) {
		StringBuilder builder = new StringBuilder();
		builder.append("select o from ").append(clazz.getSimpleName()).append(" as o");
		return getSession().createQuery(builder.toString()).list();
	}


	/**
	 * 批量更新
	 * @param sql
	 * @param params
	 */
	@Override
	public void batchUpdate(String sql, Object... params) {
		if(params == null || params.length == 0){
			return;
		}
		//组织参数
		List<List<Object>> paramList = new ArrayList<List<Object>>();
		for(Object param : params){
			paramList.add((List<Object>) param);
		}
		
		StringBuilder builder = new StringBuilder();
		//更新的数量
		Integer length = paramList.get(0).size();
		//更新的种类数
		Integer paramsLength = params.length;
		//存放全部参数值
		List<Object> totalParams = new ArrayList<Object>();
		
		//拼接sql同时存放所有参数值至totalParams中
		for(int i = 0 ;i < length ;i++){
			builder.append(sql).append(";");
			for(int j = 0;j < paramsLength ;j++){
				totalParams.add(paramList.get(j).get(i));
			}
		}
		
		Query query = getSession().createQuery(builder.toString());
		for(int i = 0 ;i < totalParams.size() ;i++){
			query.setParameter(i, totalParams.get(i));
		}
		query.executeUpdate();
	}

	/**
	 * 根据hql语句获取数量
	 * @param hql
	 * @param params
	 * @return
	 */
	@Override
	public Long getCount(String hql, Object... params) {
		Query query = getSession().createQuery(hql);
		if(params != null && params.length > 0){
			for(int i = 0 ;i < params.length ;i++){
				query.setParameter(i, params[i]);
			}
			return (Long) query.uniqueResult();
		}
		return null;
	}

	/**
	 * 根据实体获取数量
	 * @param clazz
	 * @return
	 */
	@Override
	public Long getCount(Class<T> clazz) {
		StringBuilder builder = new StringBuilder();
		builder.append("select count(*) from ").append(clazz.getSimpleName());
		Query query = getSession().createQuery(builder.toString());
		return (Long) query.uniqueResult();
	}

	/**
	 * 根据hql查询结果集
	 * @param hql
	 * @param params
	 * @return
	 */
	@Override
	public List<T> queryList(String hql, Object... params) {
		if(params != null && params.length > 0){
			Query query = getSession().createQuery(hql);
			for(int i = 0; i < params.length ;i++){
				query.setParameter(i, params[i]);
			}
			return query.list();
		}
		return null;
	}

	/**
	 * 根据hql查询单个结果
	 * @param hql
	 * @param params
	 * @return
	 */
	@Override
	public T queryUnique(String hql, Object... params) {
		if(params != null && params.length > 0){
			Query query = getSession().createQuery(hql);
			for(int i = 0 ;i < params.length ; i++){
				query.setParameter(i, params[i]);
			}
			return (T) query.uniqueResult();
		}
		return null;
	}

	/**
	 * 根据hql等获取分页结果
	 * @param hql
	 * @param pageNo
	 * @param pageSize
	 * @param params
	 * @return
	 */
	@Override
	public List<T> getPageResult(String hql, Integer pageNo, Integer pageSize, Object... params) {
		if(params != null && params.length > 0){
			Query query = getSession().createQuery(hql);
			for(int i = 0 ;i < params.length ;i++){
				query.setParameter(i, params[i]);
			}
			if(pageNo < 0){
				pageNo = 1;
			}
			if(pageSize < 0){
				pageSize = 100;
			}
			query.setMaxResults(pageSize).setFirstResult((pageNo - 1) * pageSize);
			return query.list();
		}
		return null;
	}

	/**
	 * 根据hql等进行批量操作
	 * @param hql
	 * @param params
	 */
	@Override
	public void execute(String hql, Object... params) {
		if(params != null && params.length > 0){
			Query query = getSession().createQuery(hql);
			for(int i = 0 ; i < params.length ; i++){
				query.setParameter(i, params[i]);
			}
			query.executeUpdate();
		}
		
	}
	@Override
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public T fingUniqueByExample(Class<T> clazz , T entity) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		StringBuilder builder = new StringBuilder();
		builder.append("from ").append(clazz.getSimpleName()).append(" where 1=1");
		
		//获取数据库字段
		Field[] fields = clazz.getDeclaredFields();
		List<Field> columnFields = new ArrayList<Field>();
		for(Field field : fields){
			if(field.getAnnotation(Column.class) != null){
				columnFields.add(field);
			}
		}
		
		//获取getter方法
		Method methods [] = clazz.getDeclaredMethods();
		//存放从实体处得到的参数值
		List<Object> params = new ArrayList<Object>(); 
		String getterName;
		for(Field field : fields){
			builder.append(" and ").append(field.getName()).append(" = ?");
			getterName = "get" + field.getName();
			for(Method method : methods){
				if(method.getName().equalsIgnoreCase(getterName)){
					//获取参数值
					params.add(method.invoke(entity));
				}
			}
		}
		
		Query query = getSession().createQuery(builder.toString());
		for(int i = 0 ;i < params.size() ; i++){
			query.setParameter(i, params.get(i));
		}
		
		return (T) query.uniqueResult();
		
		
	}
}
