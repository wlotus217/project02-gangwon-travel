<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--전달받은 데이터 값을 DB에 저장하고 list.jsp 이동 --%>
<%
	request.setCharacterEncoding("UTF-8");

	//파일 저장 위치
	String path = "c:/MyStudy/temp";
	System.out.println(request.getContentType());
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024),
			"UTF-8", new DefaultFileRenamePolicy());
	
	//전달받은 데이터 처리
	BbsVO bvo = new BbsVO();
	bvo.setTitle(mr.getParameter("title"));
	bvo.setId(mr.getParameter("id"));
	bvo.setContent(mr.getParameter("content"));
	bvo.setPwd(mr.getParameter("pwd"));
	
	
	//첨부파일 데이터 처리
	if (mr.getFile("fileName") != null) { //첨부파일 있으면
		bvo.setFileName(mr.getFilesystemName("fileName"));
		/* bvo.setOriName(mr.getOriginalFileName("oriName")); */
	} else { //첨부파일 없으면
		bvo.setFileName("");
		/* bvo.setOriName(""); */
	}
	System.out.println(">> bvo : " + bvo);
	
	//DB에 입력 처리
	DAO.ebookInsert(bvo);
	
	//화면 전환(목록페이지로 이동 - 첫페이지로 가기)
	response.sendRedirect("controller?type=ebookList");
%>





