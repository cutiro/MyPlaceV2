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
		init();
		
		$("#register").click(function() {
			fn_register();
		});
	});
	
	// 초기화
	function init() {
		
	}
	
	// 검색
	function fn_search() {
		
	}
	
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
</script>

<!-- Main Content -->
<div id="content">
    
    <%@ include file="includes/toolbar.jsp" %>
    
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4" style="width: 90%;">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">장소 등록</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="상품명" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="카테고리" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="상세설명" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="대표 전화번호" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="우편번호" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="주소" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="가격" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="첫 예약 시간" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="마지막 예약 시간" aria-label="Search" aria-describedby="basic-addon2">
                </div>
                <div class="table-responsive">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="썸네일" aria-label="Search" aria-describedby="basic-addon2">
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
    <form id="form"></form>
</div>
<!-- End of Main Content -->

<%@ include file="includes/footer.jsp" %>