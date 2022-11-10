package com.mystudy.info.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.dao.planDAO;

public class PlanDeleteCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tripnum = Integer.parseInt(request.getParameter("tripnum"));
		
		planDAO.planDelete(tripnum);
		
		//화면 전환(목록페이지로 이동 - 첫페이지로 가기)
		return "controller4?type=planlist";
	}
}
