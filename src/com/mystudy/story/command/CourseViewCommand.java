package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.CourseDAO;
import com.mystudy.story.vo.CourseVO;

public class CourseViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String cPage = request.getParameter("cPage");
		CourseVO cvo = CourseDAO.selectOneCourse(idx);
		String tDay = request.getParameter("tDay");
		
		
		
		request.setAttribute("cvo", cvo);
		request.setAttribute("tDay",tDay);
		request.setAttribute("cPage",cPage);
		
		return "course/course_view.jsp";
	}

}