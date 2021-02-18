package com.radio.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.radio.domain.BoardVO;
import com.radio.domain.Board_Criteria;
import com.radio.domain.Board_PageDTO;
import com.radio.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	 
	//게시물 목록
	@GetMapping("/list")
	public void list( Board_Criteria board_Criteria, Model model) {
		//model.addAttribute('Board_Criteria", board_Criteria);
		//model.addAttronite("cri", board_Criteria);
		
		
		log.info("********list 실행*********");
		
	
		log.info(board_Criteria);
		
		
		log.info(model.asMap());
		
		model.addAttribute("list", service.getList(board_Criteria));
		model.addAttribute("pageInfo", new Board_PageDTO(board_Criteria, service.getTotal(board_Criteria)));
		
		
		
	}
	
	
	//게시물 등록
	@GetMapping("/register")
	public void register(Board_Criteria board_Criteria) {
		
		
		
		log.info("**********register(get) 실행**********");
		log.info(board_Criteria);
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO boardVO, Board_Criteria board_Criteria, RedirectAttributes rttr) {
		log.info("**********register(post) 실행**********");
		
		log.info(boardVO);
		service.register(boardVO);
		
		rttr.addAttribute("pageNum", board_Criteria.getPageNum());
		rttr.addAttribute("amount", board_Criteria.getAmount());
		rttr.addAttribute("type", board_Criteria.getType());
		rttr.addAttribute("keyword", board_Criteria.getKeyword());
		rttr.addAttribute("day", board_Criteria.getDay());
		
		
		
		return "redirect:/board/list";
	}
	
	
	
	
	
	//게시물 읽기 및 수정(get)
	@GetMapping("/read")
	public void read(Long board_bno,Board_Criteria board_Criteria , Model model){
		log.info("********read  실행************");
		
		BoardVO boardVO = service.read(board_bno);
		
		
		model.addAttribute("boardVO", boardVO);
		
		
	}
	
	@GetMapping("/modify")
	public void modify(Long board_bno,Board_Criteria board_Criteria, Model model){
		log.info("********read or modify 실행************");
		
		BoardVO boardVO = service.get(board_bno);
		
		model.addAttribute("boardVO", boardVO);
		
		
		
	}
	
	
	
	//게시물 수정(post)
	@PostMapping("/modify")
	public String modify(BoardVO boardVO,Board_Criteria board_Criteria, RedirectAttributes rttr) {
		log.info("********modify(post) 실행************");
		
		if(service.modify(boardVO)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", board_Criteria.getPageNum());
		rttr.addAttribute("amount", board_Criteria.getAmount());
		rttr.addAttribute("type", board_Criteria.getType());
		rttr.addAttribute("keyword", board_Criteria.getKeyword());
		rttr.addAttribute("day", board_Criteria.getDay());
		

		return "redirect:/board/list";
	}
	
	
	
	
	//게시물 삭제
	@PostMapping("/board/delete")
	public String delete(Long board_bno,Board_Criteria board_Criteria, RedirectAttributes rttr) {
		log.info("************delete 실행*************");
		
		if(service.delete(board_bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", board_Criteria.getPageNum());
		rttr.addAttribute("amount", board_Criteria.getAmount());
		rttr.addAttribute("type", board_Criteria.getType());
		rttr.addAttribute("keyword", board_Criteria.getKeyword());
		rttr.addAttribute("day", board_Criteria.getDay());
		
		
		return "redirect:/board/list";
	}
	
	
	//코너소개
	@GetMapping("/board/dayintro")
	public void dayintro(Board_Criteria cri) {
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
