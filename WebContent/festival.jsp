<%@page import="com.mystudy.trip.vo.FestivalVO"%>
<%@page import="com.mystudy.trip.vo.CultureVO"%>
<%@page import="com.mystudy.trip.vo.NatureVO"%>
<%@page import="com.mystudy.trip.dao.DAO"%>
<%@page import="com.mystudy.trip.common.Paging"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
		<h3>축제/행사</h3>
	</div>
	
	<c:if test="${ch.id eq 'admin' }">
	<div class="row">
		<form class="form-inline" action="festivalUpload.jsp">
			<input class="btn btn-secondary" type="submit" value="새글 등록" >
		</form>		
	</div>
	<br>
	</c:if>
	
	<div class="row border-bottom">
		<img alt="배너사진" src="images/festival/festival-banner.jpg" width="1000px">
	</div>
	
	 <div class="row py-5 ">	
		<div class="row row-cols-3 text-center">
		  <c:forEach var="vo" items="${list }">
			<div class="row no-gutters bg-light position-relative">
			  <div class="col-md-6 mb-md-0 p-md-4">
			    <img src="images/festival/${vo.fileName }" class="card-img-top" alt="...">
			  </div>
			  <div class="col-md-6 position-static p-4 pl-md-0">
			    <h5 class="mt-0">${vo.title }</h5>
			    <a href="controller2?type=festivalView&boardNum=${vo.boardNum }" class="btn btn-primary">상세보기</a>
			  </div>
			</div>
		 </c:forEach>
		</div>
	</div> 
	
	<!-- 페이징 처리 -->	
	<div class="p-5">
		<nav aria-label="Page navigation example">
	  		<ul class="pagination justify-content-center">
	  			<c:if test="${pvo.beginPage == 1 }">
		    		<li class="page-item disabled">
		     			<a class="page-link">Previous</a>
		    		</li>
		    	</c:if>
		    	<c:if test="${pvo.beginPage != 1 }">
					<li>
						<a class="page-link" href="controller2?type=festivalList&cPage=${pvo.begin - 1 }">Previous</a>
					</li>
				</c:if>	
				
				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li class="page-item"><a class="page-link">${pageNo }</a></li>
					</c:if>
					<c:if test="${pageNo != pvo.nowPage }">
						<li class="page-item">
							<a class="page-link" href="controller2?type=festivalList&cPage=${pageNo }">${pageNo }</a>
						</li>
					</c:if>
				</c:forEach>
				
				<c:if test="${pvo.endPage < pvo.totalPage }">
				    <li class="page-item">
		      			<a class="page-link" href="controller2?type=festivalList&cPage=${pvo.endPage + 1 }">Next</a>
		    		</li>
		    	</c:if>
		    	<c:if test="${pvo.endPage >= pvo.totalPage }">
					<li class="page-item disabled">
						<a class="page-link">Next</a>
					</li>	
				</c:if>	
	  		</ul>
		</nav>
	</div>
	
</div>
</div>
</div>

<%@ include file="../jspf/footer.jspf"%>
</body>
</html>