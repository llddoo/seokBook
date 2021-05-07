package com.sb.s1.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sb.s1.board.BoardDTO;
import com.sb.s1.bookList.BookListDTO;
import com.sb.s1.bookList.BookListService;
import com.sb.s1.member.MemberDTO;
import com.sb.s1.util.Pager;


@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private BookListService bookListService;
	
	@PostMapping("reviewGetList")
	public void reviewGetList(Pager pager,Model model)throws Exception{
		List<ReviewDTO> list=reviewService.getList(pager);
		model.addAttribute("reviews", list);
		model.addAttribute("pager", pager);
		model.addAttribute("listsize", list.size());
	}
	
	@PostMapping("setReview")
	public void setReview(ReviewDTO reviewDTO, HttpSession session,Model model) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		if(memberDTO==null) {
			model.addAttribute("result", 0);
		}else {
			reviewDTO.setId(memberDTO.getId());
			bookListService.updateScore(reviewDTO);
			model.addAttribute("result", reviewService.setReview(reviewDTO));
		}
	}
	
	@PostMapping("delReview")
	public void delReview(ReviewDTO reviewDTO,Model model) throws Exception {
		bookListService.deleteScore(reviewDTO);
		model.addAttribute("result", reviewService.delReview(reviewDTO));
	}
	
	
}
