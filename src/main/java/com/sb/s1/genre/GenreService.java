package com.sb.s1.genre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GenreService {

	@Autowired
	private GenreDAO genreDAO;
	
	public List<GenreDTO> getList()throws Exception{
		return genreDAO.getList();
	}
 	
	
	
}
