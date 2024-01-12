package com.hos.service;

import com.hos.model.DoctorVO;
import com.hos.model.RecordVO;

public interface AdminService {
	// 상품등록
		public void doctorEnroll(DoctorVO doctor);
		
		/*의사 조회 페이지 */
		public DoctorVO doctorGetDetail(int doctorNum);

		
		/*의사 정보 삭제 */
		public int doctorDelete(int doctorNum);
		
		/*의사 정보 수정*/
		public int doctorModify(DoctorVO vo);
	
	
}
