<%@page import="java.util.List"%>
<%@page import="com.mystudy.info.dao.infoDAO"%>
<%@page import="com.mystudy.info.vo.infoVO"%>
<%@page import="com.mystudy.info.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.input-form {
	width: 800px;
	margin-top: 3px;
	margin-left: 30px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
</style>
</head>

<body>

	<!-- navbar -->
	<c:if test="${ch.id eq 'admin'}">
		<%@ include file="mypagemainnav5.jspf"%>
	</c:if>
	<c:if test="${ch.id ne 'admin'}">
		<%@ include file="mypagemainnav.jspf"%>
	</c:if>
	<!-- content -->
	<div class="container">
	
		<div class="row">
			<!-- 사이드 내비 -->
			<c:if test="${ch.id eq 'admin'}">
				<%@ include file="masterpagesidenav.jspf"%>
			</c:if>
			<c:if test="${ch.id ne 'admin'}">
				<%@ include file="mypagesidenav.jspf"%>
			</c:if>

			<!-- 내용 -->
			<div class="">
				<div class="container">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<div id="wrap">
								<hr>
								<div id="header">
									<span class="title">내 정보</span>
								</div>
								<hr>
								<!-- 아이디 -->
								<div class="mb-3">
									<label for="user_id">아이디</label> <input type="text"
										class="form-control" id="user_id" name="id" value="${ch.id }"
										disabled>
								</div>
								<!-- 이름 -->
								<c:if test="${ch.id ne 'admin'}">
									<div class="mb-3">
										<label for="user_name">이름</label> <input type="text"
											class="form-control" id="user_name" name="name"
											value="${ch.name }" disabled>
									</div>
									<!-- 생년월일 -->
									<div class="mb-3">
										<label for="user_birth">생년월일</label> <input type="text"
											class="form-control" id="user_birth" name="birth"
											value="${ch.birth }" disabled>
									</div>
									<!-- 주소 -->
									<div class="mb-3">
										<label for="user_address">주소</label> <input type="text"
											class="form-control" id="user_address" name="address"
											value="${ch.address }" disabled>
									</div>
									<!-- 휴대전화 -->
									<div class="mb-3">
										<label for="user_phone">전화번호</label> <input type="text"
											class="form-control" id="user_phone" name="phone"
											value="${ch.phone }" disabled>
									</div>
									<!-- 이메일 -->
									<div class="mb-3">
										<label for="user_email">전화번호</label> <input type="text"
											class="form-control" id="user_email" name="email"
											value="${ch.email }" disabled>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>





			</div>
		</div>
	</div>


	<!-- 푸터 -->
	<%@ include file="jspf/footer.jspf"%>

</body>
</html>