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
		pager.setCurPage(pager.getCurPage() == 0 ? 1 : pager.getCurPage());
		pager.setCurBlock(pager.getCurBlock() == 0 ? 1 : pager.getCurBlock());
		pager.makecal(boardDAO.getTotalcount(pager));
		return boardDAO.getList(pager);
	}
	
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		boardDTO = boardDAO.getSelect(boardDTO);
		boardDAO.setHit(boardDTO);
		boardDTO.setVisitcount(boardDTO.getVisitcount()+1);
		return boardDTO;
	}
	
	public int setBoard(BoardDTO boardDTO) throws Exception {
		String content = boardDTO.getContent();
		content=content.replaceAll("/resources/uploaded/temp", "/resources/uploaded/"+boardDTO.getBoardsp());
		boardDTO.setContent(content);
		return boardDAO.setBoard(boardDTO);
	}
	
	public int delBoard(BoardDTO boardDTO) throws Exception {
		return boardDAO.delBoard(boardDTO);
	}
	
	public int updateBoard(BoardDTO boardDTO) throws Exception {
		String content = boardDTO.getContent();
		content=content.replaceAll("/resources/uploaded/temp", "/resources/uploaded/"+boardDTO.getBoardsp());
		boardDTO.setContent(content);
		return boardDAO.updateBoard(boardDTO);
	}
}
