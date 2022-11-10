<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String boardNum = request.getParameter("boardNum");
    String title = request.getParameter("title");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제화면</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
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
						<div class="contsArea skinContainer ">
							<div>
								<h2>게시글 삭제화면</h2>
								<hr>
								<p>
									<a href="controller?type=newsList">[삭제취소(목록으로 이동)]</a>
								</p>
								<form action="controller?type=newsDeleteList" method="post">
									<table>
										<tr>
											<th>글번호</th>
											<td><input type="text" name="boardNum"
												value="<%=boardNum %>" readonly="readonly"></td>
										</tr>
										<tr>
											<th>삭제 게시글 제목</th>
											<td><input type="text" name="title" value="<%=title %>"
												readonly="readonly"></td>
										</tr>
										<tr>
											<th>비밀번호를 입력해 주세요.</th>
											<td><input type="text" name="pwd"> <input
												type="submit" value="삭 제"></td>
										</tr>
									</table>
								</form>
							</div>
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