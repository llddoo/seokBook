package com.sb.s1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.board.BoardDAO;
import com.sb.s1.bookList.BookListDAO;

@Service
public class HomeService {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BookListDAO bookListDAO;
	
	public SearchDTO getSearchResultList(String mainsearch) throws Exception {
		mainsearch = "%"+mainsearch+"%";
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setBoardDTOs(boardDAO.searchResultList(mainsearch));
		searchDTO.setBookListDTOs(bookListDAO.getList());
		return searchDTO;
	}
}
