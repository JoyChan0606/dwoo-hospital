package com.hos.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hos.model.DocImageVO;
import com.hos.model.DoctorVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminServiceTests {
	
	@Autowired
	private AdminService service;
	
	
	@Test
	public void DoctorEnrollTests() {
		DoctorVO doc = new DoctorVO();
		
		doc.setDoctorName("조예찬");
		doc.setSubject("정형외과");
		doc.setDoctorContent("장의사");
		
		
		List<DocImageVO> imageList = new ArrayList<DocImageVO>();
		
		DocImageVO image1 = new DocImageVO();
		DocImageVO image2 = new DocImageVO();
		

		image1.setFileName("rkrr 1");
		image1.setUploadPath("kr image 1");
		image1.setUuid("아앙아아아1");
		
	     image2.setFileName("rk");
			image2.setUploadPath("rk");
			image2.setUuid("아앙아아아3");
		
		imageList.add(image1);
		imageList.add(image2);
		
		doc.setImageList(imageList);
		service.doctorEnroll(doc);
		System.out.println("등록된 vo : " + doc);
		
		
	}
	
}
