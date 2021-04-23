package com.sb.s1;

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
		boardDTO.setSubname(mainsearch);
		boardDTO.setContent(mainsearch);
		boardDTO.setId(mainsearch);
		BookListDTO bookListDTO = new BookListDTO();
		bookListDTO.setAuthor(mainsearch);
		bookListDTO.setBookName(mainsearch);
		bookListDTO.setIsbn(mainsearch);
		bookListDTO.setBookPub(mainsearch);
		GenreDTO genreDTO = new GenreDTO();
		genreDTO.setGname(mainsearch);
		bookListDTO.setgNumber(genreDAO.getGenrenum(genreDTO));
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setOldbooksaleDTOs(boardDAO.searchOldbooksaleList(boardDTO));
		searchDTO.setBookListDTOs(bookListDAO.searchBookList(bookListDTO));
		return searchDTO;
	}
}
