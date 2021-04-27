package com.sb.s1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/address/**")
public class AddressController {

	@Autowired
	private AddressService addressService;
	
	public void addressSelect(AddressDTO addressDTO, Model model)throws Exception{
		addressDTO = addressService.getSelect(addressDTO);
		if(addressDTO==null) {
			model.addAttribute("address", "null");
		}else {
			model.addAttribute("address", addressDTO);
		}
	}
}
