<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<!-- jquery.datepicker 사용 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>회원가입</title>
</head>
<script>
	$(document).ready(function() {
		// 취소
		$("#cancle").on("click", function() {
			location.href = "/getPlaceList.do";
		})

		// 최종 회원가입 , + 아이디 및 닉네임 중복 확인 확인 여부
		$("#submit").on("click", function() {
			var checkId_ = $("#checkId").val();
			var checkNick_ = $("#checkNickName").val();
			if (checkId_ == "N" ) {
				// 아이디 중복 확인이 안됐을 경우
				alert(" 아이디 중복 확인 부탁드립니다.");
			} else if (checkNick_ == "N") {
				// 닉네임 중복 확인이 안됐을 경우
				alert(" 닉네임 중복 확인 부탁드립니다.");
			} else if (checkId_ == "Y" & checkNick_ == "Y") {
				$("#regForm").submit();
			};
		});
	})

	// 아이디 중복 체크
	function fn_checkId() {
		var userId_ = $("#userId").val();
		var idPattern = /^[a-z0-9]{6,12}$/;
        if (!idPattern.test(userId_)){
        	console.log(userId_)
        	alert('아이디는 6~12자의 영문 소문자, 숫자만 사용 가능합니다.')
            $('#userId').focus()
            return false
        } else if (idPattern.test(userId_)){
        	// 올바른 아이디 입력이 이루어진 경우
        	console.log(userId_)
        	$.ajax({
    			url : "/checkId.do", 
    			type : "post",
    			data : {
    				"userId" : $("#userId").val()
    			},
    			success : function(data) { 
    				// 정상적으로 응답 받았을 경우 파라미터는 응답 바디
    				if (data == 1) {
    					alert("중복된 아이디입니다.");
    				} else if (data == 0) {
    					$("#checkId").attr("value", "Y");
    					$("#userId").attr("readonly", "readonly");
    					alert("사용가능한 아이디입니다.");
    				}
    			}
    		})
        }
		
	}
	
	// 닉네임 중복체크
	function fn_checkNickName() {
		var userNickName_ = $("#userNickName").val();
		var nicknamePattern = /^[가-힣a-z0-9]{1,7}$/;
        if (!nicknamePattern.test(userNickName_)){
        	console.log(userNickName_)
        	alert('닉네임은 1~7자의 한글, 영문 소문자, 숫자만 사용 가능합니다.')
            $('#userNickName').focus()
            return false
        } else {
        	// 올바른 닉네임 입력이 이루어진 경우
        	console.log(userNickName_)
        	$.ajax({
    			url : "/checkNickname.do",
    			type : "post",
    			data : {
    				"userNickName" : $("#userNickName").val()
    			},
    			success : function(data) {
    				if (data == 1) {
    					alert("중복된 닉네임입니다.");
    				} else if (data == 0) {
    					$("#checkNickName").attr("value", "Y");
    					$("#userNickName").attr("readonly", "readonly");
    					alert("사용가능한 닉네임입니다.");
    				}
    			}
    		})
        }
		
	}
</script>

<script>
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});
	
	$(function() {
	  $("#datepicker").datepicker({ dateFormat: "yy-mm-dd" });
	});    
</script>
<body>
		<form action="registerUser.do" method="post" id="regForm">
			<table>
				<tr>
					<td><p>아이디</p></td>
					<td><input type="text" id="userId" name="userId" required="required"/>
					<button type="button" id="checkId" onclick="fn_checkId();" value="N">중복 확인</button></td>
				</tr>
				<tr>
					<td><p>비밀번호</p></td>
					<td><input type="password" id="userPass" name="userPass" required="required"/></td>
				</tr>
				<tr>
					<td><p>이름</p></td>
					<td><input type="text" name="userName" required="required"/></td>
				</tr>
				<tr>
					<td><p>닉네임</p></td>
					<td><input type="text" name="userNickName" id="userNickName" required="required"/>
					<button type="button" id="checkNickName" onclick="fn_checkNickName();" value="N">중복 확인</button></td>
				</tr>
				<tr>
					<td><p>생년월일</p></td>
					<td><input type="text" name="userBirth" id="datepicker" required="required"/></td>
				</tr>
				<tr>
					<td><p>휴대폰 번호</p></td>
					<td><input type="text" name="userPhone" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required="required"/></td>
				</tr>
				<tr>
					<td><p>성별</p></td>
					<td> 
						<input type='radio' name='userGender' id="male" value='male' checked="checked"/><label for="male">남성</label>
						<input type='radio' name='userGender' id="female" value='female' /><label for="female">여성</label> 
					</td>
				</tr>
			</table>
		</form>
		<div>
			<button type="button" id="submit">회원가입</button>
			<button type="button" id="cancle">취소</button>
		</div>

</body>

</html>