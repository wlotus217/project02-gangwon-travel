package com.mystudy.trip.command;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.dao.DAO;
import com.mystudy.trip.vo.HiddenVO;

public class hiddenViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNum = request.getParameter("boardNum");

		HiddenVO vo = DAO.hiddenOne(boardNum);
		DAO.hiddenhitUpdate(vo);
		
		request.setAttribute("vo", vo);
			
		return "hiddenView.jsp";
	}
}
