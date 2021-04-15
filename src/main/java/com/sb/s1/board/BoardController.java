package com.sb.s1.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/board/**")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("qna/qnaInsert")
	public void moveQnaInsert() {}
	
	@GetMapping("boardList")
	public void boardList(Pager pager) throws Exception {
		
	}
	
	@GetMapping("boardSelect")
	public void boardSelect(BoardDTO boardDTO) throws Exception {
		
	}
	
	@GetMapping("boardUpdate")
	public void boardUpdate() throws Exception {}
	
	@PostMapping("boardUpdate")
	public void boardUpdate(BoardDTO boardDTO) throws Exception {
		
	}
	
	@GetMapping("boardDelete")
	public void boardDelete(BoardDTO boardDTO) throws Exception {
		
	}
	
	@GetMapping("boardInsert")
	public void boardInsert() throws Exception{	}
	
	@PostMapping("boardInsert")
	public void boardInsert(BoardDTO boardDTO) throws Exception{
		
	}
}
