package com.sb.s1.bookList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.member.membercart.MembercartDTO;
import com.sb.s1.review.ReviewDTO;
import com.sb.s1.util.Pager;

@Service
public class BookListService {

	@Autowired
	private BookListDAO bookListDAO;
	
	
	public List<BookListDTO> getList(Pager pager)throws Exception{
		pager.setCurPage(pager.getCurPage() == 0 ? 1 : pager.getCurPage());
		pager.setCurBlock(pager.getCurBlock() == 0 ? 1 : pager.getCurBlock());
		pager.makecal(bookListDAO.getTotalCount(pager));
		return bookListDAO.getList(pager);
	}
	
	public BookListDTO getSelect(BookListDTO bookListDTO) throws Exception{
		return bookListDAO.getSelect(bookListDTO);
	}
	public List<BookListDTO> getListforpur(List<BookListDTO> bookListDTO)throws Exception{
		return bookListDAO.getListforpur(bookListDTO);
	}
	
	public long updateScore(ReviewDTO reviewDTO) throws Exception{
		return bookListDAO.updateScore(reviewDTO);
	}
	
	public long deleteScore(ReviewDTO reviewDTO) throws Exception{
		return bookListDAO.deleteScore(reviewDTO);
	}
}
