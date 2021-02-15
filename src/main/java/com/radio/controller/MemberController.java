package com.radio.controller;

import org.springframework.http.HttpStatus;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.radio.domain.AuthVO;
import com.radio.domain.MemberVO;
import com.radio.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MemberController {
	
	private MemberService service;
	
	// 회원가입 화면
	@GetMapping("/register")
	public ModelAndView insert(MemberVO member) {
		System.out.println("회원가입 화면");
		return new ModelAndView("member/register");
	}
	
	// 회원가입 submit
	@PostMapping("/register")
	public ResponseEntity<MemberVO> insert(MemberVO vo, AuthVO authVo, RedirectAttributes rttr) {
		 
		// log에 member데이터가 잘 찍히는지 확인
		log.info("member:" + vo);
		
		service.register(vo);
		service.registerAuth(authVo);
		// grade MemberVO에 잘 담겨있는지 확인
		log.info("grade:" + vo.getGrade());
		System.out.println(vo.getGrade());
		
		return new ResponseEntity<MemberVO>(vo, HttpStatus.OK);		
	}
	
	// 아이디 중복 검사(AJAX)
	@GetMapping("/check_id")
	public String check_id(@RequestParam("id") String id) {
		
		String idCheckCount = service.check_id(id);
	
		log.info(idCheckCount);
		
		return idCheckCount;
		
	}
	
	// 이메일 중복 검사(AJAX)
	@GetMapping("/check_email")
	public String check_email(@RequestParam("email") String email) {
		String emailCheckCount = service.check_email(email);
		
		log.info(emailCheckCount);
		
		return emailCheckCount;
	}

	
}
