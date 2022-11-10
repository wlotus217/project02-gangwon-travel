<%@page import="com.mystudy.trip.dao.DAO"%>
<%@page import="com.mystudy.trip.vo.EducationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교육여행</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
div>a>button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
div>a>button:hover{
  background:#fff;
  color:#1AAB8A;
}
div>a>button:before,div>a>button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
div>a>button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
div>a>button:hover:before,div>a>button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
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
	
	<div>
		<br>
		<h2><span>교육여행</span></h2>
		<hr>
	</div>
	
	<div>
		<a href="http://edutravel.kr"><img alt="교육여행배너" src="images/education/education-banner.jpg"></a>
	</div>
	
	<div>
		<h3>
			지금은 강원도!
			<b>놀며 배우는 <em>테마 교육여행</em></b>
		</h3>
		<p>꿈과 끼가 넘치는 아이들에게 교과서 밖 다채로운 세상을 보여주세요!<br>
		   여행에서 보고 느끼고 체험한 모든 것이 아이들의 생각을 쑥쑥 키우는 원동력이 됩니다.</p>
	</div>
	
	<div>
		<c:forEach var="vo" items="${list }">
			<a href="controller2?type=educationDown&path=c:/MyStudy/temp&filename=${vo.fileName }"><button style="margin-right: 20px">${vo.boardNum } ${vo.title } 다운로드</button></a>
			<br>
			<br>
		</c:forEach>
	</div>
	
	<div>
		<span>영동권</span>
		<span>고성·속초 / 양양·강릉 / 동해·삼척</span>
	</div>
	
	<div>
		<p>태백산맥 동쪽은 모든 것이 다 있습니다. 
		눈이 시리도록 푸른 바다와 호수, 초록빛 짙은 숲길, 세월이 켜켜이 쌓인 역사 유적, 다채로운 레포츠 등 고성에서 시작한 흥미로운 여행은 삼척까지 이어 집니다. 
		여행 길에서 만나는 보석같은 여행지는 과거와 현재를 넘 나들며 즐거움과 짜릿함, 그리고 교과서 밖에서 느낄 수 있는 생생한 감동을 선사합니다.</p>
	</div>
	
	<div>
		<img alt="영동권사진" src="images/education/ed_1.jpg">
	</div>
	
	<div>
		<span>영서권</span>
		<span>평창·정선·횡성 / 태백·영월·춘천 / 홍천·원주·인제</span>
	</div>
	
	<div>
		<p>태백산맥 서쪽의 영서 지방은 완만한 산비탈을 따라 북한강의 지류인 소양강과 홍천강이 흐릅니다. 
		덕분에 춘천과 홍천에서는 물길 따라 레포츠를 즐기고, 태백과 정선에서는 까마득한 선사 시대의 지질 여행과 폐광의 놀라운 변신을 경험할 수 있습니다. 
		원주와 영월에는 조선 시대 유적이 오롯하게 남아 역사의 숨결을 느껴보세요. 
		평창에서는 2018평창동계올림픽의 성공을 바라는 열정 어린 마음과 마주하게 됩니다.</p>
	</div>
	
	<div>
		<img alt="영서권사진" src="images/education/ed_2.jpg">
	</div>
	
	<div>
		<span>DMZ권</span>
		<span>철원·화천·양구 / 인제·고성</span>
	</div>
	
	<div>
		<p>휴전선에서 남북으로 각각 2km, 폭 4km DMZ(Demilitarized Zone, 비무장지대)는 한국 현대사의 아픔을 고스란히 품은 지역입니다. 
		1953년 생겨난 이래 지금까지 사람의 발길이 닿지 않은 덕분에 청정한 자연을 간직하고 있습니다. 
		생태계의 보고가 된 DMZ 접경 지역에서 자연의 웅장함과 신비로움을 느끼고, 안보 여행 코스에서 평화의 소중함을 되새겨보세요.</p>
	</div>
	
	<div style="position: relative; bottom: 10px;">
		<img alt="DMZ권사진" src="images/education/ed_3.jpg">
	</div>
	
	<c:if test="${ch.id eq 'admin' }">
	<div class="row border-bottom" style="float: right;">
		<form class="form-inline">
			<input class="btn btn-secondary" type="button" value="수 정" onclick="javascript:location.href='educationUpload.jsp'" style="margin-right: 2px;">
		</form>		
		<form class="form-inline">
			<input class="btn btn-secondary" type="button" value="삭 제" onclick="javascript:location.href='educationDelete.jsp'">
		</form>		
	</div>
	</c:if>
	
</div>
</div>
</div>
	
<%@ include file="../jspf/footer.jspf"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>