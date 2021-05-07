package com.sb.s1.bookList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.s1.member.membercart.MembercartDTO;
import com.sb.s1.review.ReviewDTO;
import com.sb.s1.util.Pager;

@Repository
public class BookListDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.sb.s1.bookList.BookListDAO.";
	
	public List<BookListDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public BookListDTO getSelect(BookListDTO bookListDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSelect", bookListDTO);
	}	
	
	public long getTotalCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	
	
	public List<BookListDTO> searchBookList(BookListDTO bookListDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchBookList", bookListDTO);
	}
	public List<BookListDTO> getListforpur(List<BookListDTO> bookListDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getListforpur", bookListDTO);
	}
	public long updateScore(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateScore", reviewDTO);
	}
	public long deleteScore(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"deleteScore", reviewDTO);
	}
}
