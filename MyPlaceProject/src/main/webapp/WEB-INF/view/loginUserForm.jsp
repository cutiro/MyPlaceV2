<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ include file="includes/header.jsp" %>
<script>
	$(document).ready(function() {
		$('#loginBtn').click(function() {
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
		
		$("#registerBtn").click(function() {
			location.href="/registerUserForm.do";
		})
	});
</script>
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

<div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="userId" aria-describedby="emailHelp"
                                                placeholder="Enter Your Id...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="userPass" placeholder="Password">
                                        </div>
                                        <a id="loginBtn" href="#" class="btn btn-primary btn-user btn-block">
                                            로그인
                                        </a>
                                        <hr>
                                        <a id="registerBtn" href="#"class="btn btn-google btn-user btn-block">
                                         회원가입
                                        </a>
                                    </form>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

<%@ include file="includes/footer.jsp" %>	