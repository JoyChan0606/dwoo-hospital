package com.hos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import com.hos.mapper.AttachMapper;
import com.hos.model.DocImageVO;


@Service
@Log4j
public class AttachServiceImpl implements AttachService{
	
	@Autowired
	private AttachMapper attachMapper;

	@Override
	public List<DocImageVO> getAttachList(int doctorNum) {
		
		log.info("getAttachList.........");
		
		return (List<DocImageVO>) attachMapper.getAttachList(doctorNum);
	}

}
