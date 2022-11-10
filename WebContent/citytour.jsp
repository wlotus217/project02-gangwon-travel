<%@page import="java.util.List"%>
<%@page import="com.mystudy.info.dao.infoDAO"%>
<%@page import="com.mystudy.info.vo.infoVO"%>
<%@page import="com.mystudy.info.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시티투어</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>


<!-- navbar -->
<%@ include file="infomainnav.jspf" %>


<!-- content -->
<div class="container">

<div class="row">

<!-- 사이드 내비 -->
<%@ include file="infosidenav.jspf" %>


<!-- 내용 -->
<div class="col-10">

	<div class="row p-3 border-bottom">
		<h3>시티투어</h3>
	</div>
	<div class="citytour" style="position:relative;"><img src="imgs/citytour.jpg" width="900px" height="1700px" style="background-color: white; margin-top: 10px;">
  		<div style="position:absolute; top:70px; left:10px">
  			<img src="imgs/citytourtxt.jpg">
  		</div>
  		<div style="position:absolute; top:180px; left:500px; font-size: 2em;">
  			<h2><a href="https://citytour.ticketplay.zone/portal/index" style=" text-decoration: none; color: orange;"><img src="imgs/춘천.jpg" style="width: 220px; height: 100px"></a></h2>
  		</div>
  		<div style="position:absolute; top:300px; left:70px; font-size: 2em;">
  			<h2><a href="https://www.wonju.go.kr/tour/contents.do?key=4068&" style=" text-decoration: none; color: green;"><img src="imgs/원주시.jpg" style="width: 220px; height: 100px"></a></h2>
  		</div>
  		<div style="position:absolute; top:600px; left:500px; font-size: 2em;">
  			<h2><a href="https://tour.taebaek.go.kr/tour/together/together_citytour" style=" text-decoration: none; color: red;"><img src="imgs/태백시.jpg" style="width: 220px; height: 100px"></a></h2>
  		</div>
  		<div style="position:absolute; top:775px; left:5px; font-size: 2em;">
  			<h2><a href="https://www.samcheok.go.kr/citytour/" style=" text-decoration: none; color: blue;"><img src="imgs/삼척시.jpg" style="width: 200px; height: 100px"></a></h2>
  		</div>
  		<div style="position:absolute; top:1150px; left:150px; font-size: 2em;">
  			<h2><a href="http://xn--6i4bu5ao0ds7cc1su7a.com/" style=" text-decoration: none; color: yellow;"><img src="imgs/정성군.jpg" style="width: 200px; height: 100px"></a></h2>
  		</div>
  		<div style="position:absolute; top:1500px; left:380px; font-size: 2em;">
  			<h2><a href="https://tour.ihc.go.kr/hb/portal/sub02_03_02" style=" text-decoration: none; color: navy;"><img src="imgs/화천군.jpg" style="width: 200px; height: 100px"></a></h2>
  		</div>
	</div>

</div>
<!-- 내용 끝 -->
</div>
</div>


<!-- 푸터 -->
<%@ include file="jspf/footer.jspf" %>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>