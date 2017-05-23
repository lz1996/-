package com.hellozhu.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.hellozhu.Service.ArticleService;
import com.hellozhu.ServiceImpl.ArticleServiceImpl;
import com.hellozhu.model.Article;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleAction extends ActionSupport {
	private String content;
	private Article article;
	private ArticleService articleservice=new ArticleServiceImpl();
	public String write(){
		return INPUT;
	}
	public String add(){
		articleservice.add(content,article);
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

}
