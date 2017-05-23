package com.hellozhu.action;

import java.util.List;

import com.hellozhu.Service.MoodService;
import com.hellozhu.ServiceImpl.MoodServiceImpl;
import com.hellozhu.model.Mood;
import com.opensymphony.xwork2.ActionSupport;

public class MoodAction extends ActionSupport {
	private  MoodService moodservice=new MoodServiceImpl();
	private  Mood mood; 
	private  int moodId;
	private  List<Mood> list;
	private int curPage;
	private long pageCount;
	public String list(){
		pageCount=this.moodservice.listSize()/5+1;
		list=this.moodservice.list(curPage);
		return SUCCESS;
	}
	public String add(){
		moodservice.add(mood);
		return SUCCESS;
	}
	public String delete(){
		moodservice.deleteById(moodId);;
		return SUCCESS;
	}
	public String update(){
		moodservice.update(mood);
		return SUCCESS;
	}
	public String addInput(){
		return INPUT;
	}
	public String updateInput(){
		this.mood=moodservice.loadByID(moodId);
		return INPUT;
	}
	public Mood getMood() {
		return mood;
	}
	public void setMood(Mood mood) {
		this.mood = mood;
	}
	public int getMoodId() {
		return moodId;
	}
	public void setMoodId(int moodId) {
		this.moodId = moodId;
	}
	public List<Mood> getList() {
		return list;
	}
	public void setList(List<Mood> list) {
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
	
}
