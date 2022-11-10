package com.mystudy.story.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.dao.ReviewDAO;
import com.mystudy.story.vo.ReviewVO;

public class ReviewDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		ReviewDAO.deleteReview(idx);
		
		return "/controller3?type=reviewTravel";
	}

}
