package com.radio.service;

import com.radio.model.MemberVO;

public interface MemberService {
	public void insert(MemberVO member);
	
	public String check_email(String email);
	
	public String check_id(String id);
}
