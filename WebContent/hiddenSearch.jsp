<%@page import="com.mystudy.trip.vo.HiddenVO"%>
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
<style>
	#list {
		float: right;
		bottom: 10px;
	}
</style>
</head>
<script>
	function search_go(frm){
		if(frm.searchKeyword.value.trim() == "") {
			alert("검색어를 입력해주세요.");
			frm.searchKeyword.focus();
			return false;
		}
		frm.submit();

	}

</script>
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
		<h3>숨은명소</h3>
	</div>
	
	<div class="row p-1 my-3 border">
		<div class="col-4"><p>총게시물 ${pvo.getTotalRecord() }건 | 페이지 ${pvo.getNowPage()}/${pvo.getTotalPage() }</p></div>
		<div class="col-8">
			<form class="form-inline float-right" action="controller2?type=hiddenSearch" method="post">
				<select class="custom-select" name="search">
					<option value="title" selected>제목</option>
					<option value="content">내용</option>
				</select>
				<input class="form-control mr-sm-2" type="search" name="searchKeyword" placeholder="여기에 검색어를 입력해주세요.">
				<input class="btn btn-outline-success my-2 my-sm-0" type="button" value="검색" onclick="search_go(this.form)">
			</form>
		</div>
	</div>
	
	<div class="row border-bottom ">
		<form class="form-inline" action="hiddenWrite.jsp">
			<input class="btn btn-secondary" type="submit" value="작 성" style="margin-right: 2px;">
		</form>	
		<c:if test="${ch.id eq 'admin' }">	
		<form class="form-inline" action="hiddenDelete.jsp">
			<input class="btn btn-secondary" type="submit" value="삭 제" >
		</form>	
		</c:if>	
	</div>
	
	<div class="text-center">
		<br>
		<p class="h3">숨은명소 후기</p>
	</div>
	<div class="row my-2 p-5">
		<table class="table table-hover">
  			<thead>
				<tr style="text-align: center">
      				<th scope="col">번호</th>
				    <th scope="col">제목</th>
				    <th scope="col">작성자</th>
				    <th scope="col">날짜</th>
    			</tr>
  			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty searchList }">
						<tr>
							<td colspan="5">
								<h2>현재 등록된 게시글이 없습니다</h2>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${searchList }">
							<tr style="text-align: center">
								<th scope="row">${vo.boardNum }</th>
								<td>
									<a href="controller2?type=hiddenView&boardNum=${vo.boardNum }">${vo.title }</a>
								</td>
								<td>${vo.id }</td>
								<td>${vo.writeDate }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	<div id="list" class="row">
		<input class="btn btn-secondary" type="button" value="목록보기" onclick="javascript:location.href='controller2?type=hiddenList'">
	</div>
	
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
						<a class="page-link" href="controller2?type=hiddenSearch&cPage=${pvo.begin - 1 }">Previous</a>
					</li>
				</c:if>	
				
				<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li class="page-item"><a class="page-link">${pageNo }</a></li>
					</c:if>
					<c:if test="${pageNo != pvo.nowPage }">
						<li class="page-item">
							<a class="page-link" href="controller2?type=hiddenSearch&cPage=${pageNo }&search=${search }&searchKeyword=${searchKeyword }">${pageNo }</a>
						</li>
					</c:if>
				</c:forEach>
				
				<c:if test="${pvo.endPage < pvo.totalPage }">
				    <li class="page-item">
		      			<a class="page-link" href="controller2?type=hiddenSearch&cPage=${pvo.endPage + 1 }">Next</a>
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