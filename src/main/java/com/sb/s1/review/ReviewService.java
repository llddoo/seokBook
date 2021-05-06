package com.sb.s1.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.board.BoardDTO;
import com.sb.s1.bookList.BookListDTO;
import com.sb.s1.util.Pager;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	public List<ReviewDTO> getList(Pager pager) throws Exception {
		pager.setCurPage(pager.getCurPage() == 0 ? 1 : pager.getCurPage());
		pager.setCurBlock(pager.getCurBlock() == 0 ? 1 : pager.getCurBlock());
		pager.makecal(reviewDAO.getTotalCount(pager));
		return reviewDAO.getList(pager);
	}
	
	public int setReview(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.setReview(reviewDTO);
	}
	
	public int delReview(ReviewDTO reviewDTO) throws Exception {
		return reviewDAO.delReview(reviewDTO);
	}
	
}
