package com.sb.s1.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.branch.BranchPager;

@Controller
@RequestMapping("/purchase/**")
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;
	
	@GetMapping("purchaseSelect")
	public ModelAndView getSelect(PurchaseDTO purchaseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		purchaseDTO = purchaseService.getSelect(purchaseDTO);
		mv.addObject("purchase", "purchase");
		mv.addObject("dto", purchaseDTO);
		
		return mv;
	}
	
	@GetMapping("purchaseList")
	public ModelAndView getList(BranchPager branchPager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PurchaseDTO> ar = purchaseService.getList(branchPager);
		mv.addObject("list", ar);
		mv.addObject("purchase", "purchase");
		mv.addObject("branchPager", branchPager);
		mv.setViewName("purchase/purchaseList");
	
		return mv;
	}

}
