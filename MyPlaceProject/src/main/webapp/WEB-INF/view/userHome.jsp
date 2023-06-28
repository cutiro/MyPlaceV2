<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ include file="includes/header.jsp" %>

<script>
	$(window).load(function() {
		
	});
	
	// 페이지 시작
	$(document).ready(function() {
		
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
                <h6 class="m-0 font-weight-bold text-primary">Place List</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                	<div class="my-2"></div>
                	<a href="getOngoingList.do?userId=${userInfo.userId }&orderBy=ongoing" class="btn btn-primary btn-icon-split">
                                        <span class="text">진행중</span>
                                    </a>
                	<a href="getOngoingList.do?userId=${userInfo.userId }&orderBy=complete" class="btn btn-primary btn-icon-split">
                                        <span class="text">완료 된</span>
                                    </a>
                    <div class="my-2"></div>
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Position</th>
                                <th>Title</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="place" items="${placeList }">
								<tr>
									<td>${place.placeCode}</td>
									<td><img alt="${place.placeFileName }" src="${contextPath}/thumbnails.do?placeFileName=${place.placeFileName}"></td>
									<td align="left"><a href="getPlaceDetail.do?placeCode=${place.placeCode}">${place.placeTitle}</a></td>
									<td>${place.placeCategory}</td>
									<td>${place.placePrice}/1h</td>
									<td>${place.placeAddress}</td>
								</tr>
							</c:forEach>
                        </tbody>
                    </table>
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