package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.common.PageSet;
import com.mystudy.story.common.Paging;
import com.mystudy.story.common.SearchPageSet;
import com.mystudy.story.dao.ThemeDAO;
import com.mystudy.story.vo.ThemeVO;

public class ThemeSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String searchKeyword = request.getParameter("searchKeyword");
		
		String cPage = request.getParameter("cPage");
				
		SearchPageSet p = new SearchPageSet();
		
		List<ThemeVO> list = p.SearchPageSetTheme(cPage, search, searchKeyword);
		Paging pvo = p.getP();
		System.out.println(pvo);
		
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("pvo", pvo);
		
		//System.out.println("-------theme_search---------");
		//System.out.println(list);
		//System.out.println("-------theme_search 끝---------");
		
		return "/theme/theme_searchList.jsp";
	}

}
