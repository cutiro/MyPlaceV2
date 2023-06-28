package com.myplace.biz.reservation;

public class ReservationUpdateVO {
	private int reservationCode;
	private String reservationDday;
	private String reservationDtime;
	private String reservationPhone;
	private int reservationPrice;
	
	public int getReservationCode() {
		return reservationCode;
	}
	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
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
	public String getReservationPhone() {
		return reservationPhone;
	}
	public void setReservationPhone(String reservationPhone) {
		this.reservationPhone = reservationPhone;
	}
	public int getReservationPrice() {
		return reservationPrice;
	}
	public void setReservationPrice(int reservationPrice) {
		this.reservationPrice = reservationPrice;
	}
	
	
	
}
