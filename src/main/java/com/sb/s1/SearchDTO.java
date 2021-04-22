package com.sb.s1;

import java.util.List;

import com.sb.s1.board.BoardDTO;
import com.sb.s1.bookList.BookListDTO;

public class SearchDTO {
	
	private List<BoardDTO> boardDTOs;
	private List<BookListDTO> bookListDTOs;
	
	public List<BoardDTO> getBoardDTOs() {
		return boardDTOs;
	}
	public void setBoardDTOs(List<BoardDTO> boardDTOs) {
		this.boardDTOs = boardDTOs;
	}
	public List<BookListDTO> getBookListDTOs() {
		return bookListDTOs;
	}
	public void setBookListDTOs(List<BookListDTO> bookListDTOs) {
		this.bookListDTOs = bookListDTOs;
	}
}
