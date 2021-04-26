package com.sb.s1.member.membercart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/member/membercart/**")
public class MembercartController {

	@Autowired
	private MembercartService membercartService;
	
	@GetMapping("membercartList")
	public void membercartList(Pager pager, Model model) throws Exception{
		model.addAttribute("cartList", membercartService.getCartList(pager));
	}
	
	@PostMapping("membercartInsert")
	public void membercartInsert(MembercartDTO membercartDTO, Model model)throws Exception{
		model.addAttribute("result", membercartService.addCart(membercartDTO));
	}
	
	@PostMapping("membercartDelete")
	public void membercartDelete(MembercartDTO membercartDTO, Model model) throws Exception {
		model.addAttribute("result", membercartService.delete(membercartDTO));
	}
}
