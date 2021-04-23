package com.sb.s1;

import java.util.List;

import com.sb.s1.board.BoardDTO;
import com.sb.s1.bookList.BookListDTO;

public class SearchDTO {
	
	private List<BoardDTO> oldbooksaleDTOs;
	private List<BookListDTO> bookListDTOs;
	
	public List<BoardDTO> getOldbooksaleDTOs() {
		return oldbooksaleDTOs;
	}
	public void setOldbooksaleDTOs(List<BoardDTO> oldbooksaleDTOs) {
		this.oldbooksaleDTOs = oldbooksaleDTOs;
	}
	public List<BookListDTO> getBookListDTOs() {
		return bookListDTOs;
	}
	public void setBookListDTOs(List<BookListDTO> bookListDTOs) {
		this.bookListDTOs = bookListDTOs;
	}
}
