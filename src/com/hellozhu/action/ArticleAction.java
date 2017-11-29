package com.hellozhu.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hellozhu.Service.ArticleService;
import com.hellozhu.ServiceImpl.ArticleServiceImpl;
import com.hellozhu.model.Article;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport {
	private String content;
	private Article article;
	private int id;
	private File cover;
	private ArticleService articleservice=new ArticleServiceImpl();
	private List<Article> list;
	private List<Article> newlist;
	private List<Article> countlist;
	private int curPage;
	private long pageCount;
	public String write(){
		return INPUT;
	}
	public String add() throws UnsupportedEncodingException{
		HttpServletRequest request = ServletActionContext.getRequest();  
		request.setCharacterEncoding("UTF-8");
		articleservice.add(content,article,cover);
		System.out.println(content);
		System.out.println(new String(article.getTitle().getBytes("ISO-8859-1"),"UTF-8"));
		System.out.println(article.getSummary());
		System.out.println(article.getTitle());
		System.out.println(article.getType());
		return SUCCESS;
	}
	public String list(){
		pageCount=this.articleservice.listSize()/5+1;
		setList(articleservice.list(curPage));
		setNewlist(articleservice.listnew());
		setCountlist(articleservice.listcount());
	   ActionContext context=ActionContext.getContext();
	   Map<String,Object> s1=context.getSession();
	   s1.put("newlist", newlist);
	   s1.put("countlist", countlist);
		return SUCCESS;
	}
	public String delete(){
		articleservice.delete(id);
		return SUCCESS;
	}
	public String updateInput(){
		article=articleservice.getArticle(id);
		content=articleservice.getContent(article.getPath());		
	   // System.out.println(content);
        ActionContext context=ActionContext.getContext();
        Map<String,Object> s1=context.getSession();
        s1.put("content", content);
		return "pass";
	}
	public String update(){
		articleservice.update(content,article);
		return SUCCESS;
	}
	public void updateCount(){
		System.out.println("------------"+id+"-------------");
		articleservice.updateCount(id);
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
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
	public List<Article> getList() {
		return list;
	}
	public void setList(List<Article> list) {
		this.list = list;
	}
	public List<Article> getNewlist() {
		return newlist;
	}
	public void setNewlist(List<Article> newlist) {
		this.newlist = newlist;
	}
	public File getCover() {
		return cover;
	}
	public void setCover(File cover) {
		this.cover = cover;
	}
	public List<Article> getCountlist() {
		return countlist;
	}
	public void setCountlist(List<Article> countlist) {
		this.countlist = countlist;
	}

}
