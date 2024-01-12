package com.hos.mapper;

import java.util.List;

import com.hos.model.CheckVO;
import com.hos.model.MemberVO;

public interface CheckMapper {


	// 예약 버튼 기능
	public int insertCheck(CheckVO check);
	
	// 예약 정보 전달
	public CheckVO checkGetDetail(MemberVO member);

	// 예약 정보 수정
	public int modifyCheck(Object object);

	// 예약 정보 삭제
	public int deleteCheck(CheckVO check);
	
}