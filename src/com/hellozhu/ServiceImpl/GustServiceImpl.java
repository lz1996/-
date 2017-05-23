package com.hellozhu.ServiceImpl;

import java.util.List;

import com.hellozhu.Dao.GustDao;
import com.hellozhu.DaoImpl.GustDaoImpl;
import com.hellozhu.Service.GustService;
import com.hellozhu.model.Gust;

public class GustServiceImpl implements GustService {
	private GustDao gustdao=new GustDaoImpl();

	@Override
	public void add(Gust gust) {
		gustdao.save(gust);
	}

	@Override
	public List<Gust> list(int curPage) {
		List<Gust> list=gustdao.list(true,curPage);
		return list;
	}

	@Override
	public List<Gust> check(int curPage) {
		List<Gust> list=gustdao.list(false,curPage);
		return list;
	}

	@Override
	public void pass(int id) {
		// TODO Auto-generated method stub
		gustdao.pass(id);
	}

	@Override
	public long listSize0() {
		// TODO Auto-generated method stub
		long size=gustdao.listSize(false);
		return size;
	}
	public long listSize1() {
		// TODO Auto-generated method stub
		long size=gustdao.listSize(true);
		return size;
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		gustdao.deleteById(id);
	}

}
