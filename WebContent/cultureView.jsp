<%@page import="com.mystudy.trip.vo.CultureVO"%>
<%@page import="com.mystudy.trip.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화여행 상세보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(document).ready(function(){
	  
	  $('ul.tabs li').click(function(){
	    var tab_id = $(this).attr('data-tab');

	    $('ul.tabs li').removeClass('current');
	    $('.tab-content').removeClass('current');

	    $(this).addClass('current');
	    $("#"+tab_id).addClass('current');
	  })

	});
	
function deleteData() {
	if (confirm("삭제하시겠습니까?")) {
	location.href = "controller2?type=cultureDelete&boardNum=${vo.boardNum }";
	}
}

</script>
<style>	
	.container1{
	  width: 650px;
	  margin: 0 auto;
	  top: 10px;
	  left: 60px;
	  position: relative;
	}
	
	ul.tabs{
	  margin: 0px;
	  padding: 0px;
	  list-style: none;
	}
	ul.tabs li{
	  background: none;
	  color: #222;
	  display: inline-block;
	  padding: 10px 15px;
	  cursor: pointer;
	}
	
	ul.tabs li.current{
	  background-color: lightgray;
	  color: #222;
	}
	
	.tab-content{
	  display: none;
	  padding: 15px;
	}
	
	.tab-content.current{
	  display: inherit;
	}
	
	li {
		list-style: none;
	}
	#list {
		float: right;
		position: relative;
		bottom: 10px;
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

<!-- 내용 -->
<div class="col-10">
	
<!-- 페이지 제목 -->	
	<div class="row p-3 border-bottom">
		<h3>${vo.title }</h3>
	</div>
	
	<c:if test="${ch.id eq 'admin' }">
	<div class="row border-bottom ">
		<form class="form-inline">
			<input class="btn btn-secondary" type="button" value="수 정" onclick="javascript:location.href='controller2?type=cultureUpdate&boardNum=${vo.boardNum }'" style="margin-right: 2px;">
		</form>		
		<form class="form-inline">
			<input class="btn btn-secondary" type="button" value="삭 제" onclick="deleteData()">
		</form>		
	</div>	
	</c:if>
	<!-- 진짜 내용 -->	
	
	<div class="row py-5 ">
		<div id="carouselExampleCaptions" class="carousel slide">
	  <ol class="carousel-indicators">
	    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
	    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
	    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
	    <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
	  </ol>
	  <div class="carousel-inner">
	    <div class="carousel-item active" style="<c:if test='${vo.fileName == null }'>visibility:hidden;</c:if>">
	      <img src="images/culture/${vo.fileName }" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item" style="<c:if test='${vo.viewName1 == null }'>visibility:hidden;</c:if>">
	      <img src="images/culture/${vo.viewName1 }" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item" style="<c:if test='${vo.viewName2 == null }'>visibility:hidden;</c:if>">
	      <img src="images/culture/${vo.viewName2 }" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item" style="<c:if test='${vo.viewName3 == null }'>visibility:hidden;</c:if>">
	      <img src="images/culture/${vo.viewName3 }" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </button>
	</div>
	</div>
	
	
	<div id="list" class="row">
		<input class="btn btn-secondary" type="button" value="목록보기" onclick="javascript:location.href='controller2?type=cultureList'">
	</div>	
</div>

<div class="row">
	<div class="container1">

	  <ul class="tabs">
	    <li class="tab-link current" data-tab="tab-1">관광지정보</li>
	    <li class="tab-link" data-tab="tab-2">지도보기</li>
	  </ul>
	
	  <div id="tab-1" class="tab-content current">
	 	 	<h3><span>기본정보</span></h3>
			<ul>
				<li>이름 : ${vo.title }</li>
				<li>주소 : ${vo.address }</li>
				<li>이용요금 : ${vo.pay }</li>
				<li>이용시간 : ${vo.time }</li>
				<li>전화번호 : ${vo.phone }</li>
			</ul>
			<h3><span>소개</span></h3>
			<p>${vo.contain }</p>
	  </div>
	  <div id="tab-2" class="tab-content">
	  	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d806447.7801976156!2d127.679248351369!3d37.85592309696623!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356237ec59968d89%3A0xe150c7d25a07a6e!2z6rCV7JuQ64-E!5e0!3m2!1sko!2skr!4v1666573955302!5m2!1sko!2skr" 
		width="930" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	  </div>
	
	</div>
	
</div>
</div>
</div>		
<%@ include file="../jspf/footer.jspf"%>
</body>
</html>