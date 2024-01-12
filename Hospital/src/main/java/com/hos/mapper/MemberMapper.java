package com.hos.mapper;

import com.hos.model.CheckVO;
import com.hos.model.MemberVO;
import com.hos.model.RecordVO;

public interface MemberMapper {
	// 회원가입
	public void memberJoin(MemberVO member);
	
	// 아이디 중복 검사
	public int idCheck(String memberId);

	// 전화번호 중복 검사
	public int phoneCheck(String memberPhone);

	// 주민번호 중복 검사
	public int idnumCheck(String memberIDNum);
	
	// 예약하기
	public void memberReserve(CheckVO check);
	
	// 로그인
    public MemberVO memberLogin(MemberVO member);

	// 예약 페이지에 멤버 값 가져오기
	public MemberVO memberGetDetail(MemberVO member);
	
	// 개인 정보 수정
	public int mypageModify(MemberVO member);
	
	// 예약 정보 가져오기
	public CheckVO checkGetDetail(MemberVO member);
}
