<%@page import="com.mystudy.bbs.mybatis.DBService"%>
<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.bbs.vo.CommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

	int commentIdx = Integer.parseInt(request.getParameter("commentIdx"));
	String pwd = request.getParameter("pwd");
	System.out.println("> commentIdx : " + commentIdx);
	System.out.println("> pwd : " + pwd);	
	System.out.println("================");

	CommentVO cvo = DAO.commOne(commentIdx);
	System.out.println("> cvo : " + cvo);
	session.setAttribute("cvo", cvo); 
	
	if (cvo.getPwd().equals(pwd)) {
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
	int cnt = ss.delete("BBS.deleteComm", cvo.getCommentIdx());
%>
			<script>
				alert("[완료] 목록페이지로 이동합니다.(미완)");
				location.href = "list.jsp";
			</script>
<%
		} catch (Exception e) {
			e.printStackTrace();
%>
			<script>
				alert("[예외발생] 목록페이지로 이동");
				location.href = "list.jsp";
			</script>
<%			
		} finally {
			ss.close();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호불일치</title>
<title>알림소식목록 | 강원관광 홈페이지 > 관광소식 > 알림소식</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script>
	alert("[실패] 암호를 확인하세요");
	history.back();
</script>
</head>
<body>

</body>
</html>