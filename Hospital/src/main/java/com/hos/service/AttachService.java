package com.hos.service;

import java.util.List;

import com.hos.model.DocImageVO;

public interface AttachService {
	/* 이미지 데이터 반환 */
	public List<DocImageVO> getAttachList(int doctorNum);
}
