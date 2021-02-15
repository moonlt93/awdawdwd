package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryVO {
	private Long bno;
	private String type;
	private String id;
	private String content;
	private Date regdate;
}
