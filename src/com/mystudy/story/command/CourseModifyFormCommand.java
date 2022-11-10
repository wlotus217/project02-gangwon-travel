package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.CourseDAO;
import com.mystudy.story.vo.CourseVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CourseModifyFormCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CourseVO cvo = CourseDAO.selectOneCourse(Integer.parseInt(request.getParameter("idx")));
		
		request.setAttribute("cvo", cvo);
		
		return "/course/course_modify.jsp";
	}

}
