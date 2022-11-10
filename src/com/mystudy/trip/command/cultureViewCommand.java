package com.mystudy.trip.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.dao.DAO;
import com.mystudy.trip.vo.CultureVO;

public class cultureViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNum = request.getParameter("boardNum");

		CultureVO vo = DAO.cultureOne(boardNum);
		
		request.setAttribute("vo", vo);
			
		return "cultureView.jsp";
	}
}
