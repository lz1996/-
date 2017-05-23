package com.hellozhu.Service;

import java.util.List;

import com.hellozhu.model.Gust;

public interface GustService {
	public void add(Gust gust);
	public List<Gust> list(int curPage);
	public List<Gust> check(int curPage);
 	public void pass(int id);
 	public long listSize0();
 	public long listSize1();
 	public void deleteById(int id);
}
