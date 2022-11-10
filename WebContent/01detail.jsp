<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.mystudy.bbs.dao.DAO" scope="session" />
<%-- <%
	List<BbsVO> list = DAO.eBookList();
	pageContext.setAttribute("list", DAO.eBookList());
	System.out.print(list);
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림소식목록 | 강원관광 홈페이지 > 관광소식 > 알림소식</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
</head>
<script>
	function history_back() {
		history.back();
	}
</script>
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
				<div class="border-bottom">
					<!-- 콘텐츠 입력 -->
					<c:if test="${empty vo }">
						<div>
							<h3>현재 등록된 제품이 없습니다</h3>
						</div>
					</c:if>
					<c:if test="${not empty vo }">
					<div class="row my-2 p-5">
						<table class="row table ">
							<tr>
								<th scope="row">제목</th>
								<td>${vo.title }</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>${vo.id }</td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td>${vo.content }</td>
							</tr>
							<tr>
								<td scope="row"><c:if test="${empty vo.fileName }">	첨부파일없음</c:if>
									<c:if test="${not empty vo.fileName }">
										<a href="promotionPDF/${vo.oriName }.pdf">${vo.fileName }</a>
									</c:if></td>
							</tr>
							<tr>
								<td><input type="button" value="목록으로" onclick="history_back()"> 
									<c:if test="${ch.id eq 'admin'}">
										<input type="button" value="삭제" onclick='javascript:location.href="controller?type=newsDelete&boardNum=${vo.boardNum }&title=${vo.title }"'>
									</c:if>
								</td>
							</tr>
						</table>
						</div>
					</c:if>
				</div>
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