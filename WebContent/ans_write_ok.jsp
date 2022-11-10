<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="com.mystudy.bbs.vo.CommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

	//전달받은 데이터 처리
	CommentVO cvo = new CommentVO();
	cvo.setWriter(request.getParameter("writer"));
	cvo.setContent(request.getParameter("content"));
	cvo.setPwd(request.getParameter("pwd"));
	cvo.setBbsIdx(request.getParameter("bbsIdx"));
	
	System.out.println("cvo : " + cvo);
	
	//DB에 입력 처리
	DAO.insertComm(cvo);
	
	//화면 전환 - onelist로 가야함 -> 미완성
	response.sendRedirect("list.jsp");
%>