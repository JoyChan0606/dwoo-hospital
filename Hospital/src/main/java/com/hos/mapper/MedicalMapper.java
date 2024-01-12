package com.hos.mapper;

import java.util.List;

import com.hos.model.CheckVO;
import com.hos.model.Criteria;
import com.hos.model.DoctorVO;
import com.hos.model.RecordVO;

public interface MedicalMapper {
	
	/* 의료진 로그인 */
	public DoctorVO medicalLogin(DoctorVO doctor);
	
	/* 예약 확인 */
	public List<CheckVO> reservCheck(Criteria cri);
	
	/* 예약 총 수 */
	public int checkTotal(Criteria cri);
	
	/* 진료기록 추가 */
	public int recordInsert(RecordVO record);
	
	/* 진료 기록 후 예약 삭제 */
	public void checkDelete(RecordVO record);
	
	/* 의사 리스트 */
	public List<DoctorVO> DoctorList(Criteria cri);
	
	/* 의사 수 */
	public int DoctodTotal(Criteria cri);
	
	/* 진료 기록 리스트 */
	public List<RecordVO> recordList(int doctorNum);

	/* 진료 기록 총 수 */
	public int recordTotal(Criteria cri);
	
	/* 진료 기록 상세 */
	public RecordVO recordDetail(RecordVO record);
	
	/* 진료 기록 수정 */
	public int recordModify(RecordVO record);
	
	/* 진료 기록 삭제 */
	public int recordDelete(RecordVO record);
	
	//의사 상세정보
	public DoctorVO doctorGetDetail(RecordVO doctor);
}

