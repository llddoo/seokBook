package com.sb.s1.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/address/**")
public class AddressController {

	@Autowired
	private AddressService addressService;
	
	@PostMapping("addressSelect")
	public void addressSelect(AddressDTO addressDTO, Model model)throws Exception{
		model.addAttribute("address", addressService.getSelect(addressDTO));
	}
	
	@PostMapping("addressInsert")
	public void addressInsert(AddressDTO addressDTO, Model model)throws Exception{
		model.addAttribute("result", addressService.addressInsert(addressDTO));
	}
	
	@PostMapping("addressList")
	public void addressList(AddressDTO addressDTO, Model model)throws Exception{
		model.addAttribute("user", addressDTO);
		List<AddressDTO> list = addressService.getAddressList(addressDTO);
		model.addAttribute("addressList", list);
		model.addAttribute("listsize", list.size());
	}
	
	
	@PostMapping("addressDelete")
	public void addressDelete(AddressDTO addressDTO, Model model)throws Exception{
		AddressDTO temp = addressService.getSelect(addressDTO);
		if(temp.getAdrnum()==addressDTO.getAdrnum()) {
			addressService.updateForRemove(addressDTO);
		}
		model.addAttribute("result", addressService.deleteAddress(addressDTO));
	}
}
