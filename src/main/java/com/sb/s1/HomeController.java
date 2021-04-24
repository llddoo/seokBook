package com.sb.s1;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService homeService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@GetMapping("searchresult")
	public void searchpage(String mainsearch, Model model) throws Exception{
		SearchDTO searchDTO = homeService.getSearchResultList(mainsearch);
		model.addAttribute("oldbookSearchList", searchDTO.getOldbooksaleDTOs());
		model.addAttribute("bookSearchList", searchDTO.getBookListDTOs());
	}
	
	@GetMapping("errorPage")
	public void errorPage() {	}
}
