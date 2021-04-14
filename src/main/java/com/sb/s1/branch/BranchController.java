package com.sb.s1.branch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/branch/**")
public class BranchController {
	
	@Autowired
	private BranchService branchService;
	
	@RequestMapping("branchInsert")
	public int setInsert(BranchDTO branchDTO, Model model) throws Exception {
		
		int result = branchService.setInsert(branchDTO);
		model.addAttribute("dto", branchDTO);
		
		return result;
		
		
	}
	
}
