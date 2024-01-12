package com.hos.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hos.model.DocImageVO;
import com.hos.model.DoctorVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTest {
	@Autowired
	private AdminMapper mapper;
	
	/* 이미지 등록 */
	@Test
	public void imageEnrollTest() {

		
	}
	
}
