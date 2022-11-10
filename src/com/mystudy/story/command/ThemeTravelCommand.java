package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.common.PageSet;
import com.mystudy.story.common.Paging;
import com.mystudy.story.dao.ThemeDAO;
import com.mystudy.story.vo.ThemeVO;

public class ThemeTravelCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cPage = request.getParameter("cPage");
		
		PageSet p = new PageSet();
		List<ThemeVO> list = p.pageSetTheme(cPage);
		Paging pvo = p.getP();
	
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);

		
		return "/theme/themeTravel.jsp";
	}

}
