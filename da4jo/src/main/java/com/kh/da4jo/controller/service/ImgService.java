package com.kh.da4jo.controller.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.da4jo.dao.ImgDao;
import com.kh.da4jo.dto.ImgDto;

@Service
public class ImgService
{
	@Autowired
	private ImgDao imgDao;
	
	public int save(MultipartFile img) throws IllegalStateException, IOException {
		int imgNo = imgDao.getSequnce();
		File dir = new File(System.getProperty("user.home"), "upload");
		dir.mkdirs();//폴더가 없다면 생성(있으면 pass)
		File target = new File(dir, String.valueOf(imgNo));
		img.transferTo(target);//실물파일저장	}
		
		ImgDto imgDto = new ImgDto();
		imgDto.setImgNo(imgNo);
		imgDto.setImgName(img.getOriginalFilename());
		imgDto.setImgType(img.getContentType());
		imgDto.setImgSize(img.getSize());
		imgDao.insert(imgDto);
		
		return imgNo;
	}
	
	public void removeFile(int imgNo) {
		File dir = new File(System.getProperty("user.home"), "upload");
		File target = new File(dir, String.valueOf(imgNo));
		target.delete();
		imgDao.delete(imgNo);//파일정보지우고
	}
}
