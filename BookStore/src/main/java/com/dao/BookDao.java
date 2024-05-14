package com.dao;

import java.util.List;

import com.entities.Book;
import com.entities.Category;

public interface BookDao extends GenericDao<Book, String>{
	public List<Category> getByCategory(int categoryId);
}
