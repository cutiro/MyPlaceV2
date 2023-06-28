<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../header.jsp"%>
<form action="updateReservation.do" method="post" id="reservationForm">
		<table>
			<tr>
				<td colspan="2"><h2>예약 날짜 수정은 취소 후 예약해 주세요.</h2></td>
				<td><input type="hidden" name="reservationCode" value="${reservationCode }"></td>
			</tr>
			<tr>
				<td>예약 날짜</td>
				<td>${reservation.reservationDday }</td>
			</tr>
			<tr>
				<td>예약 시간</td>
				<td>${reservation.reservationDtime }</td>
			</tr>
			<tr>
				<td>예약 금액</td>
				<td>${reservation.reservationPrice }</td>
			</tr>
			<tr>
				<td>예약자 휴대폰 번호</td>
				<td><input type="text" name="reservationPhone" value="${reservation.reservationPhone }" required="required"></td>
			</tr>
		</table>
		<input type="submit" value="수정 완료">

	</form>
</body>
</html>