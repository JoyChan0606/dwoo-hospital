package com.hos.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hos.model.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MedicalMapperTests {
	
	@Autowired
	private MedicalMapper medicalmapper;
	
	/* 상품 리스트 & 상품 총 갯수 */
	@Test
	public void goodsGetListTest() {
		
		Criteria cri = new Criteria();
		
		/* 검색조건 */
		cri.setKeyword("가가가가");
		
		/* 검색 리스트 */
		List list = medicalmapper.DoctorList(cri);
		for(int i = 0; i < list.size(); i++) {
			System.out.println("result......." + i + " : " + list.get(i));
		}
		
		/* 상품 총 갯수 */
		int result = medicalmapper.DoctodTotal(cri);
		System.out.println("resutl.........." + result);
		
		
	}
}
