<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="/resources/jqGrid-4.7.1/css/ui.jqgrid.css" /> -->

<!-- <script src="/resources/js/jquery.timepicker.min.js" type="text/javascript"></script>
<script src="/resources/jqGrid-4.7.1/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
<script src="/resources/jqGrid-4.7.1/js/minified/jquery.jqGrid.min.js" type="text/javascript"></script> -->
</head>
<body>
<a href="/getPlaceList.do">MyPlace</a>

<c:if test="${userInfo.userNickName != null }">
	<a href="/logoutUser.do">로그아웃</a>
	<a href="/userHome.do?userId=${userInfo.userId }"><p>'${userInfo.userNickName}' 님</p></a>
</c:if>
<c:if test="${userInfo.userNickName == null }">
	<a href="/registerUserForm.do">회원가입</a>
	<a href="/loginUserForm.do">로그인</a>
</c:if>
<hr>
</body>
</html>