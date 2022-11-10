<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int check = Integer.parseInt(request.getParameter("check"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<style>
#wrap {
	margin: 0 auto;
}

#wrap hr {
	width: inherit;
	border: 1px solid navy;
}

#header, #nav {
	width: 700px;
	margin: 10px auto;
	text-align: center;
}

#header {
	font-size: 2em;
}

#nav {
	font-size: 1.3em;
}

#nav a {
	text-decoration: none;
}

#nav a:hover {
	text-decoration: underline;
	color: red;
}
</style>
</head>
<body>
	<%
	if (check == 1) {
	%>
	<script>
		alert("아이디 또는 비밀번호를 잘 못 입력하셨습니다. \n다시 입력해주세요");
	</script>
	<%
	} else if (check == 2) {
	%>
	<script>
		alert("로그아웃 되셨습니다.");
	</script>
	<%
	} else if (check == 3) {
	%>
	<script>
		alert("로그인창으로 이동합니다.");
	</script>
	<%
	} else if (check == 4) {
	%>
	<script>
		alert("정상적으로 삭제처리 되었습니다.");
	</script>
	<%
	}
	%>
	<!-- navbar -->
	<%@ include file="mypagemainnav3.jspf"%>

	<!-- content -->
	<div class="container">

		<div class="row">

			<!-- 사이드 내비 -->
			<%-- <%@ include file="../jspf/newsSidenav.jspf"%> --%>

			<!-- 내용 -->
			<div class="col-10">

				<!-- 페이지 제목 -->
				<div class="row p-3 border-bottom" style="margin-left: 200px">
					<h3 style="margin-left: 290px">강원관광</h3>
				</div>


				<!-- 진짜 내용 -->
				<div class="row py-5 ">
					<div class="container" style="margin-left: 450px">
						<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
							<div class="panel panel-success">
								<div class="panel-body">
									<form id="login-form" action="controller?type=login" method="post">
										<div>
											<input type="text" class="form-control" name="id"
												placeholder="ID" autofocus>
										</div>
										<div>
											<input type="password" class="form-control" name="pwd"
												placeholder="Password">
										<br>		
										</div>
										<div>
											<input type="submit" value="로그인" class="form-control btn btn-primary">
										</div>
										
									</form>
								</div>
							</div>
						</div>
					<br>
					<br>
					</div>
					<div id="contents" style="margin-left: 225px">
						<div id="wrap">
							<div id="nav">
								<a href="searchId.jsp?check=0">아이디 찾기</a> | <a
									href="searchPassword.jsp?check=0">비밀번호 찾기</a> | <a
									href="newMember.jsp">회원가입</a>
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