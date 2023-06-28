package com.myplace.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myplace.biz.member.impl.UserService;
import com.myplace.biz.place.PlaceVO;
import com.myplace.biz.place.impl.PlaceService;

@Controller
@RequestMapping(value="/admin")
public class AdminHomeController {
	
	final String defaultPage = "/admin";
	@Autowired
	UserService userService;
	
	@Autowired
	PlaceService placeService;
	
	@RequestMapping(value="/index.do")
	public String getAdminIndex(Model model, PlaceVO vo) {
		model.addAttribute("placeList",placeService.getPlaceList());
		String filename = "C:\\Temp\\car1.gif";
		System.out.println("파일네임 " + vo.getPlaceFileName());
		model.addAttribute("placeImage",filename);
		return defaultPage + "/index";
	}
}
