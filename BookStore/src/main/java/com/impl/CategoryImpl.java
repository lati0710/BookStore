package com.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CategoryDao;
import com.entities.Category;

@Repository
public class CategoryImpl implements CategoryDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<Category> getAll() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category");
		List data = query.getResultList();
		session.close();
		return data;
	}

	@Override
	public Category get(Integer key) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category where categoryId=?1");
		query.setParameter(1, key);
		Category data = (Category) query.getSingleResult();
		session.close();
		return data;
	}

	@Override
	public List<Category> search(String name) {
		return null;
	}

	@Override
	public boolean insert(Category obj) {
		return false;
	}

	@Override
	public boolean update(Category obj) {
		return false;
	}

	@Override
	public boolean delete(Integer key) {
		return false;
	}

}
