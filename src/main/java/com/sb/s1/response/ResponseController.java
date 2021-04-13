package com.sb.s1.response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/response/**")
public class ResponseController {

	@Autowired
	private ResponseService responseService;
	
	@GetMapping("responseList")
	public void responseList(Pager pager)throws Exception{
		pager.setPerPage(15);
		pager.setPerBlock(5);
	}
	
	@GetMapping("responseDelete")
	public void responseDelete(ResponseDTO responseDTO) throws Exception{
		
	}
	
	@GetMapping("responseUpdate")
	public void responseUpdate() throws Exception{	
		
	}
	
	@PostMapping("responseUpdate")
	public void responseUpdate(ResponseDTO responseDTO) throws Exception{
		int result = responseService.updateResponse(responseDTO);
	}
	
	@PostMapping("responseInsert")
	public void responseInsert(ResponseDTO responseDTO) throws Exception{
		
	}
}