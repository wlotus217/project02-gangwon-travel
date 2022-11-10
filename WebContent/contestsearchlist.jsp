<%@page import="java.util.List"%>
<%@page import="com.mystudy.info.dao.contestDAO"%>
<%@page import="com.mystudy.info.vo.contestVO"%>
<%@page import="com.mystudy.info.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진공모전</title>
<link rel="stylesheet" href="css/table.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="preconnect" href="css/tripfont.css">
</head>

<body>


<!-- navbar -->
<%@ include file = "infomainnav.jspf" %>



<!-- content -->
<div class="container">

<div class="row">

<!-- 사이드 내비 -->
<%@ include file = "infosidenav.jspf" %>

<!-- 내용 -->
<div class="col-10">

	<div class="row p-3 border-bottom">
		<h3>사진공모전 목록</h3>
	</div>
	
	<div class="row p-1 my-3 border">
		<div class="col-4"><p>총게시물 ${pvo.totalRecord }건 페이지 ${pvo.nowPage }/${pvo.totalPage }</p></div>
		<div class="col-8">
			<form action="controller4" method="post" style="float: right;">
					제목 :&nbsp;&nbsp;&nbsp;<input type="text" width="600px" name="contesttitle" placeholder="검색어 입력">	
					<input type="submit" name="searchKeyword" value="검색">
					<input type="hidden" name="type" value="contestlistsearch">
			</form>			
		</div>
	</div>
		
	<c:if test="${ch.id eq 'admin'}">
		<div class="row border-bottom ">
			<form class="form-inline" action="controller4?type=contestinsertform" method="post" style="margin-bottom: 20px;">
				<input class="btn btn-secondary" type="submit" value="새글 등록" >
			</form>		
		</div>	
	</c:if>
	<div id="contest">
		<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="3">
					<h2>현재 등록된 게시글이 없습니다</h2>
				<td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="vo" items="${list }">
			<div style="flex-wrap: wrap; margin: 20px 20px 20px 0px; display: inline-block; border: 1px solid black;">
					<img src="imgs/${vo.picName }" style="width: 400px; height: 350px;"><br>
					<a href="contestview.jsp?picNum=${vo.picNum }&cPage=${pvo.nowPage}" style=" color: black; margin-left: 10px;">${vo.picTitle }</a>
			</div>
			</c:forEach>
		</c:otherwise>
		
		</c:choose>	
	</div>
	<div>
				<ol class="paging" style="margin-left: 235px;">
				<%--[이전으로]에 대한 사용여부 처리 --%>
				<c:if test="${pvo.beginPage == 1 }">
					<li class="disable">이전으로</li>
				</c:if>	
				<c:if test="${pvo.beginPage != 1 }">
					<li>
						<a href="controller4?type=contestlistsearch&cPage=${pvo.beginPage - 1 }">이전으로</a>
					</li>
				</c:if>
				
				<%--블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
				<c:if test="${pageNo == pvo.nowPage }">
					<li class="now">${pageNo }</li>
				</c:if>	
				<c:if test="${pageNo != pvo.nowPage }">
					<li><a href="controller4?type=contestlistsearch&cPage=${pageNo }&contesttitle=${contesttitle }">${pageNo }</a></li>
				</c:if>	
				</c:forEach>
					
				<%--[다음으로]에 대한 사용여부 처리 --%>
				<c:if test="${pvo.endPage < pvo.totalPage }">
					<li>
						<a href="controller4?type=contestlistsearch&cPage=${pvo.endPage + 1 }">다음으로</a>
					</li>
				</c:if>
				<c:if test="${pvo.endPage >= pvo.totalPage }">
					<li class="disable">다음으로</li>
				</c:if>
					<li>
						<a href="controller4?type=contestlist">전체목록보기</a>
					</li>
				</ol>
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