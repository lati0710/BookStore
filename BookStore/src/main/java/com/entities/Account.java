package com.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Account")
public class Account implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	private String accountId;
	private String username;
	private String password;
	private String fullName;
	private String picture;
	private String email;
	private String address;
	private String phone;
	private boolean isAdmin;
	private boolean active;

	public Account(String accountId, String username, String fullName, String password, String picture, String email,
			String address, String phone, boolean isAdmin, boolean active) {
		super();
		this.accountId = accountId;
		this.username = username;
		this.password = password;
		this.fullName = fullName;
		this.picture = picture;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.isAdmin = isAdmin;
		this.active = active;
	}

	public Account() {

	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

}
