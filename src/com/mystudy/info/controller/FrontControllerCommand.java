package com.mystudy.info.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.command.CitytourGoCommand;
import com.mystudy.info.command.Command;
import com.mystudy.info.command.ContestDeleteCommand;
import com.mystudy.info.command.ContestInsertCommand;
import com.mystudy.info.command.ContestInsertFormCommand;
import com.mystudy.info.command.ContestModifyCommand;
import com.mystudy.info.command.ContestModifyFormCommand;
import com.mystudy.info.command.ContestlistCommand;
import com.mystudy.info.command.InfoListsearchCommand;
import com.mystudy.info.command.InfolistCommand;
import com.mystudy.info.command.ListsearchCommand;
import com.mystudy.info.command.LoginCommand;
import com.mystudy.info.command.LogoutCommand;
import com.mystudy.info.command.MainGoCommand;
import com.mystudy.info.command.PlanDeleteCommand;
import com.mystudy.info.command.PlanGoCommand;
import com.mystudy.info.command.PlanInsertCommand;
import com.mystudy.info.command.PlanListsearchCommand;
import com.mystudy.info.command.PlanModifyCommand;
import com.mystudy.info.command.PlanModifyFormCommand;
import com.mystudy.info.command.PlanlistCommand;
import com.mystudy.info.command.returnPlanCommand;

@WebServlet("/controller4")
public class FrontControllerCommand extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행-------------");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
	
		Command command = null;
		if ("contestlistsearch".equals(type)) {
			command = new ListsearchCommand();
		} else if ("insertplan".equals(type)) {
			command = new PlanInsertCommand();
		} else if ("returnplanlist".equals(type)) {
			command = new returnPlanCommand();
		} else if ("infotitlesearch".equals(type)) {
			command = new InfoListsearchCommand();
		} else if ("planlistsearch".equals(type)) {
			command = new PlanListsearchCommand();
		} else if ("plandelete".equals(type)) {
			command = new PlanDeleteCommand();
		} else if ("contestdelete".equals(type)) {
			command = new ContestDeleteCommand();
		} else if ("contestmodify".equals(type)) {
			command = new ContestModifyCommand();
		} else if ("contestmodifyForm".equals(type)) {
			command = new ContestModifyFormCommand();
		} else if ("contestinsertform".equals(type)) {
			command = new ContestInsertFormCommand();
		} else if ("contestinsert".equals(type)) {
			command = new ContestInsertCommand();
		} else if ("planmodify".equals(type)) {
			command = new PlanModifyCommand();
		} else if ("planmodifyForm".equals(type)) {
			command = new PlanModifyFormCommand();
		} else if ("planlist".equals(type)) {
			command = new PlanlistCommand();
		} else if ("contestlist".equals(type)) {
			command = new ContestlistCommand();
		} else if ("tripplan".equals(type)) {
			command = new PlanGoCommand();
		} else if ("citytour".equals(type)) {
			command = new CitytourGoCommand();
		} else if ("infolist".equals(type)) {
			command = new InfolistCommand();
		} else if ("login".equals(type)) {
			command = new LoginCommand();
		} else if ("logout".equals(type)) {
			command = new LogoutCommand();
		} else if ("maingo".equals(type)) {
			command = new MainGoCommand();
		}
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost() 실행-------------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
