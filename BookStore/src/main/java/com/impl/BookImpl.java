package com.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.BookDao;
import com.entities.Book;
import com.entities.Category;

@Repository
public class BookImpl implements BookDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Book> getAll() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Book");
		List data = query.getResultList();
		session.close();
		return data;
	}

	@Override
	public Book get(String key) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Book where bookId=?1");
		Book data = (Book) query.setParameter(1, key).getSingleResult();
		session.close();
		return data;
	}

	@Override
	public List<Category> getByCategory(int categoryId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Book where categoryId=?1");
		List data = query.setParameter(1, categoryId).getResultList();
		session.close();
		return data;
	}

	@Override
	public List<Book> search(String name) {
		return null;
	}

	@Override
	public boolean insert(Book obj) {
		return false;
	}

	@Override
	public boolean update(Book obj) {
		return false;
	}

	@Override
	public boolean delete(String key) {
		return false;
	}
}
