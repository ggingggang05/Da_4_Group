package com.kh.da4jo.RestController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.da4jo.service.ImgService;

@CrossOrigin
@RestController
@RequestMapping("/rest/board_attach")
public class BoardImgRestController {

	@Autowired
	private ImgService imgService;

	// 업로드 매핑
	// - 사용자가 summernote를 이용해서 드래그 또는 선택한 이미지들을 업로드
	// - 업로드가 완료되면 summernote가 이미지를 표시할 수 있도록 이미지 번호를 반환
	@PostMapping("/upload")
	public List<Integer> upload(@RequestParam List<MultipartFile> attachList)
			throws IllegalStateException, IOException {
		// 올린 내용이 없으면 중지
		if (attachList.isEmpty())
			return null;

		List<Integer> numbers = new ArrayList<>();
		for (MultipartFile attach : attachList) {
			int attachNo = imgService.save(attach);
			numbers.add(attachNo);
		}
		return numbers;
	}
}
