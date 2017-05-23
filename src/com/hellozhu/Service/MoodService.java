package com.hellozhu.Service;

import java.util.List;

import com.hellozhu.model.Mood;

public interface MoodService {
	public List<Mood> list(int curPage);
	public void add(Mood mood);
	public void delete(Mood mood);
	public void deleteById(int id);
	public void update(Mood mood);
	public Mood loadByID(int id);
	public long listSize();
		
}
