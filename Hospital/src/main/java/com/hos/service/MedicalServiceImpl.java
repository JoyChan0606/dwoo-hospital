package com.hos.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hos.mapper.MedicalMapper;
import com.hos.model.CheckVO;
import com.hos.model.Criteria;
import com.hos.model.DoctorVO;
import com.hos.model.RecordVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MedicalServiceImpl implements MedicalService {
	
	private static final Logger log = LoggerFactory.getLogger(MedicalServiceImpl.class);
	
	@Autowired
	private MedicalMapper medicalmapper;
	
	@Override
	public DoctorVO medicalLogin(DoctorVO doctor) {
		log.info("medicalLogin()......");
		
		return medicalmapper.medicalLogin(doctor);
	}
	
	/* 예약 확인 */
	@Override
	public List<CheckVO> reservCheck(Criteria cri) {
		log.info("reservCheck()......");
		
		return medicalmapper.reservCheck(cri);
	}
	
	/* 예약 총 수 */
	@Override
    public int checkTotal(Criteria cri) throws Exception {
        log.info("checkTotal()......." + cri);
        return medicalmapper.checkTotal(cri);
    }
	
	/* 진료 추가 */
	@Override
	public void recordInsert(RecordVO record) {
		log.info("recordInsert().......");
		
		medicalmapper.recordInsert(record);
		medicalmapper.checkDelete(record);
	}
	
	/* 의사 리스트 */
	@Override
	public List<DoctorVO> DoctorList(Criteria cri)  {
		log.info("goodsGetTotalList()..........");
		return medicalmapper.DoctorList(cri);
	}

	/* 의사 총수 */
	@Override
	public int DoctodTotal(Criteria cri) {
		log.info("goodsGetTotal().........");
		return medicalmapper.DoctodTotal(cri);
	}	
	/* 진료 기록 리스트 */
	@Override
	public List<RecordVO> recordList(int doctorNum) throws Exception{
		log.info("recordList().........");
		return medicalmapper.recordList(doctorNum);
	}
	
	@Override
	public int recordTotal(Criteria cri) throws Exception {
		log.info("recordTotal()......." + cri);
        return medicalmapper.recordTotal(cri);
	}
	
	@Override
	public RecordVO recordDetail(RecordVO record) throws Exception {
		log.info("recordDetail().......");
		return medicalmapper.recordDetail(record);
	}
	
	@Override
	public int recordModify(RecordVO record) throws Exception {
		log.info("recordModify()......");
		
		return medicalmapper.recordModify(record);
	}
	
	@Override
	public int recordDelete(RecordVO record) throws Exception {
		log.info("recordDelete()......");
		
		return medicalmapper.recordDelete(record);
	}
	@Override
	public DoctorVO doctorGetDetail(RecordVO record) throws Exception {
		
		return medicalmapper.doctorGetDetail(record);
		
	}}
