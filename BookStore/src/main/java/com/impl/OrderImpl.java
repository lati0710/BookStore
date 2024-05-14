package com.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.OrderDao;
import com.entities.OrderBook;
import com.entities.OrderDetail;

@Repository
public class OrderImpl implements OrderDao{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<OrderBook> getAll() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from OrderBook");
		List data = query.getResultList();
		session.close();
		return data;
	}

	@Override
	public boolean insert(OrderBook obj) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(obj);
		session.getTransaction().commit();
		session.close();
		return true;
	}

	@Override
	public boolean insertOrderDetail(OrderBook order, List<OrderDetail> details) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(order);
			for (OrderDetail orderDetail : details) {
				session.save(orderDetail);
			}
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<OrderBook> search(String name) {
		return null;
	}

	@Override
	public OrderBook get(String key) {
		return null;
	}

	@Override
	public boolean update(OrderBook obj) {
		return false;
	}

	@Override
	public boolean delete(String key) {
		return false;
	}

}
