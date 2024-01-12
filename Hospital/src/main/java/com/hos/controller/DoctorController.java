package com.hos.controller;


import java.io.File;
import java.io.IOException;
import org.springframework.util.FileCopyUtils;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hos.mapper.AttachMapper;
import com.hos.model.DocImageVO;
import com.hos.service.AdminService;


@Controller
public class DoctorController {
	private static final Logger logger = LoggerFactory.getLogger(DoctorController.class);

	@Autowired
	private AdminService doctors;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayImage(@RequestParam("fileName") String fileName) {
		logger.info("getImaage()....");
		File file = new File("c:\\doctor\\" + fileName);
		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;

	}
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<DocImageVO>> getAttachList(@RequestParam("doctorNum") int doctorNum) {
	    logger.info("getAttachList.........." + doctorNum);
	    return new ResponseEntity<List<DocImageVO>>(attachMapper.getAttachList(doctorNum), HttpStatus.OK);
	}
	

}
