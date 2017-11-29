package com.hellozhu.Dao;

import java.util.List;

import com.hellozhu.model.Article;

public interface ArticleDao {
	public void add(Article article);
	public String delete(int id);
	public List<Article> list(int curPage);
	public List<Article> listnew();
	public long listSize();
	public Article loadById(int id);
	public void update(Article article);
	public void updateCount(int id);
	public List<Article> listcount();

}
