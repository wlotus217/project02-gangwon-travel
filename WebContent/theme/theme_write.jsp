<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강원도이야기 화면</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</head>
<script>
	//장소1 이미지 까지 필수 입력값 - 미입력시 alert
	function sendData(frm) {
		let firstForm = document.forms[0];

		for (let i = 0; i < 5; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				alert(firstForm.elements[i].title + "을(를) 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		frm.submit();
	}
</script>

<body>
	<!-- 상단 nav -->
	<%@ include file="../jspf/storynav.jspf"%>

	<div class="container">

		<div class="row">

			<!-- 사이드 nav -->
			<%@ include file="../jspf/storySidenav.jspf"%>

			<!-- content -->
			<div class="col-10">
			
				<!-- 페이지 제목 -->
				<div class="row p-3 border-bottom">
					<h3>테마여행 글 작성</h3>
				</div>

				<!-- 내용 -->
				<div class="py-5">

					<form class="form"
						action="${pageContext.request.contextPath }/controller3?type=themeWrite&id=${ch.id}"
						method="post" enctype="multipart/form-data">
						<div class="form-group row">
							<label for="Input1" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="title" title="제목" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="Textarea1" class="col-sm-2 col-form-label">소개글</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="intro" title="소개글"
									id="Textarea1" rows="5"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="Input1" class="col-sm-2 col-form-label">장소명1</label>
							<div class="col-sm-10">
								<input type="text" name="placeName1" title="장소명1"
									class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="Textarea2" class="col-sm-2 col-form-label">장소1 상세</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="detail1" title="장소1 상세"
									id="Textarea2" rows="8"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="File1" class="col-sm-2 col-form-label">장소1 이미지</label>
							<div class="col-sm-10">
								<input type="file" class="form-control-file" name="image1"
									title="장소1 이미지" id="File1">
							</div>
						</div>
						<div class="form-group row">
							<label for="Input1" class="col-sm-2 col-form-label">장소명2</label>
							<div class="col-sm-10">
								<input type="text" name="placeName2" title="장소명2"
									class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="Textarea2" class="col-sm-2 col-form-label">장소2 상세</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="detail2" title="장소2 상세"
									id="Textarea2" rows="8"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="File1" class="col-sm-2 col-form-label">장소2 이미지</label>
							<div class="col-sm-10">
								<input type="file" class="form-control-file" name="image2"
									title="장소2 이미지" id="File1">
							</div>
						</div>
						<div class="form-group row">
							<label for="Input1" class="col-sm-2 col-form-label">장소명3</label>
							<div class="col-sm-10">
								<input type="text" name="placeName3" title="장소명3"
									class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="Textarea2" class="col-sm-2 col-form-label">장소3 상세</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="detail3" title="장소3 상세"
									id="Textarea2" rows="8"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="File1" class="col-sm-2 col-form-label">장소3 이미지</label>
							<div class="col-sm-10">
								<input type="file" class="form-control-file" name="image3"
									title="장소3 이미지" id="File1">
							</div>
						</div>
						<div class="form-group row">
							<label for="Input1" class="col-sm-2 col-form-label">장소명4</label>
							<div class="col-sm-10">
								<input type="text" name="placeName4" title="장소명4"
									class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="Textarea2" class="col-sm-2 col-form-label">장소4 상세</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="detail4" title="장소4 상세"
									id="Textarea2" rows="8"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="File1" class="col-sm-2 col-form-label">장소4 이미지</label>
							<div class="col-sm-10">
								<input type="file" class="form-control-file" name="image4"
									title="장소4 이미지" id="File1">
							</div>
						</div>
						<div class="form-group row">
							<label for="Input1" class="col-sm-2 col-form-label">장소명5</label>
							<div class="col-sm-10">
								<input type="text" name="placeName5" title="장소명5"
									class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="Textarea2" class="col-sm-2 col-form-label">장소5 상세</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="detail5" title="장소5 상세"
									id="Textarea2" rows="8"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="File1" class="col-sm-2 col-form-label">장소5 이미지</label>
							<div class="col-sm-10">
								<input type="file" class="form-control-file" name="image5"
									title="장소5 이미지" id="File1">
							</div>
						</div>

						<div class="form-group row">
							<div class="col-sm-10">
								<input type="button" value="저장" onclick="sendData(this.form)">
								<input type="reset" value="초기화"> 
								<input type="button" value="목록보기"
									onclick="javascript:location.href='${pageContext.request.contextPath }/controller3?type=themeTravel'">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 푸터 -->
	<%@ include file="../jspf/footer.jspf"%>
</body>
</html>