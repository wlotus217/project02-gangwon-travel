package com.mystudy.trip.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.dao.DAO;
import com.mystudy.trip.vo.EducationVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class educationUploadCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		//파일 저장 위치
		String path = "c:/MyStudy/temp";
		
		MultipartRequest mr = new MultipartRequest (
				request, path, (30 * 1024 * 1024),
				"UTF-8", new DefaultFileRenamePolicy());
		
		//전달받은 데이터 처리
		EducationVO vo = new EducationVO();
		vo.setTitle(mr.getParameter("title"));
		
		//첨부파일 데이터 처리
		if (mr.getFile("fileName") != null) { //첨부파일 있으면
			vo.setOriName(mr.getOriginalFileName("fileName"));
			vo.setFileName(mr.getFilesystemName("fileName"));
		} else { //첨부파일 없으면
			vo.setOriName("");
			vo.setFileName("");
		}
		
		//DB에 입력(저장) 처리
		DAO.educationInsert(vo);
		
		return "education.jsp";
	}
}
