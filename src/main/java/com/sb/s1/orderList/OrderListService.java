package com.sb.s1.orderList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.member.MemberDAO;
import com.sb.s1.member.MemberDTO;
import com.sb.s1.purchase.PurchaseDTO;









@Service
public class OrderListService {

	@Autowired
	private OrderListDAO orderListDAO;
	
	

	
	public  List<OrderListDTO> PointList(OrderListDTO orderListDTO)throws Exception{
		return orderListDAO.PointList(orderListDTO);
	}
	

}
