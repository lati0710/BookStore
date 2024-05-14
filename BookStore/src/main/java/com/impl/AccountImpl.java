package com.impl;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.AccountDao;
import com.entities.Account;

@Repository
public class AccountImpl implements AccountDao {
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Account getAccount(String username) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Account where userName=?1");
		Account data=null;
		try {
			data=(Account)query.setParameter(1, username).getSingleResult();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return data;
	}
	
	@Override
	public List<Account> getAll() {
		return null;
	}

	@Override
	public List<Account> search(String name) {
		return null;
	}

	@Override
	public Account get(String key) {
		return null;
	}

	@Override
	public boolean insert(Account obj) {
		return false;
	}

	@Override
	public boolean update(Account obj) {
		return false;
	}

	@Override
	public boolean delete(String key) {
		return false;
	}
}
