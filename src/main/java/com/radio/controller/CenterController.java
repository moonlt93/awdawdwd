package com.radio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.radio.domain.CenterVO;
import com.radio.domain.Criteria;
import com.radio.service.CenterService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/service")
@AllArgsConstructor
@Log4j
public class CenterController {

	@Setter(onMethod_ = @Autowired)
	private CenterService service;
	
	@GetMapping("/register")
	public void registerView(CenterVO vo) {
		log.info("-- register view --"); 
	}
	
	@PostMapping("/register")
	public String register(CenterVO vo, Criteria cri, RedirectAttributes rttr) {
		log.info("-- register controller 실행 --");
		service.register(vo);
		
		rttr.addAttribute(cri.getPageNum());
		rttr.addAttribute(cri.getAmount());
		return "redirect:/service/list";
	}
}
