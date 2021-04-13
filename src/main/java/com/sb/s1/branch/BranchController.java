package com.sb.s1.branch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/branch/**")
public class BranchController {
	
	@Autowired
	private BranchService branchService;
	
	
	
}
