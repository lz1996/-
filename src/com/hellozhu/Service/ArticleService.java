package com.hellozhu.Service;

import java.util.List;

import com.hellozhu.model.Article;

public interface ArticleService {
	public void add(String content,Article article);
	public void delete(int id);
	public List<Article> list(int curPage);
	public long listSize();
	public Article getArticle(int id);
	public String getContent(String path);
	public void update(String content,Article article);

}
