package com.sb.s1.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressService {

	@Autowired
	private AddressDAO addressDAO;
	
	public AddressDTO getSelect(AddressDTO addressDTO)throws Exception{
		if(addressDTO.getAdrnum()!=0) {
			addressDAO.changeRecent(addressDTO);
			addressDAO.thisisRecent(addressDTO);
		}
		return addressDAO.getSelect(addressDTO);
	}
	
	public List<AddressDTO> getAddressList(AddressDTO addressDTO)throws Exception{
		return addressDAO.getAddressList(addressDTO);
	}
	
	public long addressInsert(AddressDTO addressDTO)throws Exception{
		addressDAO.changeRecent(addressDTO);
		return addressDAO.addressInsert(addressDTO);
	}
	
	public long deleteAddress(AddressDTO addressDTO) throws Exception{
		return addressDAO.deleteAddress(addressDTO);
	}
	
	public long updateForRemove(AddressDTO addressDTO)throws Exception{
		return addressDAO.updateForRemove(addressDTO);
	}
}
