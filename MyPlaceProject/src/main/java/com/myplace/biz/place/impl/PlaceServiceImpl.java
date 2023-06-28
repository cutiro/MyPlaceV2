package com.myplace.biz.place.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myplace.biz.place.PlaceVO;

@Service("placeService")
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	PlaceDAO placeDAO;
	
	@Override
	public List<PlaceVO> getPlaceList() {
		return placeDAO.getPlaceList();
	}

	@Override
	public PlaceVO getPlaceDetail(PlaceVO vo) {
		// TODO Auto-generated method stub
		return placeDAO.getPlaceDetail(vo);
	}

	@Override
	public void insertPlace(PlaceVO vo) {
		placeDAO.insertPlace(vo);
	}

	@Override
	public void updatePlace(PlaceVO vo) {
		placeDAO.updatePlace(vo);
	}

	@Override
	public void deletePlace(PlaceVO vo) {
		placeDAO.deletePlace(vo);
		
	}

}
