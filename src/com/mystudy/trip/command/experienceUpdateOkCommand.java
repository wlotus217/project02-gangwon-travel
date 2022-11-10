package com.mystudy.trip.command;

import java.io.IOException;




import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.dao.DAO;
import com.mystudy.trip.vo.ExperienceVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class experienceUpdateOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		//파일 저장 위치
		String path = "c:/MyStudy/temp";
		
		MultipartRequest mr = new MultipartRequest (
				request, path, (10 * 1024 * 1024),
				"UTF-8", new DefaultFileRenamePolicy());
		
		//전달받은 데이터 처리
		String boardNum = request.getParameter("boardNum");
		
		ExperienceVO vo = DAO.experienceOne(boardNum);
		vo.setTitle(mr.getParameter("title"));
		vo.setContain(mr.getParameter("contain"));
		vo.setAddress(mr.getParameter("address"));
		vo.setPay(mr.getParameter("pay"));
		vo.setPhone(mr.getParameter("phone"));
		vo.setTime(mr.getParameter("time"));
		
		//첨부파일 데이터 처리
		if (mr.getFile("fileName") != null) { //첨부파일 있으면
			vo.setFileName(mr.getOriginalFileName("fileName"));
			vo.setViewName1(mr.getOriginalFileName("viewName1"));
			vo.setViewName2(mr.getOriginalFileName("viewName2"));
			vo.setViewName3(mr.getOriginalFileName("viewName3"));
		} else { //첨부파일 없으면
			vo.setFileName("");
			vo.setViewName1("");
			vo.setViewName2("");
			vo.setViewName3("");
		}
		
		//DB에 입력(저장) 처리
		DAO.experienceUpdate(vo);
			
		return "controller2?type=experienceList";
	}
}
