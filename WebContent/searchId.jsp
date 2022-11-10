<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int check = Integer.parseInt(request.getParameter("check"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<title>알림소식목록 | 강원관광 홈페이지 > 관광소식 > 알림소식</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<style>
</style>

<script>
	function main_go() {
		location.href = "login.jsp?check=0";
	}
</script>
</head>
<body>
	<%
	if (check == 1) {
	%>
	<script>
		alert("이름 또는 주민번호를 잘 못 입력하셨거나 회원이 아니십니다.");
	</script>
	<%
	}
	%>
	<!-- navbar -->
	<%@ include file="mypagemainnav6.jspf"%>

	<!-- content -->
	<div class="container">

		<div class="row">

			<!-- 사이드 내비 -->

			<!-- 내용 -->
			<div class="col-10">

				<!-- 페이지 제목 -->
				<div class="row p-3 border-bottom" style="margin-left: 200px">
					<h3 style="margin-left: 290px">아이디 찾기</h3>
				</div>
				

				<!-- 진짜 내용 -->
			<!-- <div class="row py-5 ">

					<div id="contents">

						<div id="bbs">
							<form action="controller?type=findId" method="post">
								<table>
									<caption>아이디 찾기</caption>
									<tbody>
										<tr>
											<th>이름</th>
											<td><input type="text" name="name" title="이름"></td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td><input type="password" name="birth" title="주민등록번호">
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"><input type="submit" value="아이디찾기">
												<input type="reset" value="초기화"> <input
												type="button" value="돌아가기" onclick="main_go()"></td>
										</tr>
									</tfoot>
								</table>
							</form>
						</div>
					</div>
				</div> 
				-->
				
				<div class="row py-5 ">
					<div class="container" style="margin-left: 350px" >
						<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
							<div class="panel panel-success">
								<div class="panel-body">
									<form id="login-form" action="controller?type=findId" method="post">
									<table style="width: 400px;">
									<tbody>
										<tr>
											<th>이름</th>
										</tr>
										<td>
											<input type="text" class="form-control" name="name" title="이름" autofocus>
										</td>
										<tr>
											<th>생년월일</th>
										</tr>
										<td>
											<input type="text" class="form-control" name="birth" title="주민등록번호">
										</td>		
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2" class="text-center p-4"">
												<input type="submit" value="아이디찾기" class="btn btn-primary m-1">
												<input type="reset" value="초기화" class="btn btn-primary m-1"> 
												<input type="button" value="돌아가기" onclick="main_go()" class="btn btn-primary m-1">
											</td>
										</tr>
									</tfoot>
									
									</table>
									</form>
								</div>
							</div>
						</div>
					<br>
					<br>
					</div>
					
					
				</div>
				
				
			</div>
		</div>
	</div>
	<%@ include file="../jspf/footer.jspf"%>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
</body>
</html>