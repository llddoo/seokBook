package com.sb.s1.orderList;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.util.Pager;



@Service
public class OrderListService {

	@Autowired
	private OrderListDAO orderListDAO;
	

	public long insertOrderList(OrderListDTO orderListDTO)throws Exception{
		return orderListDAO.insertOrderList(orderListDTO);
	}
	
	
	public  List<OrderListDTO> PointList(Pager pager)throws Exception{
		pager.setPerBlock(5);
		pager.setPerPage(5);
		
		if(pager.getCurPage()<1) {
			
			pager.setCurPage(1);
		} 
		if(pager.getCurBlock()<1) {
			pager.setCurBlock(1);
			
		}
		
		
		pager.makecal(orderListDAO.getTotalCount(pager));
		
		
		return orderListDAO.PointList(pager);
	}
	
}
