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
		
//		int perPage=10; // 한페이지당 보여줄 글의 갯수
//		int perBlock=5;	// 한 블럭당 보여줄 숫자의 갯수
//		
//		// ---- startRow, lastRow ----
//		long startRow = (pager.getCurPage()-1)*perPage+1;
//		long lastRow = pager.getCurPage()*perPage;
//		
//		pager.setStartRow(startRow);
//		pager.setLastRow(lastRow);
//		// ----------------------------------
//		
//		
//		//---------------------------------------
//		//1. totalCount
//		long totalCount=branchDAO.getTotalCount(pager);
//		
//		//2. totalPage
//		long totalPage = totalCount / perPage;		//11
//		if(totalCount%perPage != 0) {
//			totalPage++;
//		}
//		
//		//3. totalBlock
//		long totalBlock = totalPage / perBlock;
//		if(totalPage%5 != 0) {
//			totalBlock++;
//		}
//		
//		//4. curBlock
//		long curBlock = pager.getCurPage()/perBlock;
//		if(pager.getCurPage()%perBlock != 0) {
//			curBlock++;
//		}
//		
//		//5. startNum, lastNum
//		long startNum = (curBlock-1)*perBlock+1;
//		long lastNum = curBlock*perBlock;
//		
//		
//		//6. curBlock이 마지막 block일때(totalBlock)
//		if(curBlock == totalBlock) {
//			lastNum = totalPage;
//		}
//		
//		//7. 이전, 다음 block 존재 여부
//		//이전
//		if(curBlock != 1) {
//			pager.setPre(true);
//		}
//		
//		//다음
//		if(curBlock != totalBlock) {
//			pager.setNext(true);
//		}
//		
//		pager.setStartNum(startNum);
//		pager.setLastNum(lastNum);
//		
		
		return branchDAO.getList(pager);
	}
	
	
}

