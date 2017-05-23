package com.hellozhu.Dao;

import java.util.List;

import com.hellozhu.model.Gust;

public interface GustDao {
	public void save(Gust gust);
	public List<Gust> list(Boolean bool,int curPage);
	public void pass(int id);
 	public long listSize(Boolean bool);
 	public void deleteById(int id);

}
