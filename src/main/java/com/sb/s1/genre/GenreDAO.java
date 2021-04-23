package com.sb.s1.genre;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GenreDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.sb.s1.genre.GenreDAO.";
	
	public List<GenreDTO> getList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
	
	public long getGenrenum(String mainsearch) throws Exception{
		GenreDTO genreDTO = sqlSession.selectOne(NAMESPACE+"getGenrenum", mainsearch);
		return genreDTO==null ? -1 : genreDTO.getGnumber();
	}
}
