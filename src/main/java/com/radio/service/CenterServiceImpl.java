package com.radio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.radio.domain.CenterVO;
import com.radio.mapper.CenterMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class CenterServiceImpl implements CenterService{
	
	@Setter(onMethod_ = @Autowired)
	private CenterMapper mapper;
	
	@Override
	public int register(CenterVO vo) {
		return mapper.register(vo);
	}
}
