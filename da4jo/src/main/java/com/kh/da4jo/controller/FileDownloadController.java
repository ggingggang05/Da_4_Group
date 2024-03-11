package com.kh.da4jo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.da4jo.dao.ImgDao;
import com.kh.da4jo.dto.ImgDto;

@Controller
@RequestMapping("/download")
public class FileDownloadController
{
	@Autowired
	private ImgDao imgDao;
	
	@RequestMapping
	@ResponseBody
	public ResponseEntity<ByteArrayResource> download(
			@RequestParam int imgNo) throws IOException {
		//imgNo로 imgDto 하나 조회
		ImgDto imgDto = imgDao.selectOne(imgNo);
		
		//imgDto가 없으면(null) 404처리
		if(imgDto == null) {
			return ResponseEntity.notFound().build();
		}
		
		//실제 파일 불러오기
		File dir = new File(System.getProperty("user.home"), "upload");
		File target = new File(dir, String.valueOf(imgDto.getImgNo()));
		
		byte[] data = FileUtils.readFileToByteArray(target);//파일을 읽어라
		ByteArrayResource resource = new ByteArrayResource(data);//포장!
		
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_ENCODING, StandardCharsets.UTF_8.name())
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.contentLength(imgDto.getImgSize())
				.header(HttpHeaders.CONTENT_DISPOSITION, 
					ContentDisposition.attachment()
						.filename(imgDto.getImgName(), StandardCharsets.UTF_8)
						.build().toString()
				)
				.body(resource);
	}
}
