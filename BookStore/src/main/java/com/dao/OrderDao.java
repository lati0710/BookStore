package com.dao;

import java.util.List;

import com.entities.OrderBook;
import com.entities.OrderDetail;

public interface OrderDao extends GenericDao<OrderBook, String> {
	public boolean insertOrderDetail(OrderBook order, List<OrderDetail> details );
}
