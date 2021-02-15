package com.radio.service;

import java.util.List;
import com.radio.domain.Criteria;
import com.radio.domain.InquiryVO;

public interface InquiryService {
	
	public List<InquiryVO> getList(Criteria cri);

	public int getTotal(Criteria cri);
}
