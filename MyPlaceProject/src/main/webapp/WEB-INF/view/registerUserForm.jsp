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
	
	// 페이지 시작
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
				alert("버튼 클릭됨");
				$("#regForm").submit();
			};
		});
	});
	
	
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
            
            <form action="registerUser.do" method="post" id="regForm">
            <div  class="card-body">
            	<div style="width:40%">
	                <div class="table-responsive" style="float: left; width: 65%">
	                	<h5>&nbsp;&nbsp;아이디</h5>
	                    <input type="text" id="userId" name="userId" class="form-control bg-light border-0 small" placeholder="아이디" aria-label="Search" aria-describedby="basic-addon2">
	                </div>
	                <div style="float: right; margin-top: 5%">
	                	<button type="button" id="checkId" onclick="fn_checkId();" class="btn btn-primary" value="N">아이디 중복 확인</button>
	                </div>
	                <div class="table-responsive">
	                	<h5>&nbsp;&nbsp;비밀번호</h5>
	                    <input type="password"  id="userPass"  name="userPass" class="form-control bg-light border-0 small" placeholder="비밀번호" aria-label="Search" aria-describedby="basic-addon2">
	                </div>
	                <div class="table-responsive">
	                	<h5>&nbsp;&nbsp;이름</h5>
	                    <input type="text" name="userName" class="form-control bg-light border-0 small" placeholder="이름" aria-label="Search" aria-describedby="basic-addon2">
	                </div>
	                <div class="table-responsive" style="float: left; width: 65%">
	                	<h5>&nbsp;&nbsp;닉네임</h5>
	                    <input type="text" name="userNickName" id="userNickName" class="form-control bg-light border-0 small" placeholder="닉네임" aria-label="Search" aria-describedby="basic-addon2">
	                </div>
	                <div style="float: right; margin-top: 5%">
	                	<button type="button" id="checkNickName" onclick="fn_checkNickName();" class="btn btn-primary" value="N">닉네임 중복 확인</button>
	                </div>
	                <div class="table-responsive">
	                	<h5>&nbsp;&nbsp;생년월일</h5>
	                    <input type="date" name="userBirth" class="form-control bg-light border-0 small" placeholder="생년월일" aria-label="Search" aria-describedby="basic-addon2">
	                </div>
	                <div class="table-responsive">
	                	<h5>&nbsp;&nbsp;휴대폰 번호</h5>
	                    <input type="text" name="userPhone" class="form-control bg-light border-0 small" placeholder="010-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" aria-label="Search" aria-describedby="basic-addon2">
	                </div>
	                <div class="table-responsive">
	                	<h5>&nbsp;&nbsp;성별</h5>
	                    <div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="userGender" id="inlineRadio1" value="male">
							  <label class="form-check-label" for="inlineRadio1">남성</label>
						</div>
						<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="userGender" id="inlineRadio2" value="femaile">
							  <label class="form-check-label" for="inlineRadio2">여성</label>
						</div> 
	                </div>
                </div>
                <div>
                	<button type="button" id="submit" class="btn btn-primary" >회원가입</button>
                	<button type="button" id="cancle" class="btn btn-primary" >취소</button>
                </div>
            </div> <!-- card-body -->
            </form>
            
        </div>
    </div>
    <!-- /.container-fluid -->
    <form id="form"></form>
</div>
<!-- End of Main Content -->

<%@ include file="includes/footer.jsp" %>