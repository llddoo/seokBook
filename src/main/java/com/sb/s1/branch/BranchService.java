package com.sb.s1.branch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.util.Pager;

@Service
public class BranchService {

	@Autowired
	private BranchDAO branchDAO;
	
	public int setInsert(BranchDTO branchDTO) throws Exception {
		
		int result = branchDAO.setInsert(branchDTO);
		
		return result;
	}

	public int setDelete(BranchDTO branchDTO) throws Exception {
		
		return branchDAO.setDelete(branchDTO);
	}

	public int setUpdate(BranchDTO branchDTO) throws Exception {
		
		return branchDAO.setUpdate(branchDTO);
	}

	public BranchDTO getSelect(BranchDTO branchDTO) throws Exception {
		
		return branchDAO.getSelect(branchDTO);
	}
	
	public List<BranchDTO> getList(Pager pager) throws Exception {
		
		long totalCount=branchDAO.getTotalCount(pager);
		pager.makecal(totalCount);
		
//		long startRow = (pager.getCurPage()-1)*perPage+1;
//		long endRow = pager.getCurPage()*perPage;
//		
//		pager.setStartRow(startRow);
//		pager.setEndRow(endRow);
//		
//	
//		
//		
//		
//		
//		long totalPage = totalCount / perPage;		//11
//		if(totalCount%perPage != 0) {
//			totalPage++;
//		}
//		
//		
//		long totalBlock = totalPage / perBlock;
//		if(totalPage%5 != 0) {
//			totalBlock++;
//		}
//		
//		
//		long curBlock = pager.getCurPage()/perBlock;
//		if(pager.getCurPage()%perBlock != 0) {
//			curBlock++;
//		}
//		
//		
//		long startBlock = (curBlock-1)*perBlock+1;
//		long endBlock = curBlock*perBlock;
//		
//		
//		
//		if(curBlock == totalBlock) {
//			endBlock = totalPage;
//		}
//		
//		
//		if(curBlock != 1) {
//			pager.setPre(true);
//		}
//		
//		
//		if(curBlock != totalBlock) {
//			pager.setNext(true);
//		}
//		
//		pager.setStartBlock(startBlock);
//		pager.setEndBlock(endBlock);
		
		
		return branchDAO.getList(pager);
	}
	
	
}

