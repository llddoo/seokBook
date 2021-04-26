package com.sb.s1.mpurchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.branch.BranchPager;

@Service
public class PurchaseService {

	@Autowired
	private PurchaseDAO purchaseDAO;
	
	public int setInsert(PurchaseDTO purchaseDTO) throws Exception {
		
		int result = purchaseDAO.setInsert(purchaseDTO);
		
		return result;
	}
	
	public int setDelete(PurchaseDTO purchaseDTO) throws Exception {
		
		return purchaseDAO.setDelete(purchaseDTO);
	}
	
	public int setUpdate(PurchaseDTO purchaseDTO) throws Exception {
		
		return purchaseDAO.setUpdate(purchaseDTO);
	}
	
	public PurchaseDTO getSelect(PurchaseDTO purchaseDTO) throws Exception {
		
		return purchaseDAO.getSelect(purchaseDTO);
	}
	
	public List<PurchaseDTO> getList(BranchPager branchPager) throws Exception {
		
		branchPager.makeRow();
		
		long totalCount = purchaseDAO.getTotalCount(branchPager);
		branchPager.makeNum(totalCount);
		
		return purchaseDAO.getList(branchPager);
	}
}