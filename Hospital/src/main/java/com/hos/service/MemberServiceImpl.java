package com.hos.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hos.mapper.MemberMapper;
import com.hos.model.CheckVO;
import com.hos.model.MemberVO;
import com.hos.model.RecordVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger log = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	MemberMapper membermapper;

	@Override
	public void memberJoin(MemberVO member) throws Exception {

		membermapper.memberJoin(member);

	}
	
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return membermapper.idCheck(memberId);
	}
	
	@Override
	public int idnumCheck(String memberIDNum) throws Exception {
		// TODO Auto-generated method stub
		return membermapper.idnumCheck(memberIDNum);
	}
	
	@Override
	public int phoneCheck(String memberPhone) throws Exception {
		// TODO Auto-generated method stub
		return membermapper.phoneCheck(memberPhone);
	}
	 /* 로그인 */
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        
        return membermapper.memberLogin(member);
    }

	@Override
	public void memberReserve(CheckVO check) throws Exception {
		
		membermapper.memberReserve(check);
		
	}

	@Override
	public MemberVO memberGetDetail(MemberVO member) throws Exception {
		return membermapper.memberGetDetail(member);
	}

	@Override
	public int mypageModify(MemberVO member) throws Exception {
		log.info("(service) memberModify........." + member);
		return membermapper.mypageModify(member);
	}

}