package com.sb.s1.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	
	@Autowired
	private ServletContext application;
	
	public String upload(MultipartFile multipartFile, String name)throws Exception{
		String path = application.getRealPath("/resources/uploaded/"+name);
		File file = new File(path);
		if(!file.exists()) {
			file.mkdirs();
		}
		String fileName = UUID.randomUUID().toString()+"_"+multipartFile.getOriginalFilename();
		file = new File(file, fileName);
		multipartFile.transferTo(file);
		return fileName;
	}
	
	public boolean delete(String path)throws Exception{
		path = application.getRealPath(path);
		File file = new File(path);
		return file.exists()?file.delete():false;
	}
	
	public boolean move(String origin, String fixloca){
		File dir = new File(application.getRealPath(fixloca));
		File file = new File(application.getRealPath(origin));
		boolean result = true;
		try {
			FileUtils.moveFileToDirectory(file, dir,  true);
		} catch (Exception e) {
			e.printStackTrace();
			result=false;
		}
		return result;
	}
}
