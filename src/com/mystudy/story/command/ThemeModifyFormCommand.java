package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.ThemeDAO;
import com.mystudy.story.vo.ThemeVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ThemeModifyFormCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ThemeVO tvo = ThemeDAO.selectOneTheme(Integer.parseInt(request.getParameter("idx")));
		
		request.setAttribute("tvo", tvo);
		
		return "/theme/theme_modify.jsp";
	}

}
