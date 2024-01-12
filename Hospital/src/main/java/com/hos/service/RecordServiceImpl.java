package com.hos.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hos.mapper.RecordMapper;
import com.hos.model.Criteria;
import com.hos.model.MemberVO;
import com.hos.model.RecordVO;

@Service
public class RecordServiceImpl implements RecordService{
   
   private static final Logger log = LoggerFactory.getLogger(RecordServiceImpl.class);

   @Autowired
   RecordMapper recordmapper;
   
   @Override
   public RecordVO recordGetDetail(int recordNum) throws Exception {
      return recordmapper.recordGetDetail(recordNum);
   }

   @Override
   public ArrayList<RecordVO> memberRecordGet(MemberVO member) throws Exception {
      return (ArrayList<RecordVO>) recordmapper.memberRecordGet(member);
   }

   @Override
   public List<RecordVO> recordDetail(int memberNum) {
      return recordmapper.recordDetail(memberNum);
   }

   @Override
   public List<RecordVO> recordGetList(Criteria cri) throws Exception {
      return recordmapper.recordGetList(cri);
   }

   @Override
   public int recordGetTotal(Criteria cri) throws Exception {
      log.info("(service)recordGetTotal()......." + cri);
        return recordmapper.recordGetTotal(cri);
    }

}