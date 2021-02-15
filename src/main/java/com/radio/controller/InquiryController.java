package com.radio.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.radio.domain.Criteria;
import com.radio.domain.PageDTO;
import com.radio.service.InquiryService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@AllArgsConstructor
@RequestMapping("/service")
@Log4j
public class InquiryController {
	
	private InquiryService service;
	
	// 문의 게시글 목록
	@GetMapping("/inquiry_list")
	public ModelAndView list (@ModelAttribute("cri")Criteria cri, Model model) {
		int total = service.getTotal(cri);
		log.info(cri);
		PageDTO dto = new PageDTO(cri, total);
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("page", dto);
		
		log.info(dto);
		
		return new ModelAndView("service/inquiry_list");
	}
	
	
}
