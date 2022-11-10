package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.CourseDAO;
import com.mystudy.story.vo.CourseVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class CourseWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//파일 저장 위치
		
		String path = "c:/MyStudy/temp";
		
		MultipartRequest mr = new MultipartRequest(
								request, path, (10 * 1024 * 1024),
								"UTF-8", new DefaultFileRenamePolicy());
		
		CourseVO cvo = new CourseVO();
		cvo.setId(mr.getParameter("id"));
		cvo.setTitle(mr.getParameter("title"));
		cvo.setIntro(mr.getParameter("intro"));
		cvo.settDay(mr.getParameter("tDay"));
		cvo.setDay1(mr.getParameter("day1"));
		cvo.setDay2(mr.getParameter("day2"));
		cvo.setDay3(mr.getParameter("day3"));
		cvo.setPlaceName(mr.getParameter("placeName"));
		cvo.setPlaceLa(mr.getParameter("latitude"));
		cvo.setPlaceMa(mr.getParameter("longitude"));
		
		//첨부파일 데이터 처리
		if (mr.getFile("image") != null) { //첨부파일 있으면
			cvo.setImage(mr.getOriginalFileName("image"));
		} else { //첨부파일 없으면
			cvo.setImage("");
		}

		CourseDAO.insertCourse(cvo);
		
		
		
		return "/controller3?type=courseTravel";
		
		
		
		
	
	}

}
