<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<!-- jquery.datepicker 사용 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
	<%@ include file="header.jsp" %>
	<div style="margin: auto;">
		<table>
			<thead>
				<tr>
					<th width="100">
					<th width="200">
					<th width="150">
					<th width="150">
					<th width="200">
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
	<hr>
	<div>
		
	</div>
	<hr>
	<div>
		<form id="form" method="post" action="getPlaceList.do">
			<input id="searchVal" class="searchVal" name="searchVal" value="">
			<button>검색</button>
		</form>
	</div>
	<hr>
	<a href="insertPlaceForm.do">상품 등록</a>
	<script>
		$("button").click(function() {
			var val = $("#searchVal").val();
			
			
		});
	</script>
</body>
</html>