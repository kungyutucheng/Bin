package com.bin.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Page<T> implements Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 排序常量
	 */
	private static final String ASC = "asc";
	private static final String DESC = "desc";

	/**
	 * 页号
	 */
	private int page = -1;
	
	
	/**
	 * 每页记录�?
	 */
	private int pageSize = -1;
	
	/**
	 * 总记录数
	 */
	private long total = -1;
	
	/**
	 * 结果�?
	 */
	private List<T> rows;
	
	/**
	 * 排序字段
	 */
	private String orderBy = null;
	/**
	 * 排序字段对应的排序规�?
	 */
	private String order = null;
	private boolean autoCount = true;
	
	/**
	 * �Ƿ���ʾȫ�����
	 */
	private boolean isShowAll = false;
	/**
	 * 查询参数
	 */
	private Map<String, Object> params = new HashMap<String,Object>();
	
	
	/**
	 * 常量
	 */
	public static final String PAGE_NO = "page";
	public static final String PAGE_SIZE = "pageSize";
	public static final String TOTAL_COUNT = "total";
	public static final String ORDER_BY = "orderBy";
	public static final String ORDER = "order";
	public static final String AUTO_COUNT = "autoCount";
	public static final String IS_SHOW_ALL = "isShowAll";
	
	public Page(){
		
	}
	
	public Page(int pageSize){
		this.pageSize = pageSize;
	}

	/**
	 * 获取页数
	 * @return
	 */
	public int getPage() {
		return page;
	}

	/**
	 * 设置页数
	 * @param pageNo
	 */
	public void setPage(int page) {
		this.page = page;
		
		if(page < 1){
			this.page = 1;
		}
	}
	
	/**
	 * 链式设置页数
	 * @param pageNo
	 * @return
	 */
	public Page<T> page(int page) {
		setPage(page);
		return this;
	}

	/**
	 * 获取每页记录�?
	 * @return
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 设置每页记录�?
	 * @param pageSize
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * 链式设置每页记录�?
	 * @param pageSize
	 * @return
	 */
	public Page<T> pageSize(int pageSize) {
		setPageSize(pageSize);
		return this;
	}
	
	/**
	 * 获取总记录数
	 * @return
	 */
	public long getTotal() {
		return total;
	}

	/**
	 * 设置总记录数
	 * @param totalCount
	 */
	public void setTotal(long total) {
		this.total = total;
	}
	
	/**
	 * 链式设置总记录数
	 * @param totalCount
	 * @return
	 */
	public Page<T> total(long total) {
		setTotal(total);
		return this;
	}

	/**
	 * 获取结果�?
	 * @return
	 */
	public List<T> getRows() {
		return rows;
	}

	/**
	 * 设置结果�?
	 * @param result
	 */
	public void setRows(List<T> rows) {
		this.rows = rows;
	}

	/**
	 * 获取排序字段
	 * @return
	 */
	public String getOrderBy() {
		return orderBy;
	}

	/**
	 * 设置排序字段
	 * @param orderBy
	 */
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	
	/**
	 * 链式设置排序字段
	 * @param orderBy
	 * @return
	 */
	public Page<T> orderBy(String orderBy) {
		setOrderBy(orderBy);
		return this;
	}

	/**
	 * 获取排序规则
	 * @return
	 */
	public String getOrder() {
		return order;
	}


	public boolean isAutoCount() {
		return autoCount;
	}

	/**
	 * 设置是否计算总数
	 */
	public void setAutoCount(boolean autoCount) {
		this.autoCount = autoCount;
	}
	
	/**
	 * 链式设置是否记录总数
	 * @param autoCount
	 * @return
	 */
	public Page<T> autoCount(boolean autoCount) {
		setAutoCount(autoCount);
		return this;
	}
	
	

	public boolean isShowAll() {
		return isShowAll;
	}

	public void setShowAll(boolean isShowAll) {
		this.isShowAll = isShowAll;
	}
	
	public Page<T> showAll(boolean isShowAll) {
		setShowAll(isShowAll);
		return this;
	}

	public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	/**
	 * 获取页数
	 * @return
	 */
	public long getPageCount(){
		if(total == 0)
			return 0;
		if(pageSize == 0)
			return 0;
		long pageCount = total / pageSize;
		if(total % pageSize != 0){
			pageCount += 1;
		}
		return pageCount;
		
	}
	
	/**
	 * 获取每页的第�?��记录
	 * @return
	 */
	public int getFirstInPage(){
		return (page - 1) * pageSize + 1;
	}
	
	/**
	 * 是否有下�?��
	 * @return
	 */
	public boolean hasNext(){
		return page + 1 <= getPageCount() ? true : false;
	}
	
	/**
	 * 获取下一页页�?
	 * @return
	 */
	public int getNextPage(){
		return hasNext() ? page + 1 : page;
	}
	
	/**
	 * 是否有前�?��
	 * @return
	 */
	public boolean hasPre(){
		return page - 1 >= 1 ? true : false;
	}
	
	/**
	 * 获取前一页页�?
	 * @return
	 */
	public int getPrePage(){
		return hasPre() ? page - 1 : page;
	}

	@Override
	public String toString() {
		return "Page [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + ", orderBy="
				+ orderBy + ", order=" + order + ", autoCount=" + autoCount + ", isShowAll=" + isShowAll + ", params="
				+ params + "]";
	}

	
	
}
