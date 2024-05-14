package com.dao;

import com.entities.Account;

public interface AccountDao extends GenericDao<Account, String>{
	public Account getAccount(String username);
}
