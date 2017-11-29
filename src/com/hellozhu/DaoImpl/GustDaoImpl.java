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
			session.save(gust);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
	} 

	@Override
	public List<Gust> list(Boolean bool,int curPage) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		List<Gust> list =null;
		try {
			Query q = session.createQuery("from Gust g where g.ischeck=:bool")
					.setBoolean("bool", bool);
			q.setMaxResults(5);
			q.setFirstResult(5*(curPage-1));
		     list = (List<Gust>)q.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return list;
	}

	@Override
	public void pass(int id) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			Gust gust=session.load(Gust.class, id);
			gust.setIscheck(true);
			session.update(gust);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
	}

	@Override
	public long listSize(Boolean bool) {
		long size = 0 ;
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			Query query =session.createQuery("select count(g) from Gust g where g.ischeck=:bool")
					.setBoolean("bool", bool);
			size = (long)query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return size;	
		}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			Gust gust=session.load(Gust.class, id);
			session.delete(gust);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		
	}

}
