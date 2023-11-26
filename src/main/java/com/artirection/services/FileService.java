package com.artirection.services;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artirection.dao.FileDAO;

@Service
public class FileService {
	@Autowired
	private FileDAO fdao;
	
	public void deleteServerFile(String sys_name) throws Exception{
		String realPath = "C:/uploads";
		File uploadPath = new File(realPath);
		Path path = Paths.get(uploadPath + "/" + sys_name);
		Files.deleteIfExists(path);
	}
}
