package cn.xkjs.util;

import java.util.List;

public class PageUtil {

	private int pageSize;// 每页多少条数据
	private int totalData;// 总共多少条数据
	private int navCount;// 导航条数目
	private int currPage;// 当前页码

	private int nextPage;// 下一页
	private int prevPage;// 上一页

	private int firstPage; // 首页
	private int lastPage;// 尾页

	private int startRow; // 起始记录号
	private int totalPage;// 结束导航条数字 总页数

	private int startNav; // 开始导航条数字
	private int endNav;// 结束导航条数字

	private List pageData;// 当前页面的数据

	public PageUtil(int pageSize, int currPage, int navCount, int totalData) {
		this.pageSize = pageSize;
		this.currPage = currPage;
		this.navCount = navCount;
		this.totalData = totalData;

		this.totalPage = (int) Math.ceil(this.totalData / (this.pageSize * 1.0));

		this.firstPage = 1;
		this.lastPage = this.totalPage;

		this.prevPage = this.currPage - 1 > 0 ? this.currPage - 1 : this.firstPage;
		this.nextPage = this.currPage + 1 > this.lastPage ? this.lastPage : this.currPage + 1;

		this.startRow = (this.currPage - 1) * this.pageSize;

		this.startNav = this.currPage - this.navCount / 2 > 0 ? this.currPage - this.navCount / 2 : this.firstPage;
		this.endNav = this.startNav + this.navCount - 1 > this.lastPage ? this.lastPage : this.startNav + this.navCount;

		if (this.endNav > this.navCount - 1) {
			this.startNav = this.endNav - this.startNav < this.navCount - 1 ? this.endNav - this.navCount + 1 : this.startNav;
		} else {
			this.startNav = this.firstPage;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalData() {
		return totalData;
	}

	public void setTotalData(int totalData) {
		this.totalData = totalData;
	}

	public int getNavCount() {
		return navCount;
	}

	public void setNavCount(int navCount) {
		this.navCount = navCount;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getStartNav() {
		return startNav;
	}

	public void setStartNav(int startNav) {
		this.startNav = startNav;
	}

	public int getEndNav() {
		return endNav;
	}

	public void setEndNav(int endNav) {
		this.endNav = endNav;
	}

	public List getPageData() {
		return pageData;
	}

	public void setPageData(List pageData) {
		this.pageData = pageData;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

}
