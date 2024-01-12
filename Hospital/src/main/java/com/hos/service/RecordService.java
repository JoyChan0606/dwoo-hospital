package com.hos.service;

import java.util.ArrayList;
import java.util.List;

import com.hos.model.Criteria;
import com.hos.model.MemberVO;
import com.hos.model.RecordVO;

public interface RecordService {
   public ArrayList<RecordVO> memberRecordGet(MemberVO member) throws Exception;
   
   // 예약 페이지에 멤버 정보 전달
    public RecordVO recordGetDetail(int recordNum) throws Exception;
   
    public List<RecordVO> recordDetail(int memberNum) throws Exception;
    
    // Record 목록
    public List<RecordVO> recordGetList(Criteria cri) throws Exception;
    
    // Record 총 수
    public int recordGetTotal(Criteria cri) throws Exception;
   
}