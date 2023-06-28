<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ include file="includes/header.jsp" %>

<style>
	.table-responsive {
		padding: 10px;
	}
</style>


<script>
	$(window).load(function() {
		
	});
	
	// 페이지 시작
	$(document).ready(function() {
		// 예약 등록 이벤트 처리
		$("#reservationBtn").on("click", function(){
			// 예약 확인 이벤트
			var reservationDday = $("#dday").val();
			var reservationDtime = $("#dtime").val();
			var reservationPhone = $("#phone").val();
			console.log(reservationDday);
			console.log(reservationDtime);
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
	});
	
	// 검색
	function fn_search() {
		
	}
	
	/**
	
	// 등록
	function fn_register() {
		const formId = "form";
		const productInfo = {
				id: "1",
				name: $("#product_name").val(),
				count: "3",
				price: "4",
				image: "5",
		};
		
		if(!validation()) {
			return;
		}
		
		setFormData(formId, productInfo);
		
		//$("#"+formId).attr("action", "/getPlaceList.do");
		$("#"+formId).attr("action", "#");
		$("#"+formId).method = "get";
		$("#"+formId).submit();
	}
	
	function validation() {
		if(true) {
			return true;
		} else {
			return false;
		}
	}
	
	function setFormData(formId, data) {
		const form = $("#"+formId);
		
		for(var id in data) {
			$(form).append("<input type='hidden' id='"+id+"' name='"+id+"' value='"+data[id]+"'>");
		}
	}
	**/
</script>

<!-- Main Content -->
<div id="content">
    
    <%@ include file="includes/toolbar.jsp" %>
    
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <!-- <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4">
        	DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the 
            <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.
		</p> -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4" style="width: 55%; float: left;">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">장소 이미지</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <img alt="${place.placeFileName }" src="${contextPath}/thumbnails.do?placeFileName=${place.placeFileName}">
                </div>
            </div>
        </div>
        
        <!-- DataTales Example -->
        <div class="card shadow mb-4" style="width: 35%;">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">장소 예약</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <div class="table-responsive">
                    <form action="insertReservation.do" method="post" id="reservationForm">
                    	<input type="hidden" name="place_code" value="${place.placeCode }">
                		<h6>예약 날짜</h6>
                    	<input id="dday" type="date" name="reservationDday" required="required" class="form-control bg-light border-0 small" aria-label="Search" aria-describedby="basic-addon2">
               		</div>
                	<h6>예약 시간</h6>
                    <select id="dtime" name="reservationDtime"  class="form-control bg-light border-0 small" aria-label="Default select example">
                    	<c:forEach var="start" begin="${place.first_ }" end="${place.last_ }" step="1">
							<option id="${start }:00:00" value="${start }:00:00">${start }:00 (1시간)</option>
						</c:forEach>
					</select>
                </div>
                <div class="table-responsive">
                	<h6>예약자 휴대폰 번호</h6>
                    <input id="phone" type="text" name="reservationPhone" required="required" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" class="form-control bg-light border-0 small" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                	<h6>예약 금액</h6>
                    <input type="text" name="reservationPrice" class="form-control bg-light border-0 small" value="${place.placePrice}" readonly="readonly" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                	<c:if test="${userInfo.userNickName != null }">
                		<a href="#" id="reservationBtn" class="btn btn-primary btn-user btn-block">예약</a>
                	</c:if>
                	<c:if test="${userInfo.userNickName == null }">
						<p>예약을 위해선 로그인이 필요합니다.</p>
					</c:if>
					</form>
                </div>
            </div>
        </div>
        
        <!-- DataTales Example -->
        <div class="card shadow mb-4" style="width: 90%;">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">상세 설명</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    ${place.placeContent}
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
    <form id="form"></form>
</div>
<!-- End of Main Content -->

<%@ include file="includes/footer.jsp" %>