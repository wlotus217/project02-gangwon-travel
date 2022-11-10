package com.mystudy.info.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.dao.contestDAO;

public class ContestDeleteCommand implements Command {
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int picNum = Integer.parseInt(request.getParameter("picNum"));
		
		contestDAO.contestDelete(picNum);
		
		//화면 전환(목록페이지로 이동 - 첫페이지로 가기)
		return "controller4?type=contestlist";
	}
}
