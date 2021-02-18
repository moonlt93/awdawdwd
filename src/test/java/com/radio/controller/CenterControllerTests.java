package com.radio.controller;

import static org.junit.Assert.fail;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class CenterControllerTests {
	
	@Setter(onMethod_=@Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	@Test
	public void test() {
		fail("Not yet implemented");
	}
	
	@Test
	public void registerController() throws Exception{
		mockMvc.perform(MockMvcRequestBuilders.post("/service/register") 
				.param("id", "yura123")
				.param("name", "장유라")
				.param("email", "dbfk931@naver.com")
				.param("type", "로그인/회원")
				.param("title", "안녕하세용가리")
				.param("content", "반갑습니다람쥐"))
				.andReturn().getModelAndView().getViewName();
	}
}
