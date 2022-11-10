package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.ThemeDAO;
import com.mystudy.story.vo.ThemeVO;

public class ThemeViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String cPage = request.getParameter("cPage");
		ThemeVO tvo = ThemeDAO.selectOneTheme(idx);
		String search = request.getParameter("search");
		String searchKeyword = request.getParameter("searchKeyword");
		
		
		request.setAttribute("tvo", tvo);
		request.setAttribute("search", search);
		request.setAttribute("searchKeyword", searchKeyword);
		System.out.println(search);
		System.out.println(searchKeyword);
		request.setAttribute("cPage", cPage);
		
		return "theme/theme_view.jsp";
	}

}
