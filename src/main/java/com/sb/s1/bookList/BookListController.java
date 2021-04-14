package com.sb.s1.bookList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/bookList/**")
public class BookListController {

	@Autowired
	private BookListService bookListService;
	
	
	
	@RequestMapping("bookList")
	public void getList(Model model)throws Exception{
		List<BookListDTO> ar= bookListService.getList();
		model.addAttribute("list", ar);
	}
	
	@RequestMapping("bookListSelect")
	public ModelAndView getSelect(BookListDTO bookListDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		bookListDTO = bookListService.getSelect(bookListDTO);
		System.out.println("servie 끝");
		mv.addObject("dto", bookListDTO);
		mv.setViewName("bookList/bookListSelect");
		return mv;
	}
}
