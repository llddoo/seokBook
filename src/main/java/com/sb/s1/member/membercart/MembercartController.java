package com.sb.s1.member.membercart;

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

import com.sb.s1.bookList.BookListDTO;
import com.sb.s1.member.MemberDTO;
import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/member/membercart/**")
public class MembercartController {

	@Autowired
	private MembercartService membercartService;
	
	@GetMapping("membercartList")
	public ModelAndView membercartList(Pager pager, HttpSession httpSession, ModelAndView model) throws Exception{
		MemberDTO memberDTO = (MemberDTO) httpSession.getAttribute("member");
		if(memberDTO==null||!memberDTO.getId().equals(pager.getId())) {
			model.setViewName("./errorPage");
			return model;
		}
		List<MembercartDTO> list = membercartService.getCartList(pager);
		model.addObject("booklist", list);
		model.addObject("listsize", list.size());
		model.addObject("pager", pager);
		return model;
	}
	
	@PostMapping("membercartInsert")
	public void membercartInsert(MembercartDTO membercartDTO, Model model)throws Exception{
		if(membercartService.checkBook(membercartDTO)!=null) {
			model.addAttribute("result", 0);
			return;
		}
		model.addAttribute("result", membercartService.addCart(membercartDTO));
	}
	
	@PostMapping("membercartDelete")
	public void membercartDelete(MembercartDTO membercartDTO, Model model) throws Exception {
		model.addAttribute("result", membercartService.delete(membercartDTO));
	}
	
	@PostMapping("membercartUpdate")
	public void membercartUpdate(MembercartDTO membercartDTO, HttpSession httpSession, Model model)throws Exception{
		MemberDTO memberDTO = (MemberDTO)httpSession.getAttribute("member");
		membercartDTO.setId(memberDTO.getId());
		model.addAttribute("result", membercartService.updateCart(membercartDTO));
	}
	
	@PostMapping("membercartDeleteList")
	public void membercartDeleteList(long[] cartNumlist, Model model) throws Exception {
		ArrayList<Long> arr = new ArrayList<Long>();
		for(long i : cartNumlist) {
			arr.add(i);
		}
		model.addAttribute("result", membercartService.deleteList(arr));
	}
}
