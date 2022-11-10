<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정화면</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<style>
</style>

<script>
	function sendData() {
		let firstForm = document.forms[0];
		for (let i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 4)
					continue;
				alert(firstForm.elements[i].title + "을(를) 입력하세요.");
				firstForm.elements[i].value = "";
				firstForm.elements[i].focus();
				return;
			}
		}
		let pwd1 = firstForm.pwd.value;
		let pwd2 = "${vo.pwd}";

		if (pwd1 !== pwd2) {
			alert("[암호 불일치] 암호를 확인하세요.");
			firstForm.pwd.value = "";
			firstForm.pwd.focus();
			return false;
		}
		firstForm.submit();
	}

	function main_go() {
		location.href = "controller?type=proList";
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
							<form action="controller?type=modifyList" method="post"
								enctype="multipart/form-data">
								<table>
									<tbody>
										<tr>
											<th>게시글 번호</th>
											<td><input type="text" name="boardNum" title="게시글 번호"
												value="${vo.getBoardNum() }" readonly="readonly"></td>
										</tr>
										<tr>
											<th>제목</th>
											<td><input type="text" name="title" title="제목">
											</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td><input type="text" name="id" title="작성자"
												value="${vo.getId() }" readonly></td>
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
											<th>암호</th>
											<td><input type="password" name="pwd" title="암호">
											</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<td colspan="2"><input type="button" value="저장"
												onclick="sendData()"> <input type="reset"
												value="초기화"> <input type="button" value="목록보기"
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