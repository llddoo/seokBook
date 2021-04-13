package com.sb.s1.bookList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookListService {

	@Autowired
	private BookListDAO bookListDAO;
	
	public int setUpdate(BookListDTO bookListDTO)throws Exception{
		return bookListDAO.setUpdate(bookListDTO);
	}
	
	public int setDelete(BookListDTO bookListDTO)throws Exception{
		return bookListDAO.setDelete(bookListDTO);
	}
	
	public List<BookListDTO> getList()throws Exception{
		return bookListDAO.getList();
	}
	
	public BookListDTO getSelect(BookListDTO bookListDTO) throws Exception{
		System.out.println("select service");
		return bookListDAO.getSelect(bookListDTO);
	}

	
}
