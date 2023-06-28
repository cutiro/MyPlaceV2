<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		$('#submit').click(function() {
			$.ajax({
				url : "/loginUser.do",
				type :"post",
				async:false,
				data : {"userId":$("#userId").val(),"userPass":$("#userPass").val()},
				success : function(loginResult){
					if (loginResult == 0) {
						location.href = "getPlaceList.do";
					} else if (loginResult == 1) {
						alert("로그인 실패!");
					}
				}
			})
		})
	});
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<form action="loginUser.do" id="loginForm" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" id="userId" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPass" id="userPass" required="required"></td>
			</tr>
			<tr>
				<td><input type="button" id="submit" value="로그인"></td>
			</tr>
		</table>
	</form>

</body>
</html>