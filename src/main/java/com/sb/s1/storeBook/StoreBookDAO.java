package com.sb.s1.storeBook;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.s1.branch.BranchDTO;

@Repository
public class StoreBookDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.sb.s1.storeBook.StoreBookDAO.";
	
	public int setInsert(StoreBookDTO storeBookDTO) throws Exception {
	
		return sqlSession.insert(NAMESPACE+"setInsert", storeBookDTO);
	}

	public int setDelete(StoreBookDTO storeBookDTO) throws Exception {

		return sqlSession.delete(NAMESPACE+"setDelete", storeBookDTO);
	}

	public int setUpdate(StoreBookDTO storeBookDTO) throws Exception {
	
		return sqlSession.update(NAMESPACE+"setUpdate", storeBookDTO);
	}
	
	public List<StoreBookDTO> getList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
	public StoreBookDTO getSelect(StoreBookDTO storeBookDTO) throws Exception {
	
		storeBookDTO = sqlSession.selectOne(NAMESPACE+"getSelect", storeBookDTO);
		
		return storeBookDTO;
	}
}
