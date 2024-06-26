package com.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Books")
public class Book implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String bookId;
	private String title;
	private String author;
	private int release;
	private float price;
	private String description;
	private String picture;
	private int publisherId;
	private int categoryId;

	public Book() {

	}

	public Book(String bookId, String title, String author, int release, float price, String description,
			String picture, int publisherId, int categoryId) {
		super();
		this.bookId = bookId;
		this.title = title;
		this.author = author;
		this.release = release;
		this.price = price;
		this.description = description;
		this.picture = picture;
		this.publisherId = publisherId;
		this.categoryId = categoryId;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getRelease() {
		return release;
	}

	public void setRelease(int release) {
		this.release = release;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(int publisherId) {
		this.publisherId = publisherId;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

}
