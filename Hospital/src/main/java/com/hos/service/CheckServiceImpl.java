package com.hos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hos.mapper.CheckMapper;
import com.hos.model.CheckVO;
import com.hos.model.MemberVO;

@Service
public class CheckServiceImpl implements CheckService {
	@Autowired
	CheckMapper checkmapper;

	@Override
	public void insertCheck(CheckVO check) throws Exception {
		checkmapper.insertCheck(check);
	}

	@Override
	public CheckVO checkGetDetail(MemberVO member) throws Exception {
		return checkmapper.checkGetDetail(member);
	}

	@Override
	public int modifyCheck(CheckVO check) throws Exception {
		return checkmapper.modifyCheck(check);
	}

	@Override
	public int deleteCheck(CheckVO check) throws Exception {
		return checkmapper.deleteCheck(check);
	}


}
