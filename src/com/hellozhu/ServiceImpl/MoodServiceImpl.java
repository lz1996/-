package com.hellozhu.ServiceImpl;

import java.util.List;
import com.hellozhu.Dao.MoodDao;
import com.hellozhu.DaoImpl.MoodDaoImpl;
import com.hellozhu.Service.MoodService;
import com.hellozhu.model.Mood;

public class MoodServiceImpl implements MoodService{
	private MoodDao moodDaoImpl=new MoodDaoImpl();
	public List<Mood> list(int curPage){
		List<Mood> list=moodDaoImpl.list(curPage);
		return list;
	}
	public void add(Mood mood){
		moodDaoImpl.save(mood);
	}
	public void delete(Mood mood){
		moodDaoImpl.delete(mood);
	}
	public void deleteById(int id){
		moodDaoImpl.deleteById(id);
	}
	public void update(Mood mood){
		moodDaoImpl.update(mood);
	}
	public Mood loadByID(int id){
		Mood mood=moodDaoImpl.loadByID(id);
		return mood;
	}
	@Override
	public long listSize() {
		long size=moodDaoImpl.listSize();
		return size;
	}

}
