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
<link href="declare.css" rel="stylesheet" type="text/css" />
<title>관광불편신고 | 강원관광 홈페이지 > 관광소식 > 관광불편신고</title>
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
					<h3>관광불편신고</h3>
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

					<div class="nav justify-content-center">

						<a
							href="http://kto.visitkorea.or.kr/kor/customer/complaints/request.kto"
							class="banner"> <img class="a" src="imgs/dec.jpg"
							width="1000px">
						</a>
					</div>
					<p>
						<br>
					</p>
					<h3>시군별 신고센터</h3>
					<div class="row my-5">
						<ul class="nav nav-pills">
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info"
								href="http://www.chuncheon.go.kr/index.chuncheon?menuCd=DOM_000000586000000000" title="새창">
									<h2>춘천시</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info"
								href="http://www.chuncheon.go.kr/index.chuncheon?menuCd=DOM_000000586000000000" title="새창">
									<h2>원주시</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info"
								href="http://tour.taebaek.go.kr/site/ko/pages/sub07/sub07_12.jsp"
								target="_blank" title="새창">
									<h2>태백시</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="http://www.samcheok.go.kr/tour/01461/01541.web"
								target="_blank" title="새창">
									<h2>삼척시</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="https://www.great.go.kr/_comm/comm07.asp"
								target="_blank" title="새창">
									<h2>홍천군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="https://eminwon.hsg.go.kr/emwp/ksign/login/i.jsp"
								target="_blank" title="새창">
									<h2>횡성군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="https://www.yw.go.kr/tour/contents.do?key=603"
								target="_blank" title="새창">
									<h2>영월군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="http://tour.pc.go.kr/?c=6/44" target="_blank"
								title="새창">
									<h2>평창군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info"	href="http://jeongseon.go.kr/tour/travelguide/travel_QnA"
								target="_blank" title="새창">
									<h2>정선군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="http://www.cwg.go.kr/site/tour/boardList.do?boardSeq=67&amp;key=407&amp;part=4300030"
								target="_blank" title="새창">
									<h2>철원군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="http://tour.ihc.go.kr/hb/portal/sub05_06"
								target="_blank" title="새창">
									<h2>화천군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info"	href="http://www.ygtour.kr/twb_bbs/user_bbs_list.php?boardcode=01_06_05_00_00"
								target="_blank" title="새창">
									<h2>양구군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="http://tour.inje.go.kr/tour/guide/guide_review"
								target="_blank" title="새창">
									<h2>인제군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info" href="https://gwgs.go.kr/kor/sub01_030101.do"
								target="_blank" title="새창">
									<h2>고성군</h2> <span>바로가기</span>
							</a></li>
							<li style="width: 25%; height: 10rem;"><a class="btn btn-outline-info"	href="https://tour.yangyang.go.kr/tour/guide/guide_qna"
								target="_blank" title="새창">
									<h2>양양군</h2> <span>바로가기</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<p>&nbsp;</p>
		</div>
		<p>
			<br>
		</p>
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