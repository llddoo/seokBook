package com.sb.s1.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.branch.BranchPager;

@Service
public class PurchaseService {

	@Autowired
	private PurchaseDAO purchaseDAO;
	
	public List<PurchaseDTO> getSelectList() throws Exception {
		
		return purchaseDAO.getSelectList();
	}
	
	public long setPurchase(List<PurchaseDTO> list) throws Exception{
		return purchaseDAO.setPurchase(list);
	}
}