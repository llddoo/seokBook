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
	
	public GenreDTO getSelect(GenreDTO genreDTO)throws Exception{
		genreDTO = sqlSession.selectOne(NAMESPACE+"getSelect", genreDTO);
		return genreDTO;
	}	

	public List<GenreDTO> getList()throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
}
