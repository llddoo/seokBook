package com.sb.s1.purchase.mpurchase;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.branch.BranchPager;
import com.sb.s1.purchase.PurchaseDTO;
import com.sb.s1.purchase.PurchaseService;

@Controller
@RequestMapping("/purchase/mpurchase/**")
public class MPurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	
	@GetMapping("purchaseGetList")
	public ModelAndView getSelectList(PurchaseDTO purchaseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<PurchaseDTO> ar = purchaseService.getSelectList();
		mv.addObject("list", ar);
		mv.addObject("dto", purchaseDTO);
		
		return mv;
	}
	
}