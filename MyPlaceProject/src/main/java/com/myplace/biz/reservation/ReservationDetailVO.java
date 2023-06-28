package com.myplace.biz.reservation;

public class ReservationDetailVO {
	private int reservationCode; // 예약 코드
	private int placeTitle; // 예약 장소 이름
	private String userNickname; // 예약자 사이트 닉네임
	private String reservationDday; // 예약 날짜
	private String reservationDtime; // 예약 시간
	private int reservationPrice; // 예약 가격
	private String reservationPhone; // 예약자 전화번호
	
	private String orderBy; // 출력 기준 ( all, ongoing, complete, cancel )
	
	public int getReservationCode() {
		return reservationCode;
	}
	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}
	public int getPlaceTitle() {
		return placeTitle;
	}
	public void setPlaceTitle(int placeTitle) {
		this.placeTitle = placeTitle;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
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
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	

}
