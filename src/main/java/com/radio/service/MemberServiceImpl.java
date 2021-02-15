package com.radio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.radio.domain.AuthVO;
import com.radio.domain.MemberVO;
import com.radio.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	

	@Override
	public String check_email(String email) {
		return mapper.check_email(email);
		
	}
	
	@Override
	public String check_id(String id) {
		return mapper.check_id(id);
		
	}

	@Override
	public int register(MemberVO vo) {
		return mapper.register(vo);
	}

	@Override
	public int registerAuth(AuthVO authVo) {
		return mapper.registerAuth(authVo);
	}


}
