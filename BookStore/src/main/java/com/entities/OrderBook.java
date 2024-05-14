package com.entities;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "OrderBook")
public class OrderBook implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String orderId;
	private Date orderDate;
	private String accountId;
	private String receiveAddress;
	private String receivePhone;
	private Date receiveDate;
	private String note;
	private boolean status;

	public OrderBook(String orderId, Date orderDate, String accountId, String receiveAddress, String receivePhone,
			Date receiveDate, String note, boolean status) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.accountId = accountId;
		this.receiveAddress = receiveAddress;
		this.receivePhone = receivePhone;
		this.receiveDate = receiveDate;
		this.note = note;
		this.status = status;
	}

	public OrderBook() {

	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getReceiveAddress() {
		return receiveAddress;
	}

	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}

	public String getReceivePhone() {
		return receivePhone;
	}

	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
