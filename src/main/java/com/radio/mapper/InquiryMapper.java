package com.radio.mapper;

import java.util.List;



import com.radio.domain.Criteria;
import com.radio.domain.InquiryVO;

public interface InquiryMapper {

	List<InquiryVO> getList(Criteria cri);

	int getTotal(Criteria cri);

	 

}
