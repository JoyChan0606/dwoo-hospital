package com.hos.mapper;

import java.util.List;

import com.hos.model.DocImageVO;

public interface AttachMapper {
	public List<DocImageVO> getAttachList(int doctorNum);
}
