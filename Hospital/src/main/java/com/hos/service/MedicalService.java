package com.hos.service;

import java.util.List;

import com.hos.model.CheckVO;
import com.hos.model.Criteria;
import com.hos.model.DoctorVO;
import com.hos.model.RecordVO;

public interface MedicalService {
	
	/* 의료진 로그인 */
	public DoctorVO medicalLogin(DoctorVO doctor) throws Exception;
	
	/* 예약 확인 */
	public List<CheckVO> reservCheck(Criteria cri) throws Exception;
	
	/* 예약 총 수 */
	public int checkTotal(Criteria cri) throws Exception;
	
	/* 진료 추가 */
	public void recordInsert(RecordVO record) throws Exception;
	
	/* 의사 리스트 */
	public List<DoctorVO> DoctorList(Criteria cri);
	
	/* 의사 총수 */
	public int DoctodTotal(Criteria cri);	
	
	/* 진료 기록 리스트 */
	public List<RecordVO> recordList(int doctorNum) throws Exception;
	
	/* 진료 기록 총 수 */
	public int recordTotal(Criteria cri) throws Exception;
	
	/* 진료 기록 상세 */
	public RecordVO recordDetail(RecordVO record) throws Exception;
	
	/* 진료 기록 수정 */
	public int recordModify(RecordVO record) throws Exception;
	
	/* 진료 기록 삭제 */
	public int recordDelete(RecordVO record) throws Exception;
	// record로 doctor 정보 전달
		public DoctorVO doctorGetDetail(RecordVO record) throws Exception;
}
