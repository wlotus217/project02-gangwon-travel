<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script>
	function sendData() {
		let firstForm = document.forms[0];
		for (let i = 0; i < firstForm.elements.length; i++) {
			if(firstForm.elements[0].value > 12) {
				alert("12 이하의 숫자를 입력하세요");
				firstForm.elements[0].focus();
				return;
			}
			if (firstForm.elements[i].value.trim() == "") {
				if (i > 6) continue;
				alert(firstForm.elements[i].title + "입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}

	function list_go() {
		location.href = "controller2?type=festivalList";
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
		<h3>축제 업로드</h3>
	</div>
	
	
	<!-- 진짜 내용 -->
	<div class="py-5">
		<form class="form" action="controller2?type=festivalUpload" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label for="Input1" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
				<input type="text" name="title" title="제목" class="form-control">
				</div>
			</div>
			
		  <div class="form-group row">
		    <label for="Textarea1" class="col-sm-2 col-form-label" >내용</label>
		    <div class="col-sm-10">
		    <textarea class="form-control" name="contain" title="내용" id="Textarea1" rows="15" ></textarea>
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="Textarea1" class="col-sm-2 col-form-label" >월</label>
		    <div class="col-sm-10">
		    <input type="text" name="month" title="월" class="form-control">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="Textarea1" class="col-sm-2 col-form-label" >기간</label>
		    <div class="col-sm-10">
		    <input type="text" name="time" title="기간" class="form-control">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="Textarea1" class="col-sm-2 col-form-label" >주소</label>
		    <div class="col-sm-10">
		    <input type="text" name="address" title="주소" class="form-control">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="Textarea1" class="col-sm-2 col-form-label" >주최</label>
		    <div class="col-sm-10">
		    <input type="text" name="host" title="주최" class="form-control">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="Textarea1" class="col-sm-2 col-form-label" >축제정보</label>
		    <div class="col-sm-10">
		    <input type="text" name="information" title="축제정보" class="form-control">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="File1" class="col-sm-2 col-form-label">이미지1(썸네일)</label>
		    <div class="col-sm-10">
		    <input type="file" class="form-control-file" name="fileName" title="이미지1(썸네일)" id="File1">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="File1" class="col-sm-2 col-form-label">이미지2</label>
		    <div class="col-sm-10">
		    <input type="file" class="form-control-file" name="viewName1" title="이미지2" id="File1">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="File1" class="col-sm-2 col-form-label">이미지3</label>
		    <div class="col-sm-10">
		    <input type="file" class="form-control-file" name="viewName2" title="이미지3" id="File1">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="File1" class="col-sm-2 col-form-label">이미지3</label>
		    <div class="col-sm-10">
		    <input type="file" class="form-control-file" name="viewName3" title="이미지3" id="File1">
		    </div>
		  </div>
		  
		  
		  <div class="form-group row">
		    <div class="col-sm-10">
		   		<input type="button" value="저장" onclick="sendData()">
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