package com.sb.s1.response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/response/**")
public class ResponseController {

	@Autowired
	private ResponseService responseService;
	
	@GetMapping("responseList")
	public void responseList()throws Exception{
		
	}
	
	@GetMapping("responseDelete")
	public void responseDelete(ResponseDTO responseDTO) throws Exception{
		
	}
	
	@GetMapping("responseUpdate")
	public void responseUpdate() throws Exception{	}
	
	@PostMapping("responseUpdate")
	public void responseUpdate(ResponseDTO responseDTO) throws Exception{
		
	}
	
	@PostMapping("responseInsert")
	public void responseInsert(ResponseDTO responseDTO) throws Exception{
		
	}
}
