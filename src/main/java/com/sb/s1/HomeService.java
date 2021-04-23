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
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setEventDTOs(boardDAO.searchEventList(mainsearch));
		searchDTO.setOldbooksaleDTOs(boardDAO.searchOldbooksaleList(mainsearch));
		searchDTO.setNoticeDTOs(boardDAO.searchNoticeList(mainsearch));
		return searchDTO;
	}
}
