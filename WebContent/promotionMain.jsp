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
<title>홍보물신청 | 강원관광 홈페이지 > 관광소식 > 홍보물신청</title>
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
					<h3>홍보물신청</h3>
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
				<div class="contsArea skinContainer ">
					<!-- 본문시작 -->
					<div class="promotion">
						<h4>강원도 관광 홍보물 신청 안내</h4>
						<div class="box01">
							<p>
								강원도 관광 홍보물을 무료로 발송해드리고 있습니다. <span class="blue"> (단. 지도
									외의 책자 홍보물은 택배발송 동의하에 착불 발송) </span> 관광 홍보물 발송은 매일 오후 1시 기준으로 발송되어 기준시간
								이전은 당일,이후 신청건은 다음날 발송 됩니다. (주말, 공휴일 제외)
							</p>
							<ul>
								<li>※ 일반우편 발송으로 3~5일 가량 소요됩니다.</li>
								<li>※ 관광홍보물 신청시 수집된 개인정보는 신청일 기준 당해 연도 까지만 보관되고 삭제됩니다.</li>
								<li>※ 문의전화 : 033-244-0088</li>
							</ul>
						</div>
						<div class="col-5">
							<a href="#" class="request"> <strong> 시 · 군<br>홍보물
									신청
							</strong></a>
						</div>
						<div class="city">
							<p>여행에 도움이 되는 길잡이, 강원도 각 시ㆍ군에서 발행되는 홍보물을 신청하세요</p>
							<ul class="nav nav-pills">
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="http://tour.chuncheon.go.kr/contents.do?cid=2967acb0fc064988a14de604fb4ce399"
									target="_balnk" title="새창">춘 천</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.wonju.go.kr/tour/selectBbsNttList.do?bbsNo=1037&amp;key=4061&amp;"
									target="_balnk" title="새창">원 주</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.gn.go.kr/tour/prog/prManage/sub04_04_02/list.do"
									target="_balnk" title="새창">강 릉</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="http://www.dh.go.kr/tour/sub.htm?nav_code=tou1496969317"
									target="_balnk" title="새창">동 해</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://tour.taebaek.go.kr/tour/story/story_materials"
									target="_balnk" title="새창">태 백</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://sokchotour.com/tour/guide/guide_promotion"
									target="_balnk" title="새창">속 초</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="http://www.samcheok.go.kr/tour/01461/01538.web"
									target="_balnk" title="새창">삼 척</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.hongcheon.go.kr/tour/selectBbsNttList.do?bbsNo=163&amp;key=1988"
									target="_balnk" title="새창">홍 천</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.hsg.go.kr/tour/00000324/00000550.web"
									target="_balnk" title="새창">횡 성</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.yw.go.kr/tour/contents.do?key=603"
									target="_balnk" title="새창">영 월</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://tour.pc.go.kr/Home/H50000/H50800/applicationForm"
									target="_balnk" title="새창">평 창</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.jeongseon.go.kr/tour/travelguide/prArticle"
									target="_balnk" title="새창">정 선</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.cwg.go.kr/tour/contents.do?key=1591"
									target="_balnk" title="새창">철 원</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="http://tour.ihc.go.kr/hb/portal/sub05_05" target="_balnk"
									title="새창">화 천</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.ygtour.kr/Home/H50000/H50600/applicationForm"
									target="_balnk" title="새창">양 구</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://tour.inje.go.kr/tour/guide/guide_tourbook"
									target="_balnk" title="새창">인 제</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://www.gwgs.go.kr/prog/hongbo/tour/sub07_06/list.do"
									target="_balnk" title="새창">고 성</a></li>
								<li style="width: 15%;"><a class="btn btn-outline-primary"
									href="https://tour.yangyang.go.kr/tour/guide/guide_reference/guide_reference_promotion"
									target="_balnk" title="새창">양 양</a></li>
							</ul>
						</div>
					</div>
					<p>
						<br>
					</p>
					<c:if test="${empty vo }">
						<tr>
							<td colspan="5">현재 등록된 제품이 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not empty vo }">
						<div class="row row-cols-1 row-cols-md-3">
							<c:forEach var="vo" items="${vo }">
								<div class="col mb-4">
									<div class="card text-center" style="width: 18rem;">
										<img class="card-img-top" src="imgs/${vo.fileName }"
											alt="${vo.title }">
										<h3 class="card-title">${vo.title }</h3>
										<%-- <p>${vo.fileName }</p> --%>
										<div class="btn_box">
											<a class="btn btn-primary"
												href="download.jsp?path=promotionPDF&filename=${vo.oriName }.pdf">다운로드</a>
											<%-- <a href="promotionPDF/${vo.oriName }.pdf" class="down" title="다운로드">다운로드</a> --%>
											<%-- <a href="download.jsp?path=promotionPDF&filename=${vo.oriName }">다운로드할 파일</a> --%>
										</div>
									</div>
									<%-- <p>${vo.title }</p> --%>
								</div>
							</c:forEach>
						</div>
					</c:if>
					<a class="btn btn-primary btn-lg btn-block" href="controller?type=checkPro">홍보물 신청하기</a>
				</div>
				<c:if test="${ch.id eq 'admin'}">
					<div>
						<input type="button" value="글쓰기"
							onclick='javascript:location.href="controller?type=write"'>
						<input type="button" value="수정"
							onclick='javascript:location.href="controller?type=modify"'>
						<input type="button" value="삭제"
							onclick='javascript:location.href="controller?type=delete"'>
					</div>
				</c:if>
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