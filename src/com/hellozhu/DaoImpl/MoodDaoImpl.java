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
		List<Mood> list =null;
		try{
			Query q = session.createQuery("from Mood mood order by mood.posttime desc");
			q.setMaxResults(5);
			q.setFirstResult(5*(curPage-1));
			 list = (List<Mood>)q.list();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return list;
		
	}
	public void save(Mood mood){
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
		mood.setContent(new String(mood.getContent().getBytes("ISO-8859-1"),"UTF-8"));
		session.save(mood);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		
	}
	public void delete(Mood mood){
		deleteById(mood.getMoodId());
	}
	public void deleteById(int id){
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			Mood mood=session.load(Mood.class, id);
			session.delete(mood);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.getTransaction().commit();
			}
		
}
	public void update(Mood mood){
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			mood.setContent(new String(mood.getContent().getBytes("ISO-8859-1"),"UTF-8"));
			session.update(mood);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
	}
	public Mood loadByID(int id){
		Mood mood = null ;
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			mood=session.get(Mood.class, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return mood;
	
	}
	@Override
	public long listSize() {
		long size = 0 ;
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			Query query =session.createQuery("select count(m) from Mood m ");
			size = (long)query.getSingleResult();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return size;
	}
}
