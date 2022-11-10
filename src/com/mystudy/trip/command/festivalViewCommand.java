package com.mystudy.trip.command;

import java.io.IOException;




import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.dao.DAO;
import com.mystudy.trip.vo.FestivalVO;

public class festivalViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNum = request.getParameter("boardNum");

		FestivalVO vo = DAO.festivalOne(boardNum);
		
		request.setAttribute("vo", vo);
			
		return "festivalView.jsp";
	}
}
