package com.sb.s1;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.board.BoardDAO;
import com.sb.s1.board.BoardDTO;
import com.sb.s1.bookList.BookListDAO;
import com.sb.s1.bookList.BookListDTO;
import com.sb.s1.genre.GenreDAO;
import com.sb.s1.genre.GenreDTO;

@Service
public class HomeService {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BookListDAO bookListDAO;
	@Autowired
	private GenreDAO genreDAO;
	
	public SearchDTO getSearchResultList(String mainsearch) throws Exception {
		BoardDTO boardDTO = new BoardDTO();
		BookListDTO bookListDTO = new BookListDTO();
		GenreDTO genreDTO = new GenreDTO();
		SearchDTO searchDTO = new SearchDTO();
		
		boardDTO.setSubname(mainsearch);
		boardDTO.setContent(mainsearch);
		boardDTO.setId(mainsearch);
		searchDTO.setOldbooksaleDTOs(boardDAO.searchOldbooksaleList(boardDTO));
		
		bookListDTO.setAuthor(mainsearch);
		bookListDTO.setBookName(mainsearch);
		bookListDTO.setIsbn(mainsearch);
		bookListDTO.setBookPub(mainsearch);
		genreDTO.setGname(mainsearch);
		bookListDTO.setgNumber(genreDAO.getGenrenum(genreDTO));
		searchDTO.setBookListDTOs(bookListDAO.searchBookList(bookListDTO));
		List<BookListDTO> booklist = searchDTO.getBookListDTOs();
		for(BookListDTO boListDTO:booklist) {
			if(boListDTO.getBookContent()!=null&&boListDTO.getBookContent().length()>160) {
				boListDTO.setBookContent(boListDTO.getBookContent().substring(0, 160));
				boListDTO.setBookContent(boListDTO.getBookContent()+"...");
			}	
		}
		return searchDTO;
	}
}
