package com.hos.mapper;

import com.hos.model.DocImageVO;
import com.hos.model.DoctorVO;
import com.hos.model.RecordVO;

public interface AdminMapper {
	public void doctorEnroll(DoctorVO doctor);
	
	public void imageEnroll(DocImageVO vo);
	
	public int doctorDelete(int doctorNum);
	
	/* 상품 조회 페이지 */
	public DoctorVO doctorGetDetail(int doctorNum);
	
	public int doctorModify(DoctorVO vo);
	
	public void deleteImageAll(int doctorNum);
}
