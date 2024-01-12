package com.hos.mapper;

import java.util.List;

import com.hos.model.Criteria;
import com.hos.model.MemberVO;
import com.hos.model.RecordVO;

public interface RecordMapper {
   
   public RecordVO recordGetDetail(int recordNum);
   
   public List<RecordVO> memberRecordGet(MemberVO member);
   
   // Record 상세
   public List<RecordVO> recordDetail(int memberNum);
   
   public List<RecordVO> recordGetList(Criteria cri);
   
   public int recordGetTotal(Criteria cri);
   
}