package com.sb.s1.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.s1.util.Pager;


@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.sb.s1.board.BoardDAO.";
	
	public List<BoardDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public BoardDTO getSelect(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", boardDTO);
	}
	
	public long getTotalcount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalcount", pager);
	}
	
	public int setBoard(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setBoard", boardDTO);
	}
	
	public int delBoard(BoardDTO boardDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"delBoard", boardDTO);
	}
	
	public int updateBoard(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"updateBoard", boardDTO);
	}
	
	public int setHit(BoardDTO boardDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setHit", boardDTO);
	}
	
	public List<BoardDTO> searchEventList(BoardDTO boardDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchEventList", boardDTO);
	}
	
	public List<BoardDTO> searchOldbooksaleList(BoardDTO boardDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchOldbooksaleList", boardDTO);
	}
	public List<BoardDTO> searchNoticeList(BoardDTO boardDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"searchNoticeList", boardDTO);
	}
}
