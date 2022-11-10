package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.common.PageSet;
import com.mystudy.story.common.Paging;
import com.mystudy.story.dao.ReviewDAO;
import com.mystudy.story.vo.ReviewVO;
import com.mystudy.story.vo.ThemeVO;

public class ReviewTravelCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cPage = request.getParameter("cPage");
		
		PageSet p = new PageSet();
		System.out.println("나는 바보다");
		System.out.println(cPage);
		List<ReviewVO> list = p.pageSetReview(cPage);
		Paging pvo = p.getP();
	
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);

		
		return "review/reviewTravel.jsp";
	}

}
