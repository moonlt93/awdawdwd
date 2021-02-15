package com.radio.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.radio.domain.Criteria;
import com.radio.domain.InquiryVO;
import com.radio.mapper.InquiryMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class InquiryServiceImpl implements InquiryService{
	
	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;
	
	@Override 
	public List<InquiryVO> getList(Criteria cri) {
		List<InquiryVO> list = mapper.getList(cri);
		return list;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}
}
