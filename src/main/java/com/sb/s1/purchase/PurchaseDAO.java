package com.sb.s1.purchase;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sb.s1.branch.BranchPager;

@Repository
public class PurchaseDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.sb.s1.purchase.PurchaseDAO.";
	
	
	public List<PurchaseDTO> getSelectList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getSelectList");
	}

	public int setInsert(PurchaseDTO purchaseDTO) throws Exception {

		return sqlSession.insert(NAMESPACE+"setInsert", purchaseDTO);
	}
	public int setDelete(PurchaseDTO purchaseDTO) throws Exception {

		return sqlSession.delete(NAMESPACE+"setDelete", purchaseDTO);
	}

	public int setUpdate(PurchaseDTO purchaseDTO) throws Exception {

		return sqlSession.update(NAMESPACE+"setUpdate", purchaseDTO);
	}

	public PurchaseDTO getSelect(PurchaseDTO purchaseDTO) throws Exception {

		return sqlSession.selectOne(NAMESPACE+"getSelect", purchaseDTO);
	}

	public List<PurchaseDTO> getList(BranchPager branchPager) throws Exception {

		return sqlSession.selectList(NAMESPACE+"getList", branchPager);
	}

	public long getTotalCount(BranchPager branchPager) throws Exception {

		return sqlSession.selectOne(NAMESPACE+"getTotalCount", branchPager);
	}

	public long getNum()throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	public long setPurchase(List<PurchaseDTO> list)throws Exception{
		return sqlSession.insert(NAMESPACE+"setPurchase", list);
	}
}
