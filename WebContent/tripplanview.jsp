<%@page import="com.mystudy.info.vo.contestVO"%>
<%@page import="com.mystudy.info.dao.planDAO"%>
<%@page import="com.mystudy.info.vo.planVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.info.dao.contestDAO"%>
<%@page import="com.mystudy.info.vo.infoVO"%>
<%@page import="com.mystudy.info.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께보는 여행일정</title>
<link rel="stylesheet" href="css/table.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc9d5f5032edd69ca4ed772c62da10f0"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<%
	//파라미터 값 추출(확인)
	int tripnum = Integer.parseInt(request.getParameter("tripnum"));
	String cPage = request.getParameter("cPage");
	
	//1. 게시글 조회수 1 증가(실습)
	planVO pvo = planDAO.selectOne(tripnum);
	
	//EL, JSTL 사용을 위한 scope 상에 속성 등록처리
	session.setAttribute("pvo", pvo); //게시글 데이터
	session.setAttribute("cPage", cPage);
%>
<script>
function planmodifyform_go() {
	location.href = "controller4?type=planmodifyForm&tripnum=${pvo.tripnum}"; //수정폼 화면
}
function plandelete_go() {
	if (!confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
        alert("목록으로 돌아갑니다.");
        location.href = "controller4?type=planlist";
    } else {
    	location.href = "controller4?type=plandelete&tripnum=${pvo.tripnum}";
    }
}
function planlist_go() {
	location.href = "controller4?type=planlist";
}

</script>
<body>


<!-- navbar -->
<%@ include file="infomainnav.jspf" %>

<!-- 내용 -->
<div id="contest">
	<%-- 게시글 내용 표시 --%>
	<%-- <table style="width: 1200px; margin: 0 auto;">
		<caption style="caption-side: top;">상세보기</caption>
		<tbody>
			<tr>
				<th>글번호</th>
				<td>${pvo.tripnum }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${pvo.triptitle }</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>${pvo.region }</td>
			</tr>
			<tr>
				<th>테마</th>
				<td>${pvo.triptheme }</td>
			</tr>
			<tr>
				<th>목적</th>
				<td>${pvo.purpose }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${pvo.regdate }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정" onclick="planmodifyform_go()">
					<input type="button" value="삭제" onclick="plandelete_go()">
					<input type="button" value="목록보기" onclick="planlist_go()">
				</td>
			</tr>
		</tfoot>
	</table> --%>
	<div style="margin-left: 15%;">
		<img src="imgs/course.jpg" style="float: left; margin-left: 20%; width: 500px;">
		<br>
		<p style="font-weight: bold; font-family: 'Jua', sans-serif;">${pvo.day1 }</p>
		<br>
		<br>
		<br>
		<p style="font-weight: bold; font-family: 'Jua', sans-serif;">${pvo.day2 }</p>
		<br>
		<br>
		<br>
		<p style="font-weight: bold; font-family: 'Jua', sans-serif;">${pvo.day3 }</p>
	</div>
	<div style="margin-top: 100px; margin-left: 50%;"> 
	<c:if test="${not empty ch.id && ch.id == pvo.id || ch.id eq 'admin'}">
		<input type="button" value="수정" onclick="planmodifyform_go()" style="border-radius: 10px; background-color: #d3d3d3;">
		<input type="button" value="삭제" onclick="plandelete_go()" style="border-radius: 10px; background-color: #d3d3d3;">
	</c:if>
		<input type="button" value="목록보기" onclick="planlist_go()" style="border-radius: 10px; background-color: #d3d3d3;">
	</div>
</div>


<!-- 푸터 -->
<%@ include file="footer.jspf" %>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>