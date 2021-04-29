package com.sb.s1.mpurchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.branch.BranchPager;

@Controller
@RequestMapping("/mpurchase/**")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;

	@GetMapping("purchaseSelect")
	public ModelAndView getSelect(PurchaseDTO purchaseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();

		purchaseDTO = purchaseService.getSelect(purchaseDTO);
		mv.addObject("mpurchase", "mpurchase");
		mv.addObject("dto", purchaseDTO);

		return mv;
	}

	@GetMapping("purchaseList")
	public ModelAndView getList(BranchPager branchPager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PurchaseDTO> ar = purchaseService.getList(branchPager);
		mv.addObject("list", ar);
		mv.addObject("mpurchase", "mpurchase");
		mv.addObject("branchPager", branchPager);
		mv.setViewName("mpurchase/purchaseList");

		return mv;
	}
	@GetMapping("purchaseInsert")
	public ModelAndView setInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("mpurchase", "mpurchase");
		mv.setViewName("mpurchase/purchaseInsert");

		return mv;
	}
	@PostMapping("purchaseInsert")
	public ModelAndView setInsert(PurchaseDTO purchaseDTO, ModelAndView mv) throws Exception {
		int result = purchaseService.setInsert(purchaseDTO);
		mv.setViewName("redirect:./purchaseList");

		return mv;
	}

	@PostMapping("purchaseDelete")
	public ModelAndView setDelete(PurchaseDTO purchaseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = purchaseService.setDelete(purchaseDTO);

		String message = "삭제 실패";
		String path = "./purchaseList";

		if(result>0) {
			message = "삭제 성공";
		}

		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("mpurchase/purchaseResult");

		return mv;
	}

	@GetMapping("purchaseUpdate")
	public ModelAndView setUpdate(PurchaseDTO purchaseDTO, ModelAndView mv) throws Exception {

		purchaseDTO = purchaseService.getSelect(purchaseDTO);
		mv.addObject("dto", purchaseDTO);
		mv.addObject("mpurchase", "mpurchase");
		mv.setViewName("mpurchase/purchaseUpdate");
		return mv;
	}

	@PostMapping("purchaseUpdate")
	public ModelAndView setUpdate(PurchaseDTO purchaseDTO) throws Exception {
		ModelAndView mv = new ModelAndView();

		int result = purchaseService.setUpdate(purchaseDTO);

		String message = "수정 실패";
		String path = "./purchaseList";

		if(result>0) {
			message="수정 성공";
		}
		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.setViewName("mpurchase/purchaseResult");

		return mv;
	}	
}