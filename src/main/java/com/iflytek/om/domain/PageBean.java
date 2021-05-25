package com.iflytek.om.domain;

public class PageBean {
	
	/**
	 * 数据总量
	 */
	private int totalCount;
	
	/**
	 * 每页显示
	 */
	private int everyPageSize;
	
	/**
	 * 当前页码
	 */
	private int pageSize;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getEveryPageSize() {
		return everyPageSize;
	}

	public void setEveryPageSize(int everyPageSize) {
		this.everyPageSize = everyPageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	
	
}
