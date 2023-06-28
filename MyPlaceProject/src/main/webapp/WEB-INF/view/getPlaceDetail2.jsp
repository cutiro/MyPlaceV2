<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<!-- jquery.datepicker 사용 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jquery.timepicker 사용 -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<!-- jquery.datetimepicker 사용 -->
<link rel="stylesheet" type="text/css" media="screen"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
<script>
      $(function(){
    	//input을 datepicker로 선언
          $("#datepicker").datepicker({
        	// 날짜 표기 형식
        	dateFormat: "yy-mm-dd",
        	changeMonth: true,
        	changeYear: true,
        	minDate: "0",
        	
        	// 달력 언어 설정
        	language: "kr",
        	closeText: "닫기",
            currentText: "오늘",
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            weekHeader: "주",
            yearSuffix: '년',
          });
      });
</script>
<script>
	$(document).ready(function() {
		$('#deleteBtn').click(function() {
			var result = confirm('삭제하시겠어요?');
			if (result) {
				// yes
				$.ajax({
					url : "/deletePlace.do",
					type :"post",
					async:false,
					data : {"placeCode":${place.placeCode}},
					success : function(){
						alert("삭제가 완료되었습니다.");
						location.href="/getPlaceList.do"; // 삭제 완료 후, 상품 목록 리스트 페이지 
					} // ajax 전송 성공 시 종결 태그
				}); // ajax 종결 태그
			}
		}); // 삭제 버튼 이벤트 종결
		
		// 예약 등록 이벤트 처리
		$("#reservationBtn").on("click", function(){
			// 예약 확인 이벤트
			var reservationDday = $(".dday").val();
			var reservationDtime = $(".dtime").val();
			var reservationPhone = $(".phone").val();
			if (reservationDday != '' && reservationDtime != '' && reservationPhone != '' ) {
				$.ajax({
					url : "/checkReservation.do",
					type : "get",
					async : false,
					data : {"reservationDday":reservationDday, "reservationDtime":reservationDtime},
					success : function(result) {
						if (result == 0) {
							alert("예약 가능합니다.");
							$("#reservationForm").submit();
						} else if (result == 1 ) {
							alert("이미 예약이 존재하는 옵션입니다.");
						} else if (result == 3 ) {
							alert("현재 시각보다 늦은 옵션은 예약할 수 없습니다.")
						}
					} // ajax-success 태그
				}); // 예약 확인 ajax 종결
			} else {
				alert("예약을 위해 정보를 입력해주세요!");
			}
		}); // 예약 등록 종결
		
		
	}) // 종결 태그
	

</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<form action="updatePlaceForm.do" method="post">
		<input name="placeCode" type="hidden" value="${place.placeCode }" />
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td><h3>${place.placeTitle }</h3></td>
			</tr>
			<tr>
				<td><p>${place.placeAddress}</p></td>
			</tr>
			<tr>
				<td><h2>${place.placePrice }원/시간당</h2></td>
			</tr>
			<tr>
				<td><p>${place.placePhone }</p></td>
			</tr>
			<hr>
			<hr>
			<tr>
				<td><p class="content">${place.placeContent}</p></td>
			</tr>
			<tr>
				<td><p>${place.placeFirsttime }~</p>
					<p>${place.placeLasttime }</p></td>
			</tr>
		</table>
		<input type="submit" value="수정하기"><br>
	</form>
	<button id="deleteBtn">삭제</button>
	<br>
	<hr>
	<form action="insertReservation.do" method="post" id="reservationForm">
		<input type="hidden" name="place_code" value="${place.placeCode }">
		<table>
			<tr>
				<td><input type="text" id="08:00:00"></td>
			</tr>
			<tr>
				<td>예약 날짜</td>
				<td><input name="reservationDday" type="text" id="datepicker"
					class="dday" required="required"></td>
			</tr>
			<tr>
				<td>예약 시간</td>
				<td><select name="reservationDtime" id="time-select"
					class="dtime">
						<c:forEach var="start" begin="${place.first_ }" end="${place.last_ }" step="1">
							<option id="${start }:00:00" value="${start }:00:00">${start }:00 (1시간)</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>예약자 휴대폰 번호</td>
				<td><input type="text" name="reservationPhone" class="phone" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required"></td>
			</tr>
			<tr>
				<td>예약 금액</td>
				<td><input type="text" name="reservationPrice" value="${place.placePrice}" readonly="readonly"></td>
				<td><p>${userInfo.userNickName }</p>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${userInfo.userNickName != null }">
						<button type="button" id="reservationBtn">예약하기</button>
					</c:if>
					<c:if test="${userInfo.userNickName == null }">
						<p>예약을 위해선 로그인이 필요합니다.</p>
					</c:if>
				</td>
			</tr>
		</table>

	</form>


</body>
</html>