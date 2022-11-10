<%@page import="com.mystudy.trip.vo.CultureVO"%>
<%@page import="com.mystudy.trip.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숨은명소 상세보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style>
	#list {
		float: right;
		position: relative;
		bottom: 10px;
	}
</style>
<script>
function deleteData() {
	if (confirm("삭제하시겠습니까?")) {
	location.href = "hiddenDelete.jsp";
	}
}
</script>
</head>
<body>
<!-- navbar -->
	<%@ include file="../jspf/tripNav.jspf"%>

	<!-- content -->
	<div class="container">

		<div class="row">

			<!-- 사이드 내비 -->
			<%@ include file="../jspf/tripSidenav.jspf"%>

<div class="col-10">
	
	<div class="row p-3 border-bottom">
		<h3>${vo.title }</h3>
	</div>
	
	<c:if test="${ch.id eq vo.id }">
	<div class="row border-bottom ">
		<form class="form-inline">
			<input class="btn btn-secondary" type="button" value="수 정" onclick="javascript:location.href='controller2?type=hiddenUpdate&boardNum=${vo.boardNum }'" style="margin-right: 2px;">
		</form>		
		<form class="form-inline">
			<input class="btn btn-secondary" type="button" value="삭 제" onclick="deleteData()">
		</form>		
	</div>
	</c:if>
	
	<div class="container">
	<!-- 알림소식 -->
		<div class="row p-3 border-bottom">
			<div><h5>게시글번호 : ${vo.boardNum }&nbsp;&nbsp;&nbsp;&nbsp;</h5></div>
			<div><h5>작성자 : ${vo.id }&nbsp;&nbsp;&nbsp;&nbsp;</h5></div>
			<div><h5>등록일 : ${vo.writeDate }&nbsp;&nbsp;&nbsp;&nbsp;</h5></div>
			<div><h5>조회수 : ${vo.hit }</h5></div>
		</div>
	</div>
	
	<div style="<c:if test='${vo.fileName == null }'>visibility:hidden;</c:if>">
		<img alt="사진" src="images/hidden/${vo.fileName }" width="920">
	</div>
	<br>
	
	<div class="row">
	<div>
		<h3><span>상세내용</span></h3>
		<div style="width:100%; word-break:break-all;word-wrap:break-word;">${vo.contain }</div>
	</div>
	</div>
	
	<div id="list">
		<input class="btn btn-secondary" type="button" value="목록보기" onclick="javascript:location.href='controller2?type=hiddenList'">
	</div>
	
	
</div>
</div>
</div>

	
<%@ include file="../jspf/footer.jspf"%>
</body>
</html>