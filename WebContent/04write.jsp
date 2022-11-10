<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글작성</title>
<title>알림소식목록 | 강원관광 홈페이지 > 관광소식 > 알림소식</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script>
	function sendData() {
		let firstForm = document.forms[0];
		//alert("firstForm.elements.length : " + firstForm.elements.length);
		for (let i = 0; i < firstForm.elements.length; i++) {
			//console.log("firstForm.elements[" + i + "] : " + firstForm.elements[i]);
			console.log(firstForm.elements[i]);
			console.log(firstForm.elements[i].value);
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 3)
					continue; //첨부파일은 제외
				alert(firstForm.elements[i].title + "을(를) 입력하세요.");
				firstForm.elements[i].value = "";
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}

	function main_go() {
		location.href = "e_bookMain.jsp";
	}
</script>
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
					<h3>알림소식</h3>
				</div>


				<!-- 진짜 내용 -->
				<div class="row py-5 ">

					<div id="contents">
						<div class="title_box">
							<div class="btn_box">
								<a href="https://ko-kr.facebook.com/"
									onclick="toSNS('facebook')" class="facebook" title="새창열림">
									facebook에 공유하기 </a> <a
									href="https://accounts.kakao.com/login?continue=https://story.kakao.com/"
									onclick="toSNS('kakao')" class="cacao" title="새창열림"> kakao
									stroty에 공유하기 </a>
							</div>
						</div>

						<div id="bbs">
							<form action="04write_ok.jsp" method="post"
								enctype="multipart/form-data">
								<table>
									<tbody>
										<tr>
											<th>제목</th>
											<td><input type="text" name="title" title="제목">
											</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td><input type="text" name="id" title="작성자" value="관리자"
												readonly></td>
										</tr>
										<tr>
											<th>내용</th>
											<td><textarea name="content" rows="8" cols="50"
													title="내용"></textarea></td>
										</tr>
										<tr>
											<th>첨부파일</th>
											<td><input type="file" name="fileName"></td>
										</tr>
										<tr>
											<th>첨부파일 URL</th>
											<td><input type="text" name="oriName" value="kor">
											</td>
										</tr>
										<tr>
											<th>암호</th>
											<td><input type="password" name="pwd" title="암호">
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"><input type="button" value="저장"
												onclick="sendData()"> <input type="reset"
												value="초기화"> <input type="button" value="작성취소"
												onclick="main_go()"></td>
										</tr>
									</tfoot>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
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