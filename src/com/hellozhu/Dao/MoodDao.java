package com.hellozhu.Dao;

import java.util.List;
import com.hellozhu.model.Mood;

public interface MoodDao {
	public List<Mood> list(int curPage);
	public void save(Mood mood);
	public void delete(Mood mood);
	public void deleteById(int id);
	public void update(Mood mood);
	public Mood loadByID(int id);
	public long listSize();
}
