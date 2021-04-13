package com.sb.s1.BookList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookListService {

	@Autowired
	private BookListDAO bookListDAO;
	
	
}
