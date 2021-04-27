package com.sb.s1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressService {

	@Autowired
	private AddressDAO addressDAO;
	
	public AddressDTO getSelect(AddressDTO addressDTO)throws Exception{
		return addressDAO.getSelect(addressDTO);
	}
}
