<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<ul>
    <li>예약 관리
        <ul>
            <a href="getOngoingList.do?userId=${userInfo.userId }&orderBy=ongoing" class="btn btn-primary btn-user btn-block">진행 중</a>
            <a href="getOngoingList.do?userId=${userInfo.userId }&orderBy=complete" class="btn btn-primary btn-user btn-block">완료 된</a>
        </ul>
    </li>
    <li>개인정보
    	<ul>
    		<li>개인정보 수정</li>
   		</ul>
    </li>
    <li>활동
        <ul>
            <li>후기관리</li>
        </ul>
    </li>
</ul>

</body>
</html>