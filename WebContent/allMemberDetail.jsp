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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
<script>
	function delete_go() {
		if (confirm("삭제하시겠습니까?")) {
			location.href = "controller?type=masterDeleteMemberList&id=${vo.id }";
		}
	}
</script>
<body>

	<!-- navbar -->
	<%@ include file="mypagemainnav5.jspf"%>

	<!-- content -->
	<div class="container">

		<div class="row">
			<!-- 사이드 내비 -->
			<%@ include file="masterpagesidenav.jspf"%>


			<div class="col-10">
				<!-- 내용 -->
				<div class="row border-bottom">
					<div class="input-form-backgroud row">
						<div class="input-form col-md-12 mx-auto">
							<div id="wrap">
								<div class="mb-3">
									<label for="user_id">아이디</label> <input type="text"
										class="form-control" id="user_id" name="id" value="${vo.id }"
										disabled>
								</div>
								<!-- 이름 -->

								<div class="mb-3">
									<label for="user_name">이름</label> <input type="text"
										class="form-control" id="user_name" name="name"
										value="${vo.name }" disabled>
								</div>
								<!-- 생년월일 -->
								<div class="mb-3">
									<label for="user_birth">생년월일</label> <input type="text"
										class="form-control" id="user_birth" name="birth"
										value="${vo.birth }" disabled>
								</div>
								<!-- 주소 -->
								<div class="mb-3">
									<label for="user_address">주소</label> <input type="text"
										class="form-control" id="user_address" name="address"
										value="${vo.address }" disabled>
								</div>
								<!-- 휴대전화 -->
								<div class="mb-3">
									<label for="user_phone">전화번호</label> <input type="text"
										class="form-control" id="user_phone" name="phone"
										value="${vo.phone }" disabled>
								</div>
								<!-- 이메일 -->
								<div class="mb-3">
									<label for="user_email">전화번호</label> <input type="text"
										class="form-control" id="user_email" name="email"
										value="${vo.email }" disabled>
								</div>
								<div class="mb-3">
									<input type="button" value="회원삭제" onclick="delete_go()">
								</div>
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