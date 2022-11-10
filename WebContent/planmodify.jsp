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
<title>여행 플래너</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc9d5f5032edd69ca4ed772c62da10f0"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<script>
	function tripplanlist_go() {
		location.href = "controller4?type=planlist";
	}
</script>
<script src="js/planmap.js"></script>
<body>
<!-- navbar -->
<%@ include file="infomainnav.jspf" %>

<main id="content" style="margin-left: 200px;">
	<div style="width: 100%;">
        <div style="width: 50%; height: 600px; float: left;"> 
        <form action="controller4?type=planmodify&tripnum=${pvo.tripnum}" method="post">
        <h3 style="margin-top: 20px; margin-left: 25%; font-family: 'Jua', sans-serif;">여행일정 만들기</h3>
        <hr>
		<h3 style="margin-top: 20px; font-family: 'Jua', sans-serif;">여행제목 : <input type="text"  style=" width: 500px;
			  height: 32px;
			  font-size: 15px;
			  border: 0;
			  border-radius: 15px;
			  outline: none;
			  padding-left: 10px;
			  background-color: rgb(233, 233, 233);" name="triptitle" placeholder="여행제목을 입력해주세요."></h3>
		<hr>
		<h3 style="font-family: 'Jua', sans-serif;">여행지역</h3>
		<select name="region" title="여행지역"  style=" width: 300px; text-align: center; ">
				<option value="강원도" onclick="panTo()">강원도</option>
				<option value="춘천시" onclick="panTo1()">춘천시</option>
				<option value="원주시" onclick="panTo2()">원주시</option>
				<option value="강릉시" onclick="panTo3()">강릉시</option>
				<option value="동해시" onclick="panTo4()">동해시</option>
				<option value="태백시" onclick="panTo5()">태백시</option>
				<option value="속초시" onclick="panTo6()">속초시</option>
		</select>
		<hr>
		<h3 style="font-family: 'Jua', sans-serif;">여행테마</h3>
		<select name="theme" title="여행테마" style="width: 300px; text-align: center; ">
				<option value="국도여행" >국도여행</option>
				<option value="맛집탐방">맛집탐방</option>
				<option value="라이딩여행">라이딩여행</option>
				<option value="숲속여행">숲속여행</option>
				<option value="피크닉여행">피크닉여행</option>
		</select>
		<hr>
		<h3 style="font-family: 'Jua', sans-serif;">여행목적</h3>
		<select name="purpose" title="여행목적" style="width: 300px; text-align: center; ">
				<option value="휴식/힐링">휴식/힐링</option>
				<option value="경관/포토">경관/포토</option>
				<option value="체험">체험</option>
				<option value="걷기/등산">걷기/등산</option>
				<option value="레저">레저</option>
				<option value="액티비티">액티비티</option>
				<option value="역사">역사</option>
		</select>
		<hr>
		<h5 style="font-weight: bold; font-family: 'Jua', sans-serif;">1일차 동선</h5>
		<input type="text" name="day1" style="width: 600px; font-family: 'Jua', sans-serif;" value="${pvo.day1 }">
		<hr>
		<h5 style="font-weight: bold; font-family: 'Jua', sans-serif;">2일차 동선</h5>
		<input type="text" name="day2" style="width: 600px; font-family: 'Jua', sans-serif;" value="${pvo.day2 }">
		<hr>
		<h5 style="font-weight: bold; font-family: 'Jua', sans-serif;">3일차 동선</h5>
		<input type="text" name="day3" style="width: 600px; font-family: 'Jua', sans-serif;" value="${pvo.day3 }">
		<hr>
		<input type="submit" value="저장하기" style="width: 500px;
			  height: 32px;
			  font-size: 15px;
			  border: 0;
			  border-radius: 15px;
			  outline: none;
			  padding-left: 10px;
			  background-color: rgb(233, 233, 233);
			  margin-left: 10%; ">
	    <input type="button" value="목록으로 돌아가기" onclick="tripplanlist_go()" style="width: 500px;
			  height: 32px;
			  font-size: 15px;
			  border: 0;
			  border-radius: 15px;
			  outline: none;
			  padding-left: 10px;
			  background-color: rgb(233, 233, 233);
			  margin-left: 10%;
			  margin-top: 30px; ">
	</form>
        </div>
        <div style="margin-left: 50%; height: 600px;"> 
        <div class="map" id="map" style="height:900px; cursor: url(https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico) 7 5, url(https://t1.daumcdn.net/mapjsapi/images/cursor/openhand.cur.ico), default;
"></div>
		<script src="js/planmap.js"></script>
        </div>
    </div>
</main>


<!-- 푸터 -->
<%@ include file="planfooter.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>