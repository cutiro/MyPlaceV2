package com.myplace.biz.place;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PlaceVO {
	private int placeCode;
	private String placeTitle;
	private String placeCategory;
	private String placeContent;
	private String placePhone;
	private MultipartFile placeThumbnail;
	private String placeFileName;
	private int placeZipcode;
	private String placeAddress;
	private int placePrice;
	private Date placeUpddate;
	private Date placeRdate;
	private String placeFirsttime; 
	private String placeLasttime;
	private int first_; // 내부에서 ex> 20:00:00 --> 20
	private int last_; // 내부에서 ex> 08:00:00 --> 8
	
	public int getPlaceCode() {
		return placeCode;
	}
	public void setPlaceCode(int placeCode) {
		this.placeCode = placeCode;
	}
	public String getPlaceTitle() {
		return placeTitle;
	}
	public void setPlaceTitle(String placeTitle) {
		this.placeTitle = placeTitle;
	}
	public String getPlaceCategory() {
		return placeCategory;
	}
	public void setPlaceCategory(String placeCategory) {
		this.placeCategory = placeCategory;
	}
	public String getPlaceContent() {
		return placeContent;
	}
	public void setPlaceContent(String placeContent) {
		this.placeContent = placeContent;
	}
	public String getPlacePhone() {
		return placePhone;
	}
	public void setPlacePhone(String placePhone) {
		this.placePhone = placePhone;
	}
	public MultipartFile getPlaceThumbnail() {
		return placeThumbnail;
	}
	public void setPlaceThumbnail(MultipartFile placeThumbnail) {
		this.placeThumbnail = placeThumbnail;
	}
	public int getPlaceZipcode() {
		return placeZipcode;
	}
	public void setPlaceZipcode(int placeZipcode) {
		this.placeZipcode = placeZipcode;
	}
	public String getPlaceAddress() {
		return placeAddress;
	}
	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}
	public int getPlacePrice() {
		return placePrice;
	}
	public void setPlacePrice(int placePrice) {
		this.placePrice = placePrice;
	}
	public Date getPlaceUpddate() {
		return placeUpddate;
	}
	public void setPlaceUpddate(Date placeUpddate) {
		this.placeUpddate = placeUpddate;
	}
	public Date getPlaceRdate() {
		return placeRdate;
	}
	public void setPlaceRdate(Date placeRdate) {
		this.placeRdate = placeRdate;
	}
	public String getPlaceFirsttime() {
		return placeFirsttime;
	}
	public void setPlaceFirsttime(String placeFirsttime) {
		this.placeFirsttime = placeFirsttime;
	}
	public String getPlaceLasttime() {
		return placeLasttime;
	}
	public void setPlaceLasttime(String placeLasttime) {
		this.placeLasttime = placeLasttime;
	}
	public int getFirst_() {
		return first_;
	}
	public void setFirst_(int first_) {
		this.first_ = first_;
	}
	public int getLast_() {
		return last_;
	}
	public void setLast_(int last_) {
		this.last_ = last_;
	}
	public String getPlaceFileName() {
		return placeFileName;
	}
	public void setPlaceFileName(String placeFileName) {
		this.placeFileName = placeFileName;
	}
	

}
