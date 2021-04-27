package com.sb.s1.bookList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/bookList/**")
public class BookListController {

	@Autowired
	private BookListService bookListService;
	
	private String[] bookList = {"isbn", "bookName", "price", "gNumber", "ebookPrice","bookContent", "bookEx", "bookIdx", "bookPub", "bookScore", "author", "bookPubDate"};
	
	@GetMapping("listBook")
	public void bookList(Pager pager, Model model)throws Exception{
		List<BookListDTO> list=bookListService.getList(pager);
		for(BookListDTO bookListDTO:list) {
			bookListDTO.setBookContent(bookListDTO.getBookContent().substring(0,50));
		}
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("listsize", list.size());
	}
	
	@RequestMapping("bookListSelect")
	public void getSelect(BookListDTO bookListDTO,Model mv)throws Exception{
		bookListDTO = bookListService.getSelect(bookListDTO);
		mv.addAttribute("dto", bookListDTO);
	}
	
	
}
