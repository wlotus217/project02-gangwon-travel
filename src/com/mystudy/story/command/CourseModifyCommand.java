package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.CourseDAO;
import com.mystudy.story.vo.CourseVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CourseModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// 파일 저장 위치
		String path = "c:/MyStudy/temp";
		
		MultipartRequest mr = new MultipartRequest(
						request, path, (10 *1024 * 1024) // 10Mb
						, "UTF-8", new DefaultFileRenamePolicy()
				);
		
		// 전달받은 데이터 처리
		CourseVO cvo = new CourseVO();
		cvo.setIdx(Integer.parseInt(mr.getParameter("idx")));
		cvo.setTitle(mr.getParameter("title")); 
		cvo.setIntro(mr.getParameter("intro"));
		cvo.settDay(mr.getParameter("tDay"));
		cvo.setDay1(mr.getParameter("day1"));
		cvo.setDay2(mr.getParameter("day2"));
		cvo.setDay3(mr.getParameter("day3"));
				
		// 첨부파일 데이터 처리
		if (mr.getFile("image") != null) { //첨부파일 있으면
			cvo.setImage(mr.getOriginalFileName("image"));
		} else { //첨부파일 없으면
			cvo.setImage("");
		}
		
		// DB에 입력(저장) 처리
		int result = CourseDAO.updateCourse(cvo);
		System.out.println("update결과" + result);
		System.out.println(cvo);
		
		
		// 화면 전환(목록페이지로 이동 - 첫페이지로 가기)
		//response.sendRedirect("themeTravel.jsp");
		return "/controller3?type=courseTravel";
	}

}
