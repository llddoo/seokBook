package com.sb.s1.purchase;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.branch.BranchPager;
import com.sb.s1.member.MemberDTO;
import com.sb.s1.member.membercart.MembercartDTO;
import com.sb.s1.member.membercart.MembercartService;

@Controller
@RequestMapping("/purchase/**")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private MembercartService membercartService;
	

	@GetMapping("purchaseSelect")
	public ModelAndView getSelect(PurchaseDTO purchaseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();

		purchaseDTO = purchaseService.getSelect(purchaseDTO);
		mv.addObject("purchase", "purchase");
		mv.addObject("dto", purchaseDTO);

		return mv;
	}

	@GetMapping("purchaseList")
	public ModelAndView getList(BranchPager branchPager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PurchaseDTO> ar = purchaseService.getList(branchPager);
		mv.addObject("list", ar);
		mv.addObject("purchase", "purchase");
		mv.addObject("branchPager", branchPager);
		mv.setViewName("purchase/purchaseList");

		return mv;
	}
	@GetMapping("purchaseInsert")
	public ModelAndView setInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("purchase", "purchase");
		mv.setViewName("purchase/purchaseInsert");

		return mv;
	}
	@PostMapping("purchaseInsert")
	public ModelAndView setInsert(PurchaseDTO purchaseDTO, ModelAndView mv) throws Exception {
		int result = purchaseService.setInsert(purchaseDTO);
		mv.setViewName("redirect:./purchaseList");

		return mv;
	}

	@PostMapping("purchaseDelete")
	public ModelAndView setDelete(PurchaseDTO purchaseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = purchaseService.setDelete(purchaseDTO);

		String message = "삭제 실패";
		String path = "./purchaseList";

		if(result>0) {
			message = "삭제 성공";
		}

		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("purchase/purchaseResult");

		return mv;
	}

	@GetMapping("purchaseUpdate")
	public ModelAndView setUpdate(PurchaseDTO purchaseDTO, ModelAndView mv) throws Exception {

		purchaseDTO = purchaseService.getSelect(purchaseDTO);
		mv.addObject("dto", purchaseDTO);
		mv.addObject("purchase", "purchase");
		mv.setViewName("purchase/purchaseUpdate");
		return mv;
	}

	@PostMapping("purchaseUpdate")
	public ModelAndView setUpdate(PurchaseDTO purchaseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = purchaseService.setUpdate(purchaseDTO);

		String message = "수정 실패";
		String path = "./purchaseList";

		if(result>0) {
			message="수정 성공";
		}
		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("purchase/purchaseResult");

		return mv;
	}	
	
	@PostMapping("purchaseWindow")
	public void purchaseWindow(String[] isbnlist, long[] countlist ,HttpSession httpSession, Model model)throws Exception{
		MemberDTO memberDTO = (MemberDTO)httpSession.getAttribute("member");
		model.addAttribute("user", memberDTO);
		ArrayList<MembercartDTO> list = new ArrayList<MembercartDTO>();
		final int arraysize= isbnlist.length;
		for(int i = 0 ; i < arraysize; i++) {
			MembercartDTO membercartDTO = new MembercartDTO();
			membercartDTO.setIsbn(isbnlist[i]);
			membercartDTO.setBookcount(countlist[i]);
			membercartDTO.setId(memberDTO.getId());
			list.add(membercartDTO);
		}
		model.addAttribute("booklist", membercartService.getCartListforpurchase(list));
	}
}
