package com.sb.s1.orderList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderListDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.sb.s1.orderList.OrderListDAO.";
	
	public long insertOrderList(OrderListDTO orderListDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"insertOrderList", orderListDTO);
	}
}
