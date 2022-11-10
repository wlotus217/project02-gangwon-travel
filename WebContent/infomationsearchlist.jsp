<%@page import="java.util.List"%>
<%@page import="com.mystudy.info.dao.infoDAO"%>
<%@page import="com.mystudy.info.vo.infoVO"%>
<%@page import="com.mystudy.info.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광안내소</title>
<link rel="stylesheet" href="css/table.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc9d5f5032edd69ca4ed772c62da10f0"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<!-- navbar -->
<%@ include file="infomainnav.jspf" %>


<!-- content -->
<div class="container">

<div class="row">

<!-- 사이드 내비 -->
<%@ include file="infosidenav.jspf" %>


<!-- 내용 -->
<div class="col-10">

	<div class="row p-3 border-bottom">
		<h3>관광안내소</h3>
	</div>
	
	<div class="row p-1 my-3 border">
		<div class="col-4"><p>총게시물 ${pvo.totalRecord }건 페이지 ${pvo.nowPage }/${pvo.totalPage }</p></div>
		<div class="col-8">
			<form action="controller4" method="post" style="float: right;">
					제목 :&nbsp;&nbsp;&nbsp;<input type="text" width="600px" name="info" placeholder="검색어 입력">	
					<input type="submit" name="searchKeyword" value="검색">
					<input type="hidden" name="type" value="infotitlesearch">
			</form>			
		</div>
	</div>
		
	<div class="row border-bottom ">
	</div>	
	<div class="map" id="map" style="width: 900px; height:400px; margin-top: 30px; default;"></div>
	<script src="js/infomap.js"></script>
	<div id="contest">
	<table style="font-family: 'Jua', sans-serif;">
		<caption>관광안내소 목록</caption>
		<thead>
			<tr class="title">
				<th class="infonum">번호</th>
				<th class="info">안내소명</th>
				<th class="city">도시</th>
				<th class="cityphone">안내소 전화번호</th>
				<th class="address">안내소 위치</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="5">
					<h2>현재 등록된 게시글이 없습니다</h2>
				<td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.infonum }</td>
				<td>${vo.info }</td>
				<td>${vo.city }</td>
				<td>${vo.cityphone }</td>
				<td>${vo.address }</td>
			</tr>
			</c:forEach>
		</c:otherwise>
		</c:choose>	
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">
					<ol class="paging" style="margin: auto;">
					<%--[이전으로]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.beginPage == 1 }">
						<li class="disable">이전으로</li>
					</c:if>	
					<c:if test="${pvo.beginPage != 1 }">
						<li>
							<a href="controller4?type=infotitlesearch&cPage=${pvo.beginPage - 1 }">이전으로</a>
						</li>
					</c:if>
					
					<%--블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li class="now">${pageNo }</li>
					</c:if>	
					<c:if test="${pageNo != pvo.nowPage }">
						<li>
							<a href="controller4?type=infotitlesearch&cPage=${pageNo }&info=${info }">${pageNo }</a>
					</li>
					</c:if>	
					</c:forEach>
						
					<%--[다음으로]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<a href="controller4?type=infotitlesearch&cPage=${pvo.endPage + 1 }">다음으로</a>
						</li>
					</c:if>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">다음으로</li>
					</c:if>
						<li>
							<a href="controller4?type=infolist">전체목록보기</a>
						</li>
					</ol>
				</td>
			</tr>
		</tfoot>
	</table>
	</div>
	



</div>
</div>
</div>


<!-- 푸터 -->
<%@ include file="footer.jspf" %>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>