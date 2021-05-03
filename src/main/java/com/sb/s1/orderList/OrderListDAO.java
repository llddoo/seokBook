package com.sb.s1.orderList;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.sb.s1.bookList.BookListDTO;
import com.sb.s1.member.MemberDTO;
import com.sb.s1.purchase.PurchaseDTO;







@Repository
public class OrderListDAO {


	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE="com.sb.s1.orderList.OrderListDAO.";



	
	
	public List<OrderListDTO> PointList(OrderListDTO orderListDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"PointList",orderListDTO);
	}
	
}
