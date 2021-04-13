package com.sb.s1.bookList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bookList/**")
public class BookListController {

	@Autowired
	private BookListService bookListService;
	
}
