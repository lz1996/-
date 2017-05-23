package com.hellozhu.DaoImpl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.hellozhu.Dao.MoodDao;
import com.hellozhu.model.Mood;
import com.hellozhu.util.HibernateUtil;

public class MoodDaoImpl implements MoodDao {
	SessionFactory sessionFactory=HibernateUtil.getSessionFactory();

	public List<Mood> list(int curPage){
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query q = session.createQuery("from Mood");
		q.setMaxResults(5);
		q.setFirstResult(5*(curPage-1));
		List<Mood> list = (List<Mood>)q.list();
		session.getTransaction().commit();
		return list;
		
	}
	public void save(Mood mood){
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
		mood.setContent(new String(mood.getContent().getBytes("ISO-8859-1"),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.save(mood);
		session.getTransaction().commit();
		
	}
	public void delete(Mood mood){
		deleteById(mood.getMoodId());
	}
	public void deleteById(int id){
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Mood mood=session.load(Mood.class, id);
		session.delete(mood);
		session.getTransaction().commit();
		
}
	public void update(Mood mood){
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			mood.setContent(new String(mood.getContent().getBytes("ISO-8859-1"),"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.update(mood);
		session.getTransaction().commit();
	
	}
	public Mood loadByID(int id){
		Mood mood = null ;
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		mood=session.get(Mood.class, id);
		session.getTransaction().commit();
		return mood;
	
	}
	@Override
	public long listSize() {
		long size = 0 ;
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query =session.createQuery("select count(m) from Mood m ");
		size = (long)query.getSingleResult();
		session.getTransaction().commit();
		return size;
	}
}
