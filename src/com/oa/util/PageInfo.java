package com.oa.util;

public class PageInfo {
	//开始位置
	private int start;
	//每页数据
	private int size = 10;
	//当前页
	private int currentPage = 1;
	//总页数
	private int totalPage = 0;
	//总记录数
	private int totalRecord;
	
	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public PageInfo() {
	}

	public PageInfo(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getSize() {
		return size;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		//计算总页数
		this.totalPage = totalRecord % size == 0 ? totalRecord / size
				: totalRecord / size + 1;
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStart() {
		this.start = (currentPage - 1) * size;
		return start;
	}
	
	//是否有下一页
	public boolean isHasNext(){
		if(currentPage < totalPage){
			return true;
		}
		return false;
	}
	
	//是否有上一页
	public boolean isHasPrev(){
		if(currentPage > 1){
			return true;
		}
		return false;
	}
}