package com.hellozhu.DaoImpl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.hellozhu.Dao.ArticleDao;
import com.hellozhu.model.Article;
import com.hellozhu.util.HibernateUtil;

public class ArticleDaoImpl implements ArticleDao {
	SessionFactory sessionFactory=HibernateUtil.getSessionFactory();

	@Override
	public void add(Article article) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try {
			article.setTitle(new String(article.getTitle().getBytes("ISO-8859-1"),"UTF-8"));
			article.setType(new String(article.getType().getBytes("ISO-8859-1"),"UTF-8"));
			article.setKeyword(new String(article.getKeyword().getBytes("ISO-8859-1"),"UTF-8"));
			if(article.getSummary().length()>150){
				article.setSummary(	new String(article.getSummary().getBytes("ISO-8859-1"),"UTF-8").substring(0, 150));
			}else{
				article.setSummary(	new String(article.getSummary().getBytes("ISO-8859-1"),"UTF-8"));
			}
			article.setNewDate(new Date());
			article.setUpdateDate(new Date());
			session.save(article);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		
	}

	@Override
	public List<Article> list(int curPage) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		List<Article> list=null;
		try{
			Query q = session.createQuery("from Article ORDER BY newDate DESC");
			q.setMaxResults(5);
			q.setFirstResult(5*(curPage-1));
			list= (List<Article>)q.list();
		}catch(Exception e ){
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return list;
	}

	@Override
	public List<Article> listnew() {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		List<Article> list=null;
		try{
			Query q = session.createQuery("from Article ORDER BY newDate DESC");
			q.setMaxResults(5);
			list= (List<Article>)q.list();
		}catch(Exception e ){
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return list;
	} 

	@Override
	public List<Article> listcount() {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		List<Article> list=null;
		try{
			Query q = session.createQuery("from Article ORDER BY number DESC");
			q.setMaxResults(5);
			list= (List<Article>)q.list();
		}catch(Exception e ){
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return list;
	}

	@Override
	public long listSize() {
		// TODO Auto-generated method stub
		long size = 0 ;
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try{
			Query query =session.createQuery("select count(a) from Article a ");
			size = (long)query.getSingleResult();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return size;
	}

	@Override
	public String delete(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		String path=null;
		try {
			Article article=session.load(Article.class, id);
			path=article.getPath();
			session.delete(article);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return path;
	}

	@Override
	public Article loadById(int id) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Article article=null;
		try{
			 article=session.get(Article.class, id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
		return article;
	}

	@Override
	public void update(Article article) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		try{
			 article.setUpdateDate(new Date());
			 session.clear();
			 session.update(article);
			 session.flush();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.getTransaction().commit();
		}
	}

	@Override
	public void updateCount(int id) {
		// TODO Auto-generated method stub
				Session session=sessionFactory.getCurrentSession();
				session.beginTransaction();
				Article article=null;
				try{
					 article=session.get(Article.class, id);
					 int count=0;
					 if(article.getNumber()!=null){
						 count=article.getNumber();
					 }
					 article.setNumber(count+1);
					 session.clear();
					 session.update(article);
					 session.flush();
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					session.getTransaction().commit();
				}
	}


}
