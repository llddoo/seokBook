package com.sb.s1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("getSelect")
	public ModelAndView getSelect(MemberDTO memberDTO,ModelAndView modelAndView)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getSelect(memberDTO);
		
		
		mv.addObject("dto",memberDTO);
		mv.setViewName("member/getSelect");
		
		
		return mv;
	}
	
	@RequestMapping("memberLogin")
	public ModelAndView memberLogin()throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberLogin");
		
		return mv;
	}
	
	@RequestMapping("memberJoinCheck")
	public ModelAndView memberJoinCheck()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberJoinCheck");
		
		return mv;
	}
	
	
	@RequestMapping("memberJoin")
	public ModelAndView memberJoin()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberJoin");
		
		return mv;
	}
	
	@RequestMapping("memberIdCheck")
	public ModelAndView memberIDCheck (MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
//	
//
//	@RequestMapping("memberUpdate")
//	public void memberUpdate()throws Exception{
//		
//	}
//	
//	@RequestMapping("memberDelete")
//	public void memberDelete()throws Exception{
//		
//	}
//	
//	@RequestMapping("memberLogin")
//	public void memberLogin()throws Exception{
//		
//		
//	}
//	
	
	
}
