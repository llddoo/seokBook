package com.sb.s1.response;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sb.s1.member.MemberDTO;
import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/board/response/**")
public class ResponseController {

	@Autowired
	private ResponseService responseService;
	
	@GetMapping("responseList")
	public void responseList(Pager pager, HttpSession session, Model model)throws Exception{
		List<ResponseDTO> list = responseService.getList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("commentList", list);
		model.addAttribute("listsize", list.size());
		model.addAttribute("user", (MemberDTO)session.getAttribute("member"));
	}
	
	@GetMapping("responseDelete")
	public void responseDelete(ResponseDTO responseDTO, Model model) throws Exception{
		model.addAttribute("result", responseService.delResponse(responseDTO));
	}
	
	@PostMapping("responseUpdate")
	public void responseUpdate(ResponseDTO responseDTO, Model model) throws Exception{
		long result = responseService.updateResponse(responseDTO);
		model.addAttribute("result", result);
	}
	
	@PostMapping("responseInsert")
	public void responseInsert(ResponseDTO responseDTO, Model model) throws Exception{
		long result = responseService.insertResponse(responseDTO);
		model.addAttribute("result", result);
	}
}
