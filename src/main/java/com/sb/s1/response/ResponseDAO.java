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
	
	public List<ResponseDTO> getListfordelete(ResponseDTO responseDTO){
		return sqlSession.selectList(NAMESPACE+"getListfordelete", responseDTO);
	}
	
	public long getTotal(ResponseDTO responseDTO)throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotal", responseDTO);
	}
	
	public long delResponse(List<ResponseDTO> list) throws Exception{
		return sqlSession.delete(NAMESPACE+"delResponse", list);
	}
	
	public long insertResponse(ResponseDTO responseDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"insertResponse", responseDTO);
	}
	
	public long updateResponse(ResponseDTO responseDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateResponse", responseDTO);
	}
	
	public long updateForInsert(ResponseDTO responseDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateForInsert", responseDTO);
	}
	
	public long updateAfterDelete(Pager pager) throws Exception{
		return sqlSession.update(NAMESPACE+"updateAfterDelete", pager);
	}
}
