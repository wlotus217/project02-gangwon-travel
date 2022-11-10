<%@page import="com.mystudy.bbs.mybatis.DBService"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습)전달받은 데이터(암호)와 DB 저장 암호 일치여부 확인 후 처리 
	비교값 : 전달받은 pwd 파라미터 값과 session의 pwd 값 비교
	- 일치하면 : DB 데이터 삭제 후 목록페이지로 이동
	- 불일치면 : 이전페이지(삭제화면)로 이동
--%>
<%
	request.setCharacterEncoding("UTF-8");

	String boardNum = request.getParameter("boardNum");
	String pwd = request.getParameter("pwd");
	
	BbsVO vo = DAO.ebookSelectOne(boardNum);
	
	if (vo.getPwd().equalsIgnoreCase(pwd)) {
		SqlSession ss = DBService.getFactory().openSession();
		try {
			int cnt = ss.delete("BBS.ebookDelete", vo.getBoardNum());
			ss.commit(); //명시적 커밋 처리
			System.out.println(">>>> 삭제건수 cnt : " + cnt);
			
%>
			<script>
				alert("[완료]");
				location.href = "e_bookMain.jsp";
			</script>
<%
		} catch (Exception e) {
			ss.rollback();
			e.printStackTrace();
%>
			<script>
				alert("[예외발생] 목록페이지로 이동");
				location.href = "04delete.jsp";
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