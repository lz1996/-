package com.hellozhu.DaoImpl;

import java.io.UnsupportedEncodingException;
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
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		session.save(article);
		session.getTransaction().commit();
	}

	@Override
	public List<Article> list(int curPage) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query q = session.createQuery("from Article");
		q.setMaxResults(5);
		q.setFirstResult(5*(curPage-1));
		List<Article> list = (List<Article>)q.list();
		session.getTransaction().commit();
		return list;
	}

	@Override
	public long listSize() {
		// TODO Auto-generated method stub
		long size = 0 ;
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Query query =session.createQuery("select count(a) from Article a ");
		size = (long)query.getSingleResult();
		session.getTransaction().commit();
		return size;
	}

	@Override
	public String delete(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Article article=session.load(Article.class, id);
		String path=article.getPath();
		session.delete(article);
		session.getTransaction().commit();
		return path;
	}

	@Override
	public Article loadById(int id) {
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Article article=session.get(Article.class, id);
		session.getTransaction().commit();
		return article;
	}

	@Override
	public void update(Article article) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
	    session.clear();
		session.update(article);
		session.flush();
		session.getTransaction().commit();
	}


}
