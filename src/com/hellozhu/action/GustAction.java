package com.hellozhu.action;

import java.util.List;

import com.hellozhu.Service.GustService;
import com.hellozhu.ServiceImpl.GustServiceImpl;
import com.hellozhu.model.Gust;
import com.opensymphony.xwork2.ActionSupport;

public class GustAction extends ActionSupport {
	private GustService gustservice=new GustServiceImpl();
	private Gust gust;
	private int id;
	private List<Gust> list;
	private int curPage;
	private long pageCount;
	public String insert(){
		gustservice.add(gust);
		return SUCCESS;
	}
	public String list(){
		pageCount=this.gustservice.listSize1()/5+1;
		list=gustservice.list(curPage);
		return SUCCESS;
	}
	public String check(){
		pageCount=this.gustservice.listSize0()/5+1;
		list=gustservice.check(curPage);
		return SUCCESS;
	}
	public String pass(){
		gustservice.pass(id);
		return SUCCESS;
	}
	public String delete(){
		gustservice.deleteById(id);;
		return SUCCESS;
	}
	public Gust getGust() {
		return gust;
	}

	public void setGust(Gust gust) {
		this.gust = gust;
	}
	public List<Gust> getList() {
		return list;
	}
	public void setList(List<Gust> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public long getPageCount() {
		return pageCount;
	}
	public void setPageCount(long pageCount) {
		this.pageCount = pageCount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
