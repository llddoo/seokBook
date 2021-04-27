package com.sb.s1.member;

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


@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("memberFindID")
	public void memberFindID()throws Exception{
		
	}
	
	@RequestMapping(value = "memberFindID", method = RequestMethod.POST)
	public ModelAndView memberFindID(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.memberFindID(memberDTO);
		String message="";
		String id="";
		if (memberDTO == null) {
			System.out.println("가입된 아이디가 없습니다.");
			message="가입된 아이디가 없습니다";
			
		} else {
			 id = memberDTO.getId();
		}
		
		mv.addObject(message,"msg");
		mv.addObject(id ,"id");
		mv.setViewName("member/memberFindID");
		return mv;
	}
	
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
	
	
	
//	@RequestMapping(value="memberPoint")
//	public void memberPoint()throws Exception{
//			
//	}
	
	@RequestMapping(value="memberPoint")
	public String memberPoint(MemberDTO memberDTO, HttpSession session)throws Exception{
		int result = memberService.memberPoint(memberDTO,session);
		
		session.invalidate();
		
		return "redirect:../../";
	
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
	public void memberLogin()throws Exception{

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
	
	
	@GetMapping("selectUserInfo")
	public void selectUserInfo(MemberDTO memberDTO, Model model)throws Exception{
		memberDTO = memberService.selectUserInfo(memberDTO);
		model.addAttribute("user", memberDTO);
	}
	
}
