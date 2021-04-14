package com.sb.s1.storeBook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreBookService {

	@Autowired
	private StoreBookDAO storeBookDAO;
	
	public int setInsert(StoreBookDTO storeBookDTO) throws Exception {
		
		return storeBookDAO.setInsert(storeBookDTO);
	}

	public int setDelete(StoreBookDTO storeBookDTO) throws Exception {

		return storeBookDAO.setDelete(storeBookDTO);
	}

	public int setUpdate(StoreBookDTO storeBookDTO) throws Exception {
	
		return storeBookDAO.setUpdate(storeBookDTO);
	}
	
	public List<StoreBookDTO> getList() throws Exception {
		
		return storeBookDAO.getList();
	}
	
	public StoreBookDTO getSelect(StoreBookDTO storeBookDTO) throws Exception {
	
		return storeBookDAO.getSelect(storeBookDTO);
	}
	
}
