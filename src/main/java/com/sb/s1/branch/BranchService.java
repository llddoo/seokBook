package com.sb.s1.branch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BranchService {

	@Autowired
	private BranchDAO branchDAO;
	
	
}
