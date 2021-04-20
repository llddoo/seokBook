package com.sb.s1.response;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sb.s1.util.Pager;

@Service
public class ResponseService {

	@Autowired
	private ResponseDAO responseDAO;
	
	public List<ResponseDTO> getList(Pager pager)throws Exception{
		pager.setCurPage(pager.getCurPage() == 0 ? 1 : pager.getCurPage());
		pager.setCurBlock(pager.getCurBlock() == 0 ? 1 : pager.getCurBlock());
		ResponseDTO responseDTO = new ResponseDTO();
		responseDTO.setSubnum(pager.getSubnum());
		pager.makecal(responseDAO.getTotal(responseDTO));
		return responseDAO.getList(pager);
	}
	
	public long delResponse(ResponseDTO responseDTO) throws Exception{
		List<ResponseDTO> list = responseDAO.getListfordelete(responseDTO);
		responseDAO.delResponse(list);
		int listsize = list.size();
		Pager pager = new Pager();
		pager.setCurBlock(listsize);
		pager.setCurPage(list.get(listsize-1).getStep()+1);
		pager.setSubnum((int)list.get(listsize-1).getSubnum());
		return responseDAO.updateAfterDelete(pager);
	}
	
	public long insertResponse(ResponseDTO responseDTO) throws Exception{
		if(responseDTO.getDepth()==0) {
			responseDTO.setStep(responseDAO.getTotal(responseDTO)+1L);
		}else {
			responseDAO.updateForInsert(responseDTO);
		}
		return responseDAO.insertResponse(responseDTO);
	}
	
	public long updateResponse(ResponseDTO responseDTO) throws Exception{
		return responseDAO.updateResponse(responseDTO);
	}
}
