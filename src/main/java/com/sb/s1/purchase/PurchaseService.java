package com.sb.s1.purchase;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.branch.BranchPager;
import com.sb.s1.orderList.OrderListDTO;
import com.sb.s1.util.Pager;

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
	
	public  List<PurchaseDTO> userPurchase(Pager pager)throws Exception{
		
		
		pager.setPerBlock(5);
		pager.setPerPage(5);
		
		if(pager.getCurPage()<1) {
			
			pager.setCurPage(1);
		} 
		if(pager.getCurBlock()<1) {
			pager.setCurBlock(1);
			
		}
		
		pager.makecal(purchaseDAO.getTotalCount2(pager));
		
		
		return purchaseDAO.userPurchase(pager);
	}
	
	
}