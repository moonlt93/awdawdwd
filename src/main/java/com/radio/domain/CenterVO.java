package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CenterVO {
	private Long bno;
	private String id;
	private String name;
	private String email;
	private String type;
	private String title;
	private String content;
	private Date regdate;
}
