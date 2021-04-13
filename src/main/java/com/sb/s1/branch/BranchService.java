package com.sb.s1.branch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public List<BranchDTO> getList() throws Exception {
		
		return branchDAO.getList();
	}
	
	
}

