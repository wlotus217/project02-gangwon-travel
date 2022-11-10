<%@page import="com.mystudy.info.vo.contestVO"%>
<%@page import="com.mystudy.info.dao.planDAO"%>
<%@page import="com.mystudy.info.vo.planVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.info.dao.contestDAO"%>
<%@page import="com.mystudy.info.vo.infoVO"%>
<%@page import="com.mystudy.info.common.Paging"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link rel="stylesheet" href="css/table.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc9d5f5032edd69ca4ed772c62da10f0"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="preconnect" href="css/tripfont.css">
</head>
<script>
function contestlist_go() {
	location.href = "controller4?type=contestlist";
}
</script>
<body>


<!-- navbar -->
<%@ include file="infomainnav.jspf" %>

<!-- 내용 -->
<div id="contest">
	<form action="controller4?type=contestmodify&picNum=${cvo.picNum}" method="post" enctype="multipart/form-data">
	<table style="margin-left: 25%; font-family: 'Jua', sans-serif;">
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text" name="picTitle" value="${cvo.picTitle }" style="border: none; float: left; width: 100%;"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="picName" style="border: none; float: left; width: 100%;"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="picContent" rows="5" cols="60" style="border: none; width: 100%;">${cvo.picContent }</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="submit" value="수 정">
					<input type="reset" value="초기화">
					<input type="button" value="목록보기" onclick="contestlist_go()">
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
	<hr>
	
</div>


<!-- 푸터 -->
<%@ include file="footer.jspf" %>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>
</html>