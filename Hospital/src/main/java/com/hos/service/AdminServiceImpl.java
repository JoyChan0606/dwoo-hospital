package com.hos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hos.mapper.AdminMapper;
import com.hos.model.DoctorVO;
import com.hos.model.RecordVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminmapper;

	@Transactional
	@Override
	public void doctorEnroll(DoctorVO doctor) {
		log.info("의료진 등록 진행중........");
		log.info(doctor);
		adminmapper.doctorEnroll(doctor);
		if(doctor.getImageList() == null || doctor.getImageList().size() <= 0) {
			return;
		}

		doctor.getImageList().forEach(attach -> {
			log.info(doctor.getDoctorNum());

			attach.setDoctorNum(doctor.getDoctorNum()-1);
			log.info(attach);
			adminmapper.imageEnroll(attach);

		});
	}

	/* 상품 조회 페이지 */
	@Override
	public DoctorVO doctorGetDetail(int doctorNum) {
		
		log.info("(service)bookGetDetail......." + doctorNum);
		
		return adminmapper.doctorGetDetail(doctorNum);
	}	

	/* 상품 정보 삭제 */
	@Override
	public int doctorDelete(int doctorNum) {

		log.info("DoctorDelete..........");
		
		return adminmapper.doctorDelete(doctorNum);
	}	
	
	/* 상품 정보 수정 */
	@Transactional
	@Override
	public int doctorModify(DoctorVO vo) {
		
		int result = adminmapper.doctorModify(vo);
		
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			
			adminmapper.deleteImageAll(vo.getDoctorNum());
			
			vo.getImageList().forEach(attach -> {
				
				attach.setDoctorNum(vo.getDoctorNum());
				adminmapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;
		
	}

	

}
