package com.sb.s1.branch;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.s1.util.Pager;

@Repository
public class BranchDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.sb.s1.branch.BranchDAO.";
	
	public int setInsert(BranchDTO branchDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setInsert", branchDTO);
	}	
	
	public int setDelete(BranchDTO branchDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"setDelete", branchDTO);
	}	
	
	public int setUpdate(BranchDTO branchDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setUpdate", branchDTO);
	}
	
	public BranchDTO getSelect(BranchDTO branchDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getSelect", branchDTO);
	}
	
	public List<BranchDTO> getList(Pager pager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}
	
	public long getTotalCount(Pager pager) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	public long getNum()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
}
