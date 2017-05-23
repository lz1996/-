package com.hellozhu.DaoImpl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.hellozhu.Dao.GustDao;
import com.hellozhu.model.Gust;
import com.hellozhu.util.HibernateUtil;

public class GustDaoImpl implements GustDao{
	SessionFactory sessionFactory=HibernateUtil.getSessionFactory();

	@Override
	public void save(Gust gust) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			gust.setMessage(new String(gust.getMessage().getBytes("ISO-8859-1"),"UTF-8"));
			gust.setName(new String(gust.getName().getBytes("ISO-8859-1"),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.save(gust);
		session.getTransaction().commit();
	} 

	@Override
	public List<Gust> list(Boolean bool,int curPage) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query q = session.createQuery("from Gust g where g.ischeck=:bool")
				.setBoolean("bool", bool);
		q.setMaxResults(5);
		q.setFirstResult(5*(curPage-1));
		List<Gust> list = (List<Gust>)q.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public void pass(int id) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Gust gust=session.load(Gust.class, id);
		gust.setIscheck(true);
		session.update(gust);
		session.getTransaction().commit();
	}

	@Override
	public long listSize(Boolean bool) {
		long size = 0 ;
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query =session.createQuery("select count(g) from Gust g where g.ischeck=:bool")
				.setBoolean("bool", bool);
		size = (long)query.getSingleResult();
		session.getTransaction().commit();
		return size;	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Gust gust=session.load(Gust.class, id);
		session.delete(gust);
		session.getTransaction().commit();
	}

}
