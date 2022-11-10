package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.mystudy.story.dao.ReviewDAO;
import com.mystudy.story.vo.ReviewVO;
import com.mystudy.zzim.dao.ZzimDAO;

public class ReviewViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String cPage = request.getParameter("cPage");
		ReviewVO rvo = ReviewDAO.selectOneReview(idx);
		String search = request.getParameter("search");
		String searchKeyword = request.getParameter("searchKeyword");
		String boardName = request.getParameter("boardName");
		int zzimCount = ZzimDAO.zzimCountPost(boardName, request.getParameter("idx"));
		System.out.println(zzimCount);
		
		request.setAttribute("rvo", rvo);
		request.setAttribute("search", search);
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("cPage", cPage);
		request.setAttribute("zzimCount", zzimCount);
		return "review/review_view.jsp";
	}

}