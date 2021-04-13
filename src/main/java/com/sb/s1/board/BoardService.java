package com.sb.s1.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.util.Pager;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	public List<BoardDTO> getList(Pager pager) throws Exception {
		return boardDAO.getList(pager);
	}
	
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		return boardDAO.getSelect(boardDTO);
	}
	
	public int setBoard(BoardDTO boardDTO) throws Exception {
		return boardDAO.setBoard(boardDTO);
	}
	
	public int delBoard(BoardDTO boardDTO) throws Exception {
		return boardDAO.delBoard(boardDTO);
	}
	
	public int updateBoard(BoardDTO boardDTO) throws Exception {
		return boardDAO.updateBoard(boardDTO);
	}
}
