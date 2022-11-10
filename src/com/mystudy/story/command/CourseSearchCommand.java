package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.common.Paging;
import com.mystudy.story.common.SearchPageSet;
import com.mystudy.story.dao.CourseDAO;
import com.mystudy.story.vo.CourseVO;
import com.mystudy.story.vo.ThemeVO;

public class CourseSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tDay = request.getParameter("tDay");
		
		String cPage = request.getParameter("cPage");
		
		SearchPageSet p = new SearchPageSet();
		
		List<CourseVO> list = p.SearchPageSetCourse(cPage, tDay);
		Paging pvo = p.getP();
		
		
		
		request.setAttribute("list", list);
		request.setAttribute("tDay", tDay);
		request.setAttribute("pvo", pvo);
		request.setAttribute("cPage", cPage);
		
		return "/course/course_searchList.jsp";
	}

}