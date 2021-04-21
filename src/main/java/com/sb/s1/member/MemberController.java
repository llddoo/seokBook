package com.sb.s1.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;








@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("memberDelete")
	public String memberDelete(HttpSession session)throws Exception{
		MemberDTO memberDTO =(MemberDTO)session.getAttribute("member");
		int result = memberService.memberDelete(memberDTO, session);
		
		session.invalidate();
		
		return "redirect:../../";
	}
	
	
	@RequestMapping("memberUpdate")
	public void memberUpdate()throws Exception{
		
	}
	
	
	
	@RequestMapping(value="memberPoint", method = RequestMethod.GET)
	public void memberPoint()throws Exception{
			
	}
	
	@RequestMapping(value="memberPoint", method = RequestMethod.POST)
	public String memberPoint(MemberDTO memberDTO, HttpSession session)throws Exception{
		int result = memberService.memberPoint(memberDTO);
		
		if(result>0) {
			session.setAttribute("member", memberDTO);
		}
		
		return "redirect:";
	}
	
	
	@RequestMapping(value="memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO memberDTO, HttpSession session)throws Exception{
		int result = memberService.memberUpdate(memberDTO);
		
		if(result>0) {
			session.setAttribute("member", memberDTO);
		}
		return "redirect:../../";
	}
	
	
	@RequestMapping("memberPage")
	public void memberPage()throws Exception{
		
	}
	
	
	@RequestMapping("memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	
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
	
	@RequestMapping(value="memberLogin", method = RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO, HttpSession session,Model model)throws Exception{

		memberDTO = memberService.memberLogin(memberDTO);
		String result ="0";
		String path;
		String message ="";
		if(memberDTO==null) {
			result="1";
		}
		
		if(result=="0"){
			path = "redirect:../";
		}else {
			path = "member/memberLoginResult";
			message = "로그인 실패";
			model.addAttribute("msg", message);
		}
			
		session.setAttribute("member", memberDTO);
		
		
		return path;
	}
	
	@RequestMapping("memberJoinCheck")
	public ModelAndView memberJoinCheck()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberJoinCheck");
		
		return mv;
	}
	
	
	@RequestMapping("memberJoin")
	public void memberJoin()throws Exception{}
	
	@RequestMapping(value="memberJoin", method = RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO, Model model,HttpSession session)throws Exception{
		int result = memberService.memberJoin(memberDTO, session);
		
		String message = "회원가입 실패";
		String path="./memberJoin";
		
		if(result>0) {
			message ="회원 가입 성공";
			path="../";
		}
		
		model.addAttribute("msg", message);
		model.addAttribute("path", path);
		return "common/commonResult";
	}

	
	@GetMapping("memberIdCheck")
	public String memberIdCheck (MemberDTO memberDTO,Model model)throws Exception{
		memberDTO = memberService.memberIdCheck(memberDTO);
		String result = "0";//0 사용 불가 1:사용가능
		if(memberDTO==null) {
			result="1";
		}
		
		model.addAttribute("result", result);
		
		return "member/test";
	}
	
	
	
	
}
