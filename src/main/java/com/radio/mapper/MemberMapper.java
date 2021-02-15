package com.radio.mapper;

import com.radio.domain.AuthVO;

import com.radio.domain.MemberVO;

public interface MemberMapper {
	public int register(MemberVO vo);
	
	public String check_id(String id);
	
	public String check_email(String email);
	
	public MemberVO read(String id);
	
	public int registerAuth(AuthVO authVo);
}
