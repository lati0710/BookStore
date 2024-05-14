package com.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dao.PublisherDao;
import com.entities.Publisher;

@Repository
public class PublisherImpl implements PublisherDao{
	@Override
	public List<Publisher> getAll() {
		return null;
	}

	@Override
	public List<Publisher> search(String name) {
		return null;
	}

	@Override
	public Publisher get(Integer key) {
		return null;
	}

	@Override
	public boolean insert(Publisher obj) {
		return false;
	}

	@Override
	public boolean update(Publisher obj) {
		return false;
	}

	@Override
	public boolean delete(Integer key) {
		return false;
	}
}
