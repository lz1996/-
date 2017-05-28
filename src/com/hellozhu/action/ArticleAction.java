package com.hellozhu.action;

import java.util.List;
import java.util.Map;

import com.hellozhu.Service.ArticleService;
import com.hellozhu.ServiceImpl.ArticleServiceImpl;
import com.hellozhu.model.Article;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport {
	private String content;
	private Article article;
	private int id;
	private ArticleService articleservice=new ArticleServiceImpl();
	private List<Article> list;
	private int curPage;
	private long pageCount;
	public String write(){
		return INPUT;
	}
	public String add(){
		articleservice.add(content,article);
		return SUCCESS;
	}
	public String list(){
		pageCount=this.articleservice.listSize()/5+1;
		setList(articleservice.list(curPage));
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
		System.out.println(article.getType());
		System.out.println(article.getId());
		System.out.println(article.getTitle());
		System.out.println(article.getPath());
		articleservice.update(content,article);
		return SUCCESS;
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

}
