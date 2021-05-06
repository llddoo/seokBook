package com.sb.s1.orderList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.branch.BranchDTO;
import com.sb.s1.member.MemberDTO;
import com.sb.s1.purchase.PurchaseDTO;


@Controller
@RequestMapping("/orderList/**")
public class OrderListController {

	
	@Autowired
	private OrderListService orderListService;
	

	   @GetMapping("PointList")
	   public ModelAndView PointList(OrderListDTO orderListDTO,MemberDTO memberDTO,HttpSession session )throws Exception{
	      ModelAndView mv = new ModelAndView();
	      memberDTO =(MemberDTO)session.getAttribute("member");
	      orderListDTO.setId(memberDTO.getId());
	      // orderListDTO = memberService.memberPointList(orderListDTO);
	      List<OrderListDTO> ar =  orderListService.PointList(orderListDTO);

	      mv.addObject("list",ar);
	      mv.setViewName("orderList/PointList");

	      return mv;
	   }
}
