package com.sb.s1.response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/board/response/**")
public class ResponseController {

	@Autowired
	private ResponseService responseService;
	
	@GetMapping("responseList")
	public void responseList(Pager pager, Model model)throws Exception{
		model.addAttribute("commentList", responseService.getList(pager));
	}
	
	@GetMapping("responseDelete")
	public void responseDelete(ResponseDTO responseDTO) throws Exception{
		
	}
	
	@GetMapping("responseUpdate")
	public void responseUpdate() throws Exception{	
		
	}
	
	@PostMapping("responseUpdate")
	public void responseUpdate(ResponseDTO responseDTO) throws Exception{
		responseService.updateResponse(responseDTO);
	}
	
	@PostMapping("responseInsert")
	public void responseInsert(ResponseDTO responseDTO, Model model) throws Exception{
		int result = responseService.insertResponse(responseDTO);
		model.addAttribute("result", result);
	}
}
