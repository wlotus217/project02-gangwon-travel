<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.mystudy.bbs.dao.DAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림소식목록 | 강원관광 홈페이지 > 관광소식 > 알림소식</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<style>
.paging .now {
	border: 1px solid #ff4aa5;
	padding: 3px 7px;
	background-color: #ff4aa5;
}
</style>
</head>
<body>
	
	<!-- navbar -->
	<%@ include file="../jspf/newsNav.jspf"%>

	<!-- content -->
	<div class="container">

		<div class="row">

			<!-- 사이드 내비 -->
			<%@ include file="../jspf/newsSidenav.jspf"%>

			<!-- 내용 -->
			<div class="col-10">

				<!-- 페이지 제목 -->
				<div class="row p-3 border-bottom">
					<h3>알림소식</h3>
				</div>


				<!-- 진짜 내용 -->
				<div class="row border-bottom ">
					<div class="col-12">
						<div class="form-inline float-right">
							<div class="btn_box">
								<a href="https://ko-kr.facebook.com/"
									onclick="toSNS('facebook')" class="btn btn-secondary"
									title="새창열림"> facebook에 공유하기 </a> <a
									href="https://accounts.kakao.com/login?continue=https://story.kakao.com/"
									onclick="toSNS('kakao')" class="btn btn-secondary" title="새창열림">
									kakao stroty에 공유하기 </a>
							</div>
						</div>
					</div>
				</div>
				<div class="row p-1 my-3 border">
					<div class="col-12">
						<form class="form-inline float-right" action="controller" method="get">
							<input class="form-control mr-sm-2" type="text" name="keyword" placeholder="여기에 검색어를 입력해주세요.">
							<input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="검색">
							<input type="hidden" name="type" value="newsSearch">
						</form>
					</div>
				</div>
				<div class="row border-bottom">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty vo }">
								<c:forEach var="vo" items="${vo }">
									<tr>
										<td scope="row">${vo.boardNum }</td>
										<td class="skinTb-sbj" data-seq="first"><a
											href="controller?type=detail&boardNum=${vo.boardNum }&title=${vo.title }">
												${vo.title } </a></td>
										<td class="skinTb-name skinTxa-center">${vo.id }</td>
										<td class="skinTb-date skinTxa-center">${vo.writeDate }</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty list }">
								<tr>
									<td>현재 등록된 일반 게시글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty list }">
								<c:forEach var="list" items="${list }">
									<tr>
										<td class="skinTxa-center" data-hidden="tablet">${list.boardNum }</td>
										<td class="skinTb-sbj" data-seq="first"><a
											href="controller?type=detail&boardNum=${list.boardNum }&title=${list.title }">
												${list.title } </a></td>
										<td class="skinTb-name skinTxa-center">${list.id }</td>
										<td class="skinTb-date skinTxa-center">${list.writeDate }</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					</div>
					<div class="p-5">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<%-- [이전으로]에 대한 사용여부 처리 --%>
								<c:if test="${pvo.beginPage == 1}">
									<li class="page-item"><a class="page-link">Previous</a></li>
								</c:if>
								<c:if test="${pvo.beginPage != 1}">
									<li class="page-item disabled"><a class="page-link"
										href="controller?type=newsList&cPage=${pvo.beginPage - 1 }">Previous</a>
									</li>
								</c:if>
								<%-- 블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
								<c:forEach var="pageNo" begin="${pvo.beginPage }"
									end="${pvo.endPage }">
									<c:if test="${pageNo == pvo.nowPage }">
										<li class="page-item"><a class="page-link">${pageNo}</a></li>
									</c:if>
									<c:if test="${pageNo != pvo.nowPage }">
										<li class="page-item"><a class="page-link"
											href="controller?type=newsSearch&cPage=${pageNo }&keyword=${keyword}">${pageNo}</a></li>
									</c:if>
								</c:forEach>
								<%-- [다음으로]에 대한 사용여부 처리 --%>
								<c:if test="${pvo.endPage < pvo.totalPage}">
									<li class="page-item"><a
										href="controller?type=newsList&cPage=${pvo.endPage + 1 }">다음으로</a></li>
								</c:if>
								<c:if test="${pvo.endPage >= pvo.totalPage}">
									<li class="page-item"><a class="page-link">Next</a></li>
								</c:if>
									<li class="page-item"><a class="page-link" href="controller?type=newsList">전체목록</a></li>
							</ul>
						</nav>
					</div>

					<c:if test="${ch.id eq 'admin'}">
						<div>
							<input type="button" value="글쓰기"
								onclick='javascript:location.href="controller?type=newsWrite"'>
							<input type="button" value="수정"
								onclick='javascript:location.href="controller?type=newsModify"'>
							<input type="button" value="전체보기"
								onclick='javascript:location.href="controller?type=newsList"'>
						</div>
					</c:if>
				

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