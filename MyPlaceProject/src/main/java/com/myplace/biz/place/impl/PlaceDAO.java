package com.myplace.biz.place.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myplace.biz.place.PlaceVO;

@Repository
public class PlaceDAO {
	/* 
	 * insert / update / detail -> return detail page
	 * delete / list -> return list page
	 * */
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPlace(PlaceVO vo) {
		mybatis.insert("PlaceDAO.insertPlace", vo);
	}

	public void updatePlace(PlaceVO vo) {
		mybatis.update("PlaceDAO.updatePlace", vo);
	}

	public void deletePlace(PlaceVO vo) {
		mybatis.delete("PlaceDAO.deletePlace", vo);
	}

	public PlaceVO getPlaceDetail(PlaceVO vo) {
		return (PlaceVO)mybatis.selectOne("PlaceDAO.getPlaceDetail", vo);
	}

	public List<PlaceVO> getPlaceList() {
		return mybatis.selectList("PlaceDAO.getPlaceList");
	}
}
