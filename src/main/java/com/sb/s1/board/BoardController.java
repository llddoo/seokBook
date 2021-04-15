package com.sb.s1.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sb.s1.member.MemberDTO;
import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/board/**")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("boardInsert")
	public void boardInsert(Pager pager) {
		
	}
	
	@PostMapping("boardInsert")
	public String boardInsert(BoardDTO boardDTO) throws Exception{
		boardService.setBoard(boardDTO);
		return "redirect:/board/boardList";
	}
	
	
	@GetMapping("boardList")
	public void boardList(Pager pager, Model model) throws Exception {
		model.addAttribute("list", boardService.getList(pager));
	}
	
	@GetMapping("boardSelect")
	public void boardSelect(BoardDTO boardDTO, Model model) throws Exception {
		model.addAttribute("select", boardService.getSelect(boardDTO));
	}
	
	@GetMapping("boardUpdate")
	public void boardUpdate() throws Exception {}
	
	@PostMapping("boardUpdate")
	public void boardUpdate(BoardDTO boardDTO) throws Exception {
		
	}
	
	@GetMapping("boardDelete")
	public void boardDelete(BoardDTO boardDTO) throws Exception {
		
	}
	
	
	
}
