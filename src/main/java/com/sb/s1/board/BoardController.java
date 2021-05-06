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
	
	private String[] boardlist = {"notice", "event", "qna", "oldbooksale", "saleend", "oldbooklist"};
	
	private boolean boardchecking(String boardsp) throws Exception{
		boolean check = false;
		for(int i = 0 ; i < boardlist.length; i++) {
			if(boardlist[i].equals(boardsp)) {
				check=true;
			}
		}
		return check;
	}
	
	@GetMapping("boardInsert")
	public ModelAndView boardInsert(Pager pager) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/boardInsert");
		if(!boardchecking(pager.getBoardsp())) {
			mav.setViewName("/errorPage");
			return mav;
		}
		if(pager.getBoardsp().equals("oldbooklist")||pager.getBoardsp().equals("saleend")) {
			pager.setBoardsp("oldbooksale");
		}
		mav.addObject("pager", pager);
		return mav;
	}
	
	@PostMapping("boardInsert")
	public ModelAndView boardInsert(BoardDTO boardDTO) throws Exception{
		boardService.setBoard(boardDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardsp", boardDTO.getBoardsp());
		mav.addObject("id", boardDTO.getId());
		mav.setViewName("/board/boardCheck");
		return mav;
	}
	
	
	@GetMapping("boardList")
	public ModelAndView boardList(Pager pager, ModelAndView mav) throws Exception {
		List<BoardDTO> list = boardService.getList(pager);		
		mav.addObject("list", list);
		mav.addObject("pager", pager);
		mav.addObject("listsize", list.size());
		if(!boardchecking(pager.getBoardsp()) || pager.getBoardsp().equals("oldbooksale")
											  || pager.getBoardsp().equals("saleend")) 		{
			mav.setViewName("/errorPage");
		}
		return mav;
	}
	
	@GetMapping("boardSelect")
	public ModelAndView boardSelect(BoardDTO boardDTO, ModelAndView mav) throws Exception {
		boardDTO = boardService.getSelect(boardDTO);
		mav.addObject("select", boardDTO);
		if(boardDTO==null||!boardchecking(boardDTO.getBoardsp())) {
			mav.setViewName("/errorPage");
		}
		return mav;
	}
	
	@GetMapping("boardUpdate")
	public ModelAndView boardUpdate(BoardDTO boardDTO, HttpSession session, ModelAndView model) throws Exception {
		if(!boardchecking(boardDTO.getBoardsp())||boardDTO.getBoardsp().equals("oldbooklist")) {
			model.setViewName("/errorPage");
			return model;
		}
		model.addObject("boardDTO", boardService.getSelect(boardDTO));
		return model;
	}
	
	@PostMapping("boardUpdate")
	public String boardUpdate(BoardDTO boardDTO) throws Exception {
		boardService.updateBoard(boardDTO);
		return "redirect:/board/boardList?boardsp="+boardDTO.getBoardsp();
	}
	
	@PostMapping("boardDelete")
	public ModelAndView boardDelete(BoardDTO boardDTO) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.delBoard(boardDTO);
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
