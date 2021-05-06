package com.sb.s1.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.s1.board.BoardDTO;
import com.sb.s1.util.Pager;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.sb.s1.review.ReviewDAO.";
		
	public List<ReviewDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public long getTotalCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount",pager);
	}
	
	public int setReview(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReview", reviewDTO);
	}
	
	public int delReview(ReviewDTO reviewDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"delreview", reviewDTO);
	}
	
}
