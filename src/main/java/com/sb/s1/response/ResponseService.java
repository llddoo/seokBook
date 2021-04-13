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
		return responseDAO.getList(pager);
	}
	
	public int delResponse(ResponseDTO responseDTO) throws Exception{
		return responseDAO.delResponse(responseDTO);
	}
	
	public int insertResponse(ResponseDTO responseDTO) throws Exception{
		return responseDAO.insertResponse(responseDTO);
	}
	
	public int updateResponse(ResponseDTO responseDTO) throws Exception{
		return responseDAO.updateResponse(responseDTO);
	}
}
