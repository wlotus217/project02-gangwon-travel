package com.mystudy.trip.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.dao.DAO;

public class cultureDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		int boradNum = Integer.parseInt(request.getParameter("boardNum"));
		
		//DB에 입력(저장) 처리
		DAO.cultureDelete(boradNum);
			
		return "controller2?type=cultureList";
	}
}
