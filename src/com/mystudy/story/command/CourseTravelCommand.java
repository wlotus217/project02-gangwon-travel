package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.common.PageSet;
import com.mystudy.story.common.Paging;
import com.mystudy.story.dao.CourseDAO;
import com.mystudy.story.vo.CourseVO;
import com.mystudy.story.vo.ReviewVO;

public class CourseTravelCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cPage = request.getParameter("cPage");

		PageSet p = new PageSet();
		List<CourseVO> list = p.pageSetCourse(cPage);
		Paging pvo = p.getP();
		
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);

		
		return "course/courseTravel.jsp";
	}

}
