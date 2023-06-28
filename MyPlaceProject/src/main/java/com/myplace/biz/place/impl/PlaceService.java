package com.myplace.biz.place.impl;

import java.util.List;

import com.myplace.biz.place.PlaceVO;

public interface PlaceService {
	// ��ǰ ��� ���
	List<PlaceVO> getPlaceList();
	
	// ��ǰ ������ ���
	PlaceVO getPlaceDetail(PlaceVO vo);
	
	// ��ǰ �߰�
	void insertPlace(PlaceVO vo);
	
	// ��ǰ ����
	void updatePlace(PlaceVO vo);
	
	// ��ǰ ����
	void deletePlace(PlaceVO vo);
	
}
