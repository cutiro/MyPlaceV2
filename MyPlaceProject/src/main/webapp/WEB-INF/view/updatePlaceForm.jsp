<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery.timepicker 사용 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
	$(function() {
		$('#timepicker').timepicker({
		    timeFormat: 'H:00',
		    minTime: '${place.placeFirsttime}',
		    maxTime: '${place.placeLasttime}',
		    interval: 60,
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	})
</script>
</head>
<body>
<%@ include file="header.jsp" %>
	<h1>장소 수정</h1>
	<form action="updatePlace.do" method="post" id="myForm">
		<table style="border: 1px solide black">
			<thead>
				<tr>
					<th width="120">
					<th width="250">
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>상품명</td>
					<td><input type="text" name="placeTitle" required="required"value="${place.placeTitle }"></td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td><select name="placeCategory" form="myForm">
							<option value="실내">실내</option>
							<option value="야외">야외</option>
					</select></td>
				</tr>
				<tr>
					<td>상세설명</td>
					<td><textarea name="placeContent" required="required" ">${place.placeContent }</textarea></td>
				</tr>
				<tr>
					<td>대표 전화번호</td>
					<td><input type="text" name="placePhone" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required" value="${place.placePhone }"></td>
				</tr>
				<tr>
					<td>썸네일</td>
					<td><input type="text" name="placeThumbnail" required="required" value="${place.placeThumbnail }"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="number" name="placeZipcode" required="required" value="${place.placeZipcode }"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="placeAddress" required="required" value="${place.placeAddress }"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="placePrice" required="required" value="${place.placePrice }"></td>
				</tr>
				<tr>
					<td colspan="2">예약 가능 시간</td>
				</tr>
				<tr>
					<td>첫 예약 시간</td>
					<td><input id="appt-time" list="times" type="text" name="placeFirsttime" value="${place.placeFirsttime }"></td>
				</tr>
				<tr>
					<td>마지막 예약 시간</td>
					<td><input id="appt-time" list="times" type="text" name="placeLasttime" value="${place.placeLasttime }"></td>
				</tr>
				<datalist id="times">
				    <option value="01:00:00">
				    <option value="02:00:00">
				    <option value="03:00:00">
				    <option value="04:00:00">
				    <option value="05:00:00">
				    <option value="06:00:00">
				    <option value="07:00:00">
				    <option value="08:00:00">
				    <option value="09:00:00">
				    <option value="10:00:00">
				    <option value="11:00:00">
				    <option value="12:00:00">
				    <option value="13:00:00">
				    <option value="14:00:00">
				    <option value="15:00:00">
				    <option value="16:00:00">
				    <option value="17:00:00">
				    <option value="18:00:00">
				    <option value="19:00:00">
				    <option value="20:00:00">
				    <option value="21:00:00">
				    <option value="22:00:00">
				    <option value="23:00:00">
				    <option value="00:00:00">
				</datalist>
				<tr><td><input name="code" type="hidden" value="${place.placeCode }"></td>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="수정 완료">
		<a href="getPlaceList.do">상품 리스트</a>
	</form>

</body>
</html>