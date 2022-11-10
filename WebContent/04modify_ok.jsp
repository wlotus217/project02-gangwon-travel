<%@page import="com.mystudy.bbs.dao.DAO"%>
<%@page import="com.mystudy.bbs.vo.BbsVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//파일 저장 위치
	String path = "c:/MyStudy/temp";
	
	MultipartRequest mr = new MultipartRequest(
			request, path, (10 * 1024 * 1024),
			"UTF-8", new DefaultFileRenamePolicy());
	
	//전달받은 데이터 처리
	BbsVO bvo = new BbsVO();
	bvo.setBoardNum(mr.getParameter("boardNum"));
	bvo.setTitle(mr.getParameter("title"));
	bvo.setContent(mr.getParameter("content"));
	
	//첨부파일 데이터 처리
	if (mr.getFile("fileName") != null) { //첨부파일 있으면
		bvo.setFileName(mr.getFilesystemName("fileName"));
		bvo.setOriName(mr.getOriginalFileName("fileName"));
	} else { //첨부파일 없으면
		bvo.setFileName("");
		bvo.setOriName("");
	}
	System.out.println(">> bvo : " + bvo);
	
	//DB에 수정 처리
	DAO.eBookUpdate(bvo);
	
	//화면 전환(목록페이지로 이동 - 첫페이지로 가기)
	response.sendRedirect("e_bookMain.jsp");
%>