<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<table>
		<thead>
			<tr>
				<th width="100">예약 장소</th>
				<th width="150">예약 날짜</th>
				<th width="150">예약 시간</th>
				<th width="200">예약 가격</th>
				<th width="200">예약자 </th>
				<th width="250">예약자 휴대폰</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="reservation" items="${reservationList}">
					<input type="hidden" value="${reservation.reservationCode}">
				<tr>
					<td><a href="/getReservationUpdateForm.do?reservationCode=${reservation.reservationCode }">${reservation.placeTitle }</a></td>
					<td>${reservation.reservationDday }</td>
					<td>${reservation.reservationDtime }</td>
					<td>${reservation.reservationPrice }</td>
					<td>${reservation.userNickname }</td>
					<td>${reservation.reservationPhone }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>