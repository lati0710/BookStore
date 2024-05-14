package com.entities;

import java.io.Serializable;

public class Basket implements Serializable {
	private static final long serialVersionUID = 1L;
	private String bookId;
	private String title;
	private float price;
	private int quantity;

	public Basket() {

	}

	public Basket(String bookId, String title, float price, int quantity) {
		super();
		this.bookId = bookId;
		this.title = title;
		this.price = price;
		this.quantity = quantity;
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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
