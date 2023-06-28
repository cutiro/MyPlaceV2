package com.myplace.biz.reservation;

import java.util.Date;

public class ReservationVO {
	private int reservationCode;
	private int place_code;
	private Date reservationRdate;
	private String reservationDday;
	private String reservationDtime;
	private int reservationPrice;
	private String reservationPhone;
	private String reservationUserInfo;
	
	public int getReservationCode() {
		return reservationCode;
	}
	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}
	public int getPlace_code() {
		return place_code;
	}
	public void setPlace_code(int place_code) {
		this.place_code = place_code;
	}
	public Date getReservationRdate() {
		return reservationRdate;
	}
	public void setReservationRdate(Date reservationRdate) {
		this.reservationRdate = reservationRdate;
	}
	public String getReservationDday() {
		return reservationDday;
	}
	public void setReservationDday(String reservationDday) {
		this.reservationDday = reservationDday;
	}
	public String getReservationDtime() {
		return reservationDtime;
	}
	public void setReservationDtime(String reservationDtime) {
		this.reservationDtime = reservationDtime;
	}
	public int getReservationPrice() {
		return reservationPrice;
	}
	public void setReservationPrice(int reservationPrice) {
		this.reservationPrice = reservationPrice;
	}
	public String getReservationPhone() {
		return reservationPhone;
	}
	public void setReservationPhone(String reservationPhone) {
		this.reservationPhone = reservationPhone;
	}
	public String getReservationUserInfo() {
		return reservationUserInfo;
	}
	public void setReservationUserInfo(String reservationUserInfo) {
		this.reservationUserInfo = reservationUserInfo;
	}


}
