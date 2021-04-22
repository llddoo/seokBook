package com.sb.s1.board;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.util.FileManager;
import com.sb.s1.util.Pager;

@Controller
@RequestMapping("/board/**")
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private FileManager fileManager;
	
	@GetMapping("boardInsert")
	public void boardInsert(Pager pager) { }
	
	@PostMapping("boardInsert")
	public ModelAndView boardInsert(BoardDTO boardDTO) throws Exception{
		boardService.setBoard(boardDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardsp", boardDTO.getBoardsp());
		mav.setViewName("/board/boardCheck");
		return mav;
	}
	
	
	@GetMapping("boardList")
	public void boardList(Pager pager, Model model, HttpSession session) throws Exception {
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setId("admin");
		session.setAttribute("member", boardDTO);
		List<BoardDTO> list = boardService.getList(pager);
		model.addAttribute("list", list);
		model.addAttribute("pager", pager);
		model.addAttribute("listsize", list.size());
	}
	
	@GetMapping("boardSelect")
	public void boardSelect(BoardDTO boardDTO, Model model) throws Exception {
		model.addAttribute("select", boardService.getSelect(boardDTO));
	}
	
	@GetMapping("boardUpdate")
	public void boardUpdate(BoardDTO boardDTO, Model model) throws Exception {
		model.addAttribute("boardDTO", boardService.getSelect(boardDTO));
	}
	
	@PostMapping("boardUpdate")
	public String boardUpdate(BoardDTO boardDTO) throws Exception {
		boardService.updateBoard(boardDTO);
		return "redirect:/board/boardList?boardsp="+boardDTO.getBoardsp();
	}
	
	@GetMapping("boardDelete")
	public ModelAndView boardDelete(BoardDTO boardDTO) throws Exception {
		boardService.delBoard(boardDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardsp", boardDTO.getBoardsp());
		mav.setViewName("/board/boardCheck");
		return mav;
	}
	
	@PostMapping("boardFileUpload")
	public void boardFileUpload(MultipartFile file, String name, Model model) throws Exception{
		model.addAttribute("result", fileManager.upload(file, name));
	}
	
	@PostMapping("boardFileDelete")
	public void boardFileDelete(String path, Model model) throws Exception{
		model.addAttribute("result", fileManager.delete(path));
	}
	
	@PostMapping("boardFileMove")
	public void boardFileMove(String origin, String fixloca, Model model) throws Exception{
		model.addAttribute("result", fileManager.move(origin, fixloca));
	}
}
