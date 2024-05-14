package com.dao;

import java.util.List;

public interface GenericDao<T, K> {
	public List<T> getAll();

	public List<T> search(String name);

	public T get(K key);

	public boolean insert(T obj);

	public boolean update(T obj);

	public boolean delete(K key);
}
