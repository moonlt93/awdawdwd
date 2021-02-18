package com.radio.mapper;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.radio.domain.CenterVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		{"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class CenterMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CenterMapper mapper;
	
	@Test
	public void testInsert() {
		CenterVO vo = new CenterVO();
		vo.setId("yura123");
		vo.setName("장유라"); 
		vo.setEmail("dbfk931@naver.com");
		vo.setType("로그인/회원");
		vo.setTitle("----로그인-----");
		vo.setContent("---- 잘되용-----");
		
		assertEquals(1, mapper.register(vo));
	}

}
