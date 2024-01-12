package com.hos.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HospitalController {

	private static final Logger logger = LoggerFactory.getLogger(HospitalController.class);

	// 메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET() {
		logger.info("메인 페이지 진입");

	}
	
	// 메인 페이지 - 의료진 정보 페이지 이동
	@RequestMapping(value = "/medicalinfo", method = RequestMethod.GET)
	public void medicalinfoPageGET() {

		logger.info("메인 페이지 - 의료진 정보 페이지 진입");

	}
	
	
	
}
