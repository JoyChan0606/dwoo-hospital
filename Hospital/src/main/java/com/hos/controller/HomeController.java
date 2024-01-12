package com.hos.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/home")
public class HomeController {

   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   // 오시는길 페이지 이동
   @RequestMapping(value = "way", method = RequestMethod.GET)
   public void homeWayGET() throws Exception {
      logger.info("오시는길 페이지 이동......");

   }

   // 오시는길 페이지 이동
   @RequestMapping(value = "info", method = RequestMethod.GET)
   public void homeInfoGET() throws Exception {
      logger.info("병원소개 페이지 이동......");

   }

}