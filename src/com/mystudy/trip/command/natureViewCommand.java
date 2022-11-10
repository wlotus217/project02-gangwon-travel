package com.mystudy.trip.command;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.dao.DAO;
import com.mystudy.trip.vo.NatureVO;

public class natureViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String boardNum = request.getParameter("boardNum");

		NatureVO vo = DAO.natureOne(boardNum);
		
		request.setAttribute("vo", vo);
			
		return "natureView.jsp";
	}
}
