<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ include file="includes/header.jsp" %>

<script>
	$(window).load(function() {
		
	});
	
	// 페이지 시작
	$(document).ready(function() {
		// 등록 취소 버튼 누름
		$("#cancelBtn").on("click",function(){
			location.href="/getPlaceList.do"
		})
	});
	
	// 초기화
	function init() {
		fn_search();
	}
	
	// 검색
	function fn_search() {
		
	}
	
	function fn_register() {
		
	}
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
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">장소 등록</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                <form action="insertPlace.do" method="post" id="myForm" enctype="multipart/form-data">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>항목</th>
                                <th>내용</th>
                            </tr>
                        </thead>
                        <tbody>
							<tr>
								<td>상품명</td>
								<td><input type="text" name="placeTitle" required="required"></td>
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
								<td><textarea  name="placeContent" required="required" placeholder="상품에 대한 상세 설명이 필요합니다."></textarea></td>
							</tr>
							<tr>
								<td>대표 전화번호</td>
								<td><input  type="text" name="placePhone" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required"></td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input type="number" name="placeZipcode" required="required"></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="placeAddress" required="required"></td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="number" name="placePrice" required="required"></td>
							</tr>
							<tr>
								<td colspan="2">예약 가능 시간</td>
							</tr>
							<tr>
								<td>첫 예약 시간</td>
								<td><input id="appt-time" list="times" type="text" name="placeFirsttime" value="00:00"></td>
							</tr>
							<tr>
								<td>마지막 예약 시간</td>
								<td><input id="appt-time" list="times" type="text" name="placeLasttime" value="00:00"></td>
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
							<tr>
								<td>썸네일</td>
								<td align="left"><input type="file" name="placeThumbnail"></td>
							</tr>
						</tbody>
					</table>
					<div class="table-responsive">
                		<input type="submit" id="registerBtn" class="btn btn-primary mb-3" value="등록 완료">
                		<button type="button" id="cancelBtn" class="btn btn-primary mb-3">등록 취소</button>
               		</div>
               		</form>
                </div>
            </div>
        </div>
        <c:set var="user_type" value="user"></c:set>
        
        <c:if test="${user_type == 'admin'}">
        	<button>등록</button>
        </c:if>
        <c:if test="${user_type == 'user'}">
        	
        </c:if>
    </div>
    <!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<%@ include file="includes/footer.jsp" %>