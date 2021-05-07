package com.sb.s1.purchase;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.bookList.BookListDTO;
import com.sb.s1.bookList.BookListService;
import com.sb.s1.member.MemberDTO;
import com.sb.s1.member.MemberService;
import com.sb.s1.member.membercart.MembercartDTO;
import com.sb.s1.member.membercart.MembercartService;
import com.sb.s1.orderList.OrderListDTO;
import com.sb.s1.orderList.OrderListService;
import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/purchase/**")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private MembercartService membercartService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private OrderListService orderListService;
	@Autowired
	private BookListService bookListService;


	@GetMapping("mpurchase/purchaseList")
	public void getList() throws Exception {	}

	@PostMapping("purchaseWindow")
	public void purchaseWindow(HttpServletRequest httpServletRequest ,HttpSession httpSession, Model model)throws Exception{
		String[] isbnlist = httpServletRequest.getParameterValues("isbnlist");
		final int arraysize= isbnlist.length;
		ArrayList<BookListDTO> bookListDTOs = new ArrayList<BookListDTO>();
		for(String str1 : isbnlist) {
			BookListDTO bookListDTO = new BookListDTO();
			bookListDTO.setIsbn(str1);
			
			bookListDTOs.add(bookListDTO);
		}
		
		String[] countlists = httpServletRequest.getParameterValues("countlist");
		long[] countlist = new long[arraysize];
		for(int i = 0 ; i < arraysize; i++) {
			countlist[i] = Long.parseLong(countlists[i]);
		}
		
		MemberDTO memberDTO = (MemberDTO)httpSession.getAttribute("member");
		memberDTO = memberService.getSelect(memberDTO);
		model.addAttribute("user", memberDTO);
		
		ArrayList<MembercartDTO> membercartList = new ArrayList<MembercartDTO>();
		List<BookListDTO> bookLists = bookListService.getListforpur(bookListDTOs);
		for(int i = 0 ; i < arraysize; i++) {
			MembercartDTO membercartDTO = new MembercartDTO();
			membercartDTO.setIsbn(isbnlist[i]);
			membercartDTO.setBookcount(countlist[i]);
			membercartDTO.setId(memberDTO.getId());
			membercartDTO.setBookListDTO(bookLists.get(i));
			
			membercartList.add(membercartDTO);
		}
		model.addAttribute("booklist", membercartList);
		
		String purchasename = membercartList.get(0).getBookListDTO().getBookName();
		if(arraysize > 1) {
			purchasename+=" 외 "+(arraysize-1)+"권";
		}
		model.addAttribute("purchasename", purchasename);
		
		long allprice = 0;
		long allpoint = 0;
		for(MembercartDTO membercartDTO : membercartList) {
			allprice += membercartDTO.getBookListDTO().getPrice()*membercartDTO.getBookcount();
			allpoint += membercartDTO.getBookListDTO().getbPoint();
		}
		model.addAttribute("pricesum", allprice*9/10);
		model.addAttribute("willgetpoint", allpoint);
	}
	
	@Transactional
	@PostMapping("purchaseSequence")
	public void purchaseSequence(HttpServletRequest httpServletRequest, Model model)throws Exception{
		String[] isbnlist = httpServletRequest.getParameterValues("isbnlist");
		int listsize = isbnlist.length;
		
		String[] countlists = httpServletRequest.getParameterValues("countlist");
		long[] countlist = new long[listsize];
		for(int i = 0 ; i < listsize ; i++) {
			countlist[i]=Long.parseLong(countlists[i]);
		}
		
		String[] pricelists = httpServletRequest.getParameterValues("pricelist");
		long[] pricelist = new long[listsize];
		for(int i = 0 ; i < listsize ; i++) {
			pricelist[i]=Long.parseLong(pricelists[i]);
		}
		
		String id = httpServletRequest.getParameter("id");
		String ordernumber = httpServletRequest.getParameter("ordernumber");
		long spendpoint = Long.parseLong(httpServletRequest.getParameter("spendpoint"));
		long getpoint = Long.parseLong(httpServletRequest.getParameter("getpoint"));
		long amount = Long.parseLong(httpServletRequest.getParameter("amount"));
		long result = 0;
		
		ArrayList<MembercartDTO> membercartDTOs = new ArrayList<MembercartDTO>();
		for(int i = 0 ; i < listsize; i++) {
			MembercartDTO membercartDTO = new MembercartDTO();
			membercartDTO.setId(id);
			membercartDTO.setIsbn(isbnlist[i]);
			
			membercartDTOs.add(membercartDTO);
		}
		result += membercartService.deleteListAfterPur(membercartDTOs);
		
		OrderListDTO orderListDTO = new OrderListDTO();
		orderListDTO.setOrderNumber(ordernumber);
		orderListDTO.setPointUsage(spendpoint);
		orderListDTO.setLumpSum(amount);
		result += (orderListService.insertOrderList(orderListDTO) == 0) ? Integer.MIN_VALUE : 1;
		
		ArrayList<PurchaseDTO> purchaseDTOs = new ArrayList<PurchaseDTO>();
		for(int i = 0 ; i < listsize; i++) {
			PurchaseDTO purchaseDTO = new PurchaseDTO();
			purchaseDTO.setId(id);
			purchaseDTO.setIsbn(isbnlist[i]);
			purchaseDTO.setPurcount(countlist[i]);
			purchaseDTO.setRemdate(-1);
			purchaseDTO.setPrice(countlist[i]*pricelist[i]*9/10);
			purchaseDTO.setOrdernumber(ordernumber);
			
			purchaseDTOs.add(purchaseDTO);
		}
		result += (purchaseService.setPurchase(purchaseDTOs) == 0) ? Integer.MIN_VALUE : 1;
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setPoint(getpoint-spendpoint);
		result += (memberService.pointAfterPur(memberDTO) == 0) ? Integer.MIN_VALUE : 1;
		
		model.addAttribute("result", result);
	}
	
	@PostMapping("purchaseSidebar")
	public void purchaseSidebar(HttpServletRequest httpServletRequest, Model model)throws Exception{
		model.addAttribute("point", Long.parseLong(httpServletRequest.getParameter("point")));
		model.addAttribute("itemsprice", Long.parseLong(httpServletRequest.getParameter("itemsprice")));
		model.addAttribute("willgetpoint", Long.parseLong(httpServletRequest.getParameter("willgetpoint")));
	}
	
	@PostMapping("purchaseComplete")
	public void purchaseComplete(HttpServletRequest httpServletRequest, Model model)throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(httpServletRequest.getParameter("id"));
		
		model.addAttribute("user", memberService.getSelect(memberDTO));
		model.addAttribute("msg", httpServletRequest.getParameter("msg"));
		model.addAttribute("amount", Long.parseLong(httpServletRequest.getParameter("amount")));
		model.addAttribute("ordernumber", httpServletRequest.getParameter("ordernumber"));
		model.addAttribute("purchasename", httpServletRequest.getParameter("purchasename"));
		model.addAttribute("getpoint", Long.parseLong(httpServletRequest.getParameter("getpoint")));
	}
	
	
	@GetMapping("userPurchase")
	public ModelAndView userPurchase(Pager pager,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO =(MemberDTO)session.getAttribute("member");
		 pager.setId(memberDTO.getId());
		List<PurchaseDTO> list =  purchaseService.userPurchase(pager);
		
		 mv.addObject("list",list);
	      mv.addObject("pager", pager);
		mv.setViewName("purchase/userPurchase");
		
		return mv;
	}
	
}
