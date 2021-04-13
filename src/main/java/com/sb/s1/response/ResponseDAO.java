package com.sb.s1.response;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.s1.util.Pager;


@Repository
public class ResponseDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.sb.s1.response.ResponseDAO.";
	
	public List<ResponseDTO> getList(Pager pager) {
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	public int delResponse(ResponseDTO responseDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"delResponse", responseDTO);
	}
	
	public int insertResponse(ResponseDTO responseDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insertResponse", responseDTO);
	}
	
	public int updateResponse(ResponseDTO responseDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateResponse", responseDTO);
	}
}
