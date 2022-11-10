<%@page import="java.util.List"%>
<%@page import="com.mystudy.info.dao.infoDAO"%>
<%@page import="com.mystudy.info.vo.infoVO"%>
<%@page import="com.mystudy.info.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.input-form {
	width: 800px;
	margin-top: 3px;
	margin-left: 30px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}
</style>
</head>

<body>

	<!-- navbar -->
	<%@ include file="mypagemainnav5.jspf"%>

	<!-- content -->
	<div class="container">

		<div class="row">
			<!-- 사이드 내비 -->
			<%@ include file="masterpagesidenav.jspf"%>


			<div class="col-10">
				<!-- 내용 -->
				<div class="row p-1 my-3 border">
					<div class="col-4">
						<p>총회원수 ${pvo.getTotalRecord() }명 | 페이지
							${pvo.getNowPage()}/${pvo.getTotalPage() }</p>
					</div>
				</div>
				<div class="row border-bottom">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">생년월일</th>
								<th scope="col">핸드폰번호</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list }">
								<tr>
									<td>현재 가입한 회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty list }">
								<c:forEach var="list" items="${list }">
									<tr>
										<td class="skinTxa-center" data-hidden="tablet">${list.id }</td>
										<td class="skinTb-sbj" data-seq="first"><a
											href="controller?type=memberDetail&id=${list.id }">
												${list.name }(상세보기) </a></td>
										<td class="skinTb-name skinTxa-center">${list.birth }</td>
										<td class="skinTb-date skinTxa-center">${list.phone }</td>
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
									href="controller?type=allMember&cPage=${pvo.beginPage - 1 }">Previous</a>
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
										href="controller?type=allMember&cPage=${pageNo }">${pageNo}</a></li>
								</c:if>
							</c:forEach>
							<%-- [다음으로]에 대한 사용여부 처리 --%>
							<c:if test="${pvo.endPage < pvo.totalPage}">
								<li class="page-item"><a
									href="controller?type=allMember&cPage=${pvo.endPage + 1 }">다음으로</a></li>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage}">
								<li class="page-item"><a class="page-link">Next</a></li>
							</c:if>
							<li class="page-item"><a class="page-link"
								href="controller?type=allMember">전체목록</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<%-- 
					<c:if test="${ch.id eq 'admin'}">
						<div>
							<input type="button" value="글쓰기"
								onclick='javascript:location.href="controller?type=newsWrite"'>
							<input type="button" value="수정"
								onclick='javascript:location.href="controller?type=newsModify"'>
						</div>
					</c:if> --%>
		</div>

	</div>

	<!-- 푸터 -->
	<%@ include file="jspf/footer.jspf"%>

</body>
</html>