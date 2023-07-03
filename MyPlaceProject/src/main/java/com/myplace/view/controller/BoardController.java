package com.myplace.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.myplace.biz.board.BoardVO;
import com.myplace.biz.board.impl.BoardService;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	
	// 게시글 리스트 출력
	// String condition = request.getParameter("searchCondition"); << @RequestParam
	@RequestMapping(value="/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		model.addAttribute("boardList",boardService.getBoardList(vo)); // session에서 하던 객체 전달을 Model로 ---> 모델화
		return "getBoardList";
	}
	
	// 게시글 등록
	@RequestMapping(value="/insertBoard.do")
	public String insertBoard(BoardVO vo) throws IllegalStateException, IOException {
		boardService.insertBoard(vo);
		return "redirect:/getBoardList.do";
		
	}
	
	// 게시글 상세 보기
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		model.addAttribute("board",boardService.getBoard(vo)); // Spring의 저장소 'Session'으로 생각하면 된다.
		return "getBoard";
	}
	
	// 글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo, ModelAndView mav) {
		System.out.println("게시글 수정");
		// 1. 검색할 게시글 번호 추출
		System.out.println("번호 : " + vo.getSeq());
		System.out.println("제목 : " + vo.getTitle());
		System.out.println("작성자 : " + vo.getWriter());
		System.out.println("내용 : " + vo.getContent());
		System.out.println("등록일 : " + vo.getRegDate());
		System.out.println("조회수 : " + vo.getCnt());
		boardService.updateBoard(vo);
		
		return "redirect:/getBoardList.do";
	}
	
	// 글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, ModelAndView mav) {
		System.out.println("게시글 삭제");
		
		boardService.deleteBoard(vo);
		
		// 3. 응답 화면 구성
		return "getBoardList.do";
	}
}
