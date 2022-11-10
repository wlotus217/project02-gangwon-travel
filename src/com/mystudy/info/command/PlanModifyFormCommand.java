package com.mystudy.info.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.dao.planDAO;
import com.mystudy.info.vo.planVO;

public class PlanModifyFormCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		planVO pvo = planDAO.selectOne(Integer.parseInt(request.getParameter("tripnum")));
		
		request.setAttribute("pvo", pvo);
		
		return "planmodify.jsp";
	}

}
