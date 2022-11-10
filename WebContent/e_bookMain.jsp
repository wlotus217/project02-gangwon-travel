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
<title>언택트 관광 e-book | 강원관광홈페이지 > 관광소식 > 언택트 관광 e-book</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
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
					<h3>언택트 관광 e-book</h3>
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
				<br>
				<div class="contsArea skinContainer">
					<!-- 본문시작 -->
					<main>
						<section class="container">
							<article class="content">
								<div>
									<div class="promotion">
										<h4>언택트 관광 e-book</h4>
										<!-- 이부분 반복문과 자바스크립트 이용해서 구현하기 -->
										<c:if test="${empty vo }">
											<tr>
												<td colspan="5">현재 등록된 제품이 없습니다</td>
											</tr>
										</c:if>
										<%-- 등록된 제품이 있는 경우 --%>
										<c:if test="${not empty vo }">
											<div class="row row-cols-1 row-cols-md-3">

												<c:forEach var="vo" items="${vo }">
													<div class="col mb-4">
														<div class="card text-center">
															<img class="card-img-top" src="imgs/${vo.fileName }">
															<div class="card-body">
																<h5 class="card-title">${vo.title }</h5>
																<a class="btn btn-primary"
																	href="https://www.gangwon.to/page/untact/untact-travel_${vo.oriName }/index.html"
																	title="열기">상세보기</a>
															</div>
														</div>
													</div>
												</c:forEach>

											</div>
										</c:if>
										<!-- 이부분까지 반복문과 자바스크립트 이용해서 구현하기 -->
									</div>
								</div>
								<p>
									<br>
								</p>
								<c:if test="${ch.id eq 'admin'}">
									<div>
										<input type="button" value="글쓰기"
											onclick='javascript:location.href="04write.jsp"'> <input
											type="button" value="수정"
											onclick='javascript:location.href="04-2modify.jsp"'>
										<input type="button" value="삭제"
											onclick='javascript:location.href="04delete.jsp"'>
									</div>
								</c:if>
							</article>
						</section>
					</main>
				</div>

			</div>
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