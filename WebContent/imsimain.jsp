<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업선택</title>
<title>알림소식목록 | 강원관광 홈페이지 > 관광소식 > 알림소식</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

</head>
<body>
	<h1>관광소식</h1>
	<form action="controller?type=newsList" method="get">
		<select name="main" onchange="location.href=this.value">
			<option value="controller?type=newsList" title="새창열림">관광소식</option>

			<option value="controller?type=newsList" title="새창열림">알림소식</option>

			<option value="controller?type=declareList" title="새창열림">관광불편신고</option>

			<option value="controller?type=proList" title="새창열림">홍보물신청2</option>
			<option value="controller?type=ebookList" title="새창열림">언택트관광
				e-book</option>

		</select>
	</form>
	<hr>
	<hr>
	<br>
	<div>
		<a href="login.jsp?check=0">로그인 </a>
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