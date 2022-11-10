<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글삭제</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script>
	function sendData() {
		let firstForm = document.forms[0];
		for (let i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}

	function list_go() {
		location.href = "education.jsp";
	}
</script>
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
		<h3>교육여행 업로드</h3>
	</div>
	
	
	<!-- 진짜 내용 -->
	<div class="py-5">
		<form class="form" action="controller2?type=educationDelete" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label for="Input1" class="col-sm-2 col-form-label">삭제할 글번호</label>
				<div class="col-sm-10">
				<input type="text" name="boardNum" title="글번호" class="form-control">
				</div>
			</div>
			
		  
		  <div class="form-group row">
		    <div class="col-sm-10">
		   		<input type="button" value="삭제" onclick="sendData()">
				<input type="reset" value="초기화">
				<input type="button" value="목록보기" onclick="list_go()">
		    </div>
	  	</div>
		</form>		
	</div>	
	

</div>
</div>
</div>

<!-- 푸터 -->

<%@ include file="../jspf/footer.jspf" %>
 

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</body>

</html>