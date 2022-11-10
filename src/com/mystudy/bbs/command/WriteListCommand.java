package com.mystudy.bbs.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.BbsVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		//파일 저장 위치
		String path = "c:/MyStudy/temp";
		/* System.out.println(request.getContentType()); */
		MultipartRequest mr = new MultipartRequest (
				request, path, (30 * 1024 * 1024),
				"UTF-8", new DefaultFileRenamePolicy());
		
		//전달받은 데이터 처리
		BbsVO vo = new BbsVO();
		vo.setTitle(mr.getParameter("title"));
		vo.setId(mr.getParameter("id"));
		vo.setContent(mr.getParameter("content"));
		vo.setPwd(mr.getParameter("pwd"));
		vo.setOriName(mr.getParameter("oriName"));
		
		
		
		//첨부파일 데이터 처리
		if (mr.getFile("fileName") != null) { //첨부파일 있으면
			vo.setFileName(mr.getOriginalFileName("fileName"));
			
		} else { //첨부파일 없으면
			vo.setFileName("");
		}
		System.out.println(">> vo : " + vo);
		
		//DB에 입력(저장) 처리
		DAO.proInsert(vo);
			
		return "controller?type=proList";
	}
}
