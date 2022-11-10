<%@page import="com.mystudy.trip.vo.CultureVO"%>
<%@page import="com.mystudy.trip.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
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
	location.href = "controller2?type=festivalDelete&boardNum=${vo.boardNum }";
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

	<div class="row p-3 border-bottom">
		<h3>${vo.title }</h3>
	</div>
	
	<c:if test="${ch.id eq 'admin' }">
	<div class="row border-bottom ">
		<form class="form-inline">
			<input class="btn btn-secondary" type="button" value="수 정" onclick="javascript:location.href='controller2?type=festivalUpdate&boardNum=${vo.boardNum }'" style="margin-right: 2px;">
		</form>		
		<form class="form-inline">
			<input class="btn btn-secondary" type="button" value="삭 제" onclick="deleteData()">
		</form>		
	</div>
	</c:if>
	
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
	      <img src="images/festival/${vo.fileName }" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item" style="<c:if test='${vo.viewName1 == null }'>visibility:hidden;</c:if>">
	      <img src="images/festival/${vo.viewName1 }" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item" style="<c:if test='${vo.viewName2 == null }'>visibility:hidden;</c:if>">
	      <img src="images/festival/${vo.viewName2 }" class="d-block w-100" alt="...">
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    <div class="carousel-item" style="<c:if test='${vo.viewName3 == null }'>visibility:hidden;</c:if>">
	      <img src="images/festival/${vo.viewName3 }" class="d-block w-100" alt="...">
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
		<input class="btn btn-secondary" type="button" value="목록보기" onclick="javascript:location.href='controller2?type=festivalList'">
	</div>
</div>
	
<div class="row">
	<div class="container1">

	  <ul class="tabs">
	    <li class="tab-link current" data-tab="tab-1">행사정보</li>
	  </ul>
	
	  <div id="tab-1" class="tab-content current">
	 	 	<h3><span>기본정보</span></h3>
			<ul>
				<li>기간 : ${vo.time }</li>
				<li>주최 : ${vo.host }</li>
				<li>장소 : ${vo.address }</li>
			</ul>
			<h3><span>소개</span></h3>
			<p>${vo.contain }</p>
			<h3><span>축제정보</span></h3>
			<p>${vo.information }</p>
	  </div>
	</div>
</div>
</div>
</div>	
<%@ include file="../jspf/footer.jspf"%>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>