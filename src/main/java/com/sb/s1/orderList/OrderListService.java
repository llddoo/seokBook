package com.sb.s1.orderList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderListService {

	@Autowired
	private OrderListDAO orderListDAO;
	
	public long insertOrderList(OrderListDTO orderListDTO)throws Exception{
		return orderListDAO.insertOrderList(orderListDTO);
	}
}
