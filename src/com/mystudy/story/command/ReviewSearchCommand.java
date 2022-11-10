package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.common.Paging;
import com.mystudy.story.common.SearchPageSet;
import com.mystudy.story.dao.ReviewDAO;
import com.mystudy.story.vo.ReviewVO;
import com.mystudy.story.vo.ThemeVO;

public class ReviewSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String searchKeyword = request.getParameter("searchKeyword");
		
		String cPage = request.getParameter("cPage");
		
		SearchPageSet p = new SearchPageSet();
		
		List<ReviewVO> list = p.SearchPageSetReview(cPage, search, searchKeyword);
		Paging pvo = p.getP();
		System.out.println(pvo);
		
		request.setAttribute("list", list);
		request.setAttribute("search", search);
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("pvo", pvo);
		
		return "/review/review_searchList.jsp";
	}

}
