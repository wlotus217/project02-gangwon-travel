<%@page import="com.mystudy.story.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.story.dao.ReviewDAO"%>
<%@page import="com.mystudy.story.common.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행후기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<script>
	//검색어 미입력시 alert창 띄우기
	function search_go(frm) {
		if (frm.searchKeyword.value.trim() == "") {
			alert("검색어를 입력해주세요.");
			frm.searchKeyword.focus();
			return false;
		}
		frm.submit();
	}
	//새글등록 클릭 시 alert창 띄우기
	function write_go(frm) {
		if ('${ch.id}' == "") {
			alert("로그인 후 이용해주세요.");
			return;
		}
		if ('${ch.id}' == 'admin') {
			alert("여행후기는 회원만 작성 가능합니다.");
			return;
		}
		frm.submit();
	}
</script>
</head>
<body>

	<!-- 상단 nav -->
	<%@ include file="../jspf/storynav.jspf"%>

	<div class="container">

		<div class="row">

			<!-- 사이드 nav -->
			<%@ include file="../jspf/storySidenav.jspf"%>

			<!-- content -->
			<div class="col-10">

				<!-- 페이지 제목 -->
				<div class="row p-3 border-bottom">
					<h3>여행후기</h3>
				</div>

				<!-- 내용 -->
				<div class="row p-1 my-2 border">
					<div class="col-4">
						<p>총 게시물 ${pvo.totalRecord}건 페이지 ${pvo.nowPage}/${pvo.totalPage}</p>
					</div>
					<div class="col-8">
						<form class="form-inline float-right"
							action="${pageContext.request.contextPath }/controller3?type=reviewSearch"
							method="post">
							<select class="custom-select" name="search">
								<option value="title" selected>제목</option>
								<option value="content">내용</option>
							</select> 
							<input class="form-control mr-sm-2" type="search"
								name="searchKeyword" placeholder="여기에 검색어를 입력해주세요."> 
							<input class="btn btn-outline-success my-2 my-sm-0" type="button"
								value="검색" onclick="search_go(this.form)">
						</form>
					</div>
				</div>

				<div class="row border-bottom ">
					<form class="form-inline"
						action="${pageContext.request.contextPath }/review/review_write.jsp">
						<input class="btn btn-secondary m-2" type="button" value="새글 등록"
							onclick="write_go(this.form)">
					</form>
				</div>

				<div class="row py-5 ">
					<c:choose>
						<c:when test="${empty list }">
							<h2>현재 등록된 게시글이 없습니다.</h2>
						</c:when>
						<c:otherwise>
							<div class="row row-cols-3 text-center">
								<c:forEach var="vo" items="${list }">
									<div class="col">
										<div class="card my-2" style="width: 18rem; height: 23rem;">
											<a href="${pageContext.request.contextPath }/controller3?type=reviewView&idx=${vo.idx}&cPage=${pvo.nowPage}&boardName=여행후기">
												<img
												src="${pageContext.request.contextPath }/imgs/${vo.image1}"
												style="width: 18rem; height: 15rem;" card-img-top" alt="...">
											</a>
											<div class="card-body">
												<h5 class="card-title">${vo.title}</h5>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
				</div>

				<!-- 페이징 처리	 -->
				<div class="p-5">
					<nav aria-label="...">
						<ul class="pagination justify-content-center">
							<%--[이전으로]에 대한 사용여부 처리 --%>
							<c:if test="${pvo.beginPage == 1 }">
								<li class="page-item disabled"><span class="page-link">이전으로</span>
								</li>
							</c:if>
							<c:if test="${pvo.beginPage != 1 }">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath }/controller3?type=reviewTravel&cPage=${pvo.beginPage - 1 }">이전으로</a>
								</li>
							</c:if>
							<%-- 블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
							<c:forEach var="pageNo" begin="${pvo.beginPage }"
								end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
									<li class="page-item active" aria-current="page"><span
										class="page-link">${pageNo }</span></li>
								</c:if>
								<c:if test="${pageNo != pvo.nowPage }">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath }/controller3?type=reviewTravel&cPage=${pageNo }">${pageNo }</a></li>
								</c:if>
							</c:forEach>

							<%-- [다음으로]에 대한 사용여부 처리 --%>
							<c:if test="${pvo.endPage < pvo.totalPage }">
								<li><a class="page-link"
									href="${pageContext.request.contextPath }/controller3?type=reviewTravel&cPage=${pvo.endPage + 1 }">다음으로</a>
								</li>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage }">
								<li class="page-item disabled"><span class="page-link">다음으로</span>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- 페이징 처리 끝 -->

			</div>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>