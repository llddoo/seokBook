package com.sb.s1.storeBook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/storeBook/**")
public class StoreBookController {

		@Autowired
		private StoreBookService storeBookService;
		
		
}
