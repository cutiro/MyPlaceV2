package com.myplace.view.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myplace.biz.place.PlaceVO;
import com.myplace.biz.place.impl.PlaceService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class PlaceController {
	private static String CURR_IMAGE_REPO_PATH = "C:\\\\Users\\\\SCTHRD\\\\git\\\\MyPlaceV2\\\\MyPlaceProject\\\\src\\\\main\\\\webapp\\\\resources\\\\images";
	
	@Autowired
	PlaceService placeService;

	// 장소 상품 목록
	@RequestMapping(value="/getPlaceList.do")
	public String getPlaceList(Model model, PlaceVO vo) {
		model.addAttribute("placeList",placeService.getPlaceList());
		String filename = "C:\\Temp\\car1.gif";
		model.addAttribute("placeImage",filename);
		return "getPlaceList";
	}

	// 장소 상품 등록 페이지 출력
	@RequestMapping("/insertPlaceForm.do")
	public String insertPlaceForm() {
		return "insertPlaceForm";
	}

	// 장소 상품 등록
	@RequestMapping("/insertPlace.do")
	public String insertPlace(PlaceVO vo) throws IllegalStateException, IOException {
		// 파일 업로드 처리
		MultipartFile uploadFile = vo.getPlaceThumbnail();
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setPlaceFileName(fileName);
			uploadFile.transferTo(new File("C:\\Users\\SCTHRD\\git\\MyPlaceV2\\MyPlaceProject\\src\\main\\webapp\\resources\\images\\"+fileName));
		}
		placeService.insertPlace(vo);
		return "redirect:/getPlaceList.do";
	}
	
	// 썸네일 생성기 - img.src 에서 매핑됨
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("placeFileName") String placeFileName,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath= CURR_IMAGE_REPO_PATH+"\\"+placeFileName; // 절대경로 설정
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}

	// 장소 상품 상세 보기
	@RequestMapping("/getPlaceDetail.do")
	public String getPlaceDeatail(PlaceVO vo, Model model) {
		System.out.println("/getPlaceDetail.do 호출");
		PlaceVO innerVO = placeService.getPlaceDetail(vo);
		innerVO.setFirst_(convertType(innerVO.getPlaceFirsttime()));
		innerVO.setLast_(convertType(innerVO.getPlaceLasttime()));
		model.addAttribute("place", innerVO);
		model.addAttribute("path","C:\\Temp\\");
		return "getPlaceDetail";
	}

	// 문자열 형태의 날짜를 Int형으로 반환
	public int convertType(String string) {
		String[] temp = string.split(":");
		String temp_ = "";
		for (String str : temp) {
			temp_ += str;
		}
		return (Integer.parseInt(temp_)) / 10000;
	}

	// 장소 상품 수정 페이지 출력
	@RequestMapping("/updatePlaceForm.do")
	public String updatePlaceForm(PlaceVO vo, Model model) {
		System.out.println("/updatePlaceForm.do 호출");
		model.addAttribute("place", placeService.getPlaceDetail(vo));
		return "updatePlaceForm";
	}

	// 장소 상품 수정 처리
	@RequestMapping("/updatePlace.do")
	public String updatePlace(PlaceVO vo, Model model) {
		System.out.println("/updatePlace.do 호출");
		placeService.updatePlace(vo); // 상품 update
		model.addAttribute("place", placeService.getPlaceDetail(vo)); // 수정된 상품 상세 페이지 이동
		return "redirect:/getPlaceDetail.do";
	}

	// 장소 상품 삭제
	@ResponseBody
	@RequestMapping("/deletePlace.do")
	public void deletePlace(@RequestParam("code") int code, PlaceVO vo) {
		System.out.println("/deletePlace.do 호출");
		placeService.deletePlace(vo);
	}
}
