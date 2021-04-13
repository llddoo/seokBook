package com.sb.s1.branch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/branch/**")
public class BranchController {
	
	@Autowired
	private BranchService branchService;
	
	@RequestMapping("branchInsert")
	public ModelAndView setInsert() throws Exception {
		ModelAndView mv = new ModelAndView();

		return mv;
	}
	
}
