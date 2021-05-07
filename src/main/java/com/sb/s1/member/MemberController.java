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

import com.sb.s1.orderList.OrderListDTO;


@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	
	@Autowired
	private MemberService memberService;
	
	
	
	
	
	@GetMapping("memberBoxList")
	public void memberBoxList()throws Exception{
		
	}
	
	
	@GetMapping("memberFindPW")
	public void memberFindPw()throws Exception{
		
	}
	
	@GetMapping("memberSearchPw")
	public void membersearchPw(MemberDTO memberDTO, Model model) throws Exception{
		memberDTO = memberService.memberFindPw(memberDTO);
		String str;
		if(memberDTO==null) {
			str="null";
		}else {
			str=memberDTO.getPw();
		}
		model.addAttribute("result", str);
	}
	
	@GetMapping("memberFindID")
	public void memberFindID()throws Exception{
		
	}
	
	@GetMapping("memberSearchId")
	public void membersearchId(MemberDTO memberDTO, Model model) throws Exception{
		memberDTO = memberService.memberFindID(memberDTO);
		String str;
		if(memberDTO==null) {
			str="null";
		}else {
			str=memberDTO.getId();
		}
		model.addAttribute("result", str);
	}
	
	@GetMapping("memberDelete")
	public String memberDelete(HttpSession session)throws Exception{
		MemberDTO memberDTO =(MemberDTO)session.getAttribute("member");
		int result = memberService.memberDelete(memberDTO, session);
		
		session.invalidate();
		
		return "redirect:../../";
	}
	
	
	@GetMapping("memberUpdate")
	public void memberUpdate()throws Exception{
		
	}
	
	
	@GetMapping("memberPoint")
	public void memberPoint()throws Exception{
		
	}
	
	
	
	
	@PostMapping("memberUpdate")
	public String memberUpdate(MemberDTO memberDTO, HttpSession session)throws Exception{
		int result = memberService.memberUpdate(memberDTO);
		memberDTO = memberService.getSelect(memberDTO);
		if(result>0) {
			session.setAttribute("member", memberDTO);
		}
		
		
		return "redirect:../../";
	}
	
	
	@GetMapping("memberPage")
	public void memberPage()throws Exception{
		
	}
	
	
	@GetMapping("memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	
	@GetMapping("memberBox")
	public void memberBox() throws Exception{
		
	}
	
	@GetMapping("getSelect")
	public ModelAndView getSelect(MemberDTO memberDTO,ModelAndView modelAndView)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getSelect(memberDTO);
		
		
		mv.addObject("dto",memberDTO);
		mv.setViewName("member/getSelect");
		
		
		return mv;
	}
	
	@GetMapping("memberLogin")
	public void memberLogin()throws Exception{

	}
	
	@PostMapping("memberLogin")
	public String memberLogin(MemberDTO memberDTO, HttpSession session)throws Exception{

		memberDTO = memberService.memberLogin(memberDTO);
		boolean result =true;
		String path;
		if(memberDTO==null) {
			result = false;
		}
		
		if(result){
			path = "redirect:../";
		}else {
			path = "member/memberLoginResult";
			
		}
			
		session.setAttribute("member", memberDTO);
		
		
		return path;
	}
	
	@GetMapping("memberJoinCheck")
	public ModelAndView memberJoinCheck()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/memberJoinCheck");
		
		return mv;
	}
	
	
	@GetMapping("memberJoin")
	public void memberJoin()throws Exception{}
	
	@PostMapping("memberJoin")
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
	   public void memberIdCheck (MemberDTO memberDTO,Model model)throws Exception{
	      memberDTO = memberService.memberIdCheck(memberDTO);
	      String result = "";//0 사용 불가 1:사용가능
	      if(memberDTO==null) {
	         result="null";
	      }      
	      model.addAttribute("result", result);
	   }
	  
	  @GetMapping("memberPointList")
	  public void memberPointList() throws Exception{
		  
	  }
	  
	  
	  @GetMapping("memberProfile")
      public void memberProfile(Model model,HttpSession session)throws Exception{
         MemberDTO memberDTO =(MemberDTO)session.getAttribute("member");

         String grade;
         
         memberDTO = memberService.memberGrade(memberDTO);
         if(memberDTO!=null) {
            
            if(memberDTO.getPrice() >= 60000) {   
                grade = "최우수등급";
             }else if(memberDTO.getPrice() >= 40000) {
                grade = "우수등급";
             }else if(memberDTO.getPrice() >= 20000) {
                grade = "맴버등급";
             }else{
                grade = "일반등급";
             }
             System.out.println(memberDTO.getGrade() + "//////" + memberDTO.getPrice() + "////" + memberDTO.getId());
             
             memberDTO.setGrade(grade);
             
             System.out.println(memberDTO.getGrade() + "//////" + memberDTO.getPrice() + "////" + memberDTO.getId());
             
             int result = memberService.gradeUpdate(memberDTO);
             memberDTO = memberService.getSelect(memberDTO);
             
             if(result > 0) {
                session.setAttribute("member", memberDTO);
             }
            
            
         }
         
         
         
      }

	  
	
	  
	  @GetMapping("selectUserInfo")
	  public void selectUserInfo(MemberDTO memberDTO, Model model)throws Exception{
		  memberDTO = memberService.selectUserInfo(memberDTO);
		  model.addAttribute("user", memberDTO);
	  }
		
}
