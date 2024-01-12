package com.hos.mapper;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hos.model.CheckVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CheckMapperTests {

    @Autowired
    private CheckMapper mapper;
    


	/*
	 * @Test public void insertCheckTest() throws Exception {
	 * log.info("Test Start..."); Date date = new Date(); Timestamp timestamp = new
	 * Timestamp(date.getTime()); CheckVO check = new CheckVO();
	 * check.setMemberNum(1); check.setSubject("정형외과"); check.setCheckDate(date);
	 * check.setCheckNum(0); check.setMemberPhone("010-1234-1234");
	 * check.setCheckTime(timestamp);
	 * 
	 * mapper.insertCheck(check);
	 * 
	 * log.info("Test End..."); }
	 */
    
	/*
	 * @Test public void checkGetDetailTest() throws Exception{
	 * 
	 * int memberNum = 2;
	 * 
	 * //log.info("check........" + service.checkGetDetail(memberNum)); }
	 */
    
}