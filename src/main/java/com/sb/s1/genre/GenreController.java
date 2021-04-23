package com.sb.s1.genre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/genre/**")
public class GenreController {

	@Autowired
	private GenreService genreService;
	
	
	@RequestMapping("genreList")
	public void getList(Model model)throws Exception{
		List<GenreDTO> ar= genreService.getList();
		model.addAttribute("list", ar);
	}
	
}
