package com.sb.s1.branch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/branch/**")
public class BranchController {
	
	@Autowired
	private BranchService branchService;
	
	
	
	@GetMapping("branchSelect")
	public ModelAndView getSelect(BranchDTO branchDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		branchDTO = branchService.getSelect(branchDTO);
		mv.addObject("branch", "branch");
		mv.addObject("dto", branchDTO);
		return mv;
	}
	
	@GetMapping("branchList")
	public ModelAndView getList(BranchPager branchPager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BranchDTO> ar = branchService.getList(branchPager);
		mv.addObject("list", ar);
		mv.addObject("branch", "branch");
		mv.addObject("branchPager", branchPager);
		mv.setViewName("branch/branchList");
		
		return mv;
	}
	
	
	@GetMapping("branchInsert")
	public ModelAndView setInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("branch", "branch");
		mv.setViewName("branch/branchInsert");
		
		return mv;
	}
	@PostMapping("branchInsert")
	public ModelAndView setInsert(BranchDTO branchDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = branchService.setInsert(branchDTO);
		mv.setViewName("redirect:./branchList");
		return mv;
	}
	
	@PostMapping("branchDelete")
	public ModelAndView setDelete(BranchDTO branchDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = branchService.setDelete(branchDTO);
		
		String message = "삭제 실패했습니다ㅠ";
		String path = "./branchList";
		
		if(result>0) {
			message = "삭제 성공했습니다ㅎ";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("branch/branchResult");
		
		return mv;
	}

	
	@GetMapping("branchUpdate")
	public ModelAndView setUpdate(BranchDTO branchDTO, ModelAndView mv) throws Exception {
		
		branchDTO = branchService.getSelect(branchDTO);
		mv.addObject("dto", branchDTO);
		mv.addObject("branch", "branch");
		mv.setViewName("branch/branchUpdate");
		
		return mv;
	}
	
	
	
	@PostMapping("branchUpdate")
	public ModelAndView setUpdate(BranchDTO branchDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = branchService.setUpdate(branchDTO);
		
		String message = "수정 실패ㅠ";
		String path = "./branchList";
		
		if(result>0) {
			message = "수정 성공ㅎ";
		}
		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("branch/branchResult");
		
//		if(result>0) {
//			mv.setViewName("redirect:./branchList"); //성공 시 리스트로 이동
//		}else {
//			mv.addObject("msg", "수정 실패ㅠ");
//			mv.addObject("path", "./branchList");
//			mv.setViewName("branch/branchResult");
//		}
		return mv;
	}
}
