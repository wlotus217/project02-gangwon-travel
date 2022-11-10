package com.mystudy.story.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.story.command.Command;
import com.mystudy.story.command.CourseDeleteCommand;
import com.mystudy.story.command.CourseModifyCommand;
import com.mystudy.story.command.CourseModifyFormCommand;
import com.mystudy.story.command.CourseSearchCommand;
import com.mystudy.story.command.CourseTravelCommand;
import com.mystudy.story.command.CourseViewCommand;
import com.mystudy.story.command.CourseWriteCommand;
import com.mystudy.story.command.HitTravelCommand;
import com.mystudy.story.command.ReviewDeleteCommand;
import com.mystudy.story.command.ReviewModifyCommand;
import com.mystudy.story.command.ReviewModifyFormCommand;
import com.mystudy.story.command.ReviewSearchCommand;
import com.mystudy.story.command.ReviewTravelCommand;
import com.mystudy.story.command.ReviewViewCommand;
import com.mystudy.story.command.ReviewWriteCommand;
import com.mystudy.story.command.ThemeTravelCommand;
import com.mystudy.story.command.ThemeDeleteCommand;
import com.mystudy.story.command.ThemeModifyCommand;
import com.mystudy.story.command.ThemeModifyFormCommand;
import com.mystudy.story.command.ThemeSearchCommand;
import com.mystudy.story.command.ThemeViewCommand;
import com.mystudy.story.command.ThemeWriteCommand;
import com.mystudy.story.command.ZzimAddCommand;
import com.mystudy.story.command.ZzimDeleteCommand;
import com.mystudy.story.command.ZzimViewCommand;

@WebServlet("/controller3")
public class FrontControllerCommand extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행-------------");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);
	
		Command command = null;
		if ("themeTravel".equals(type)) {      //테마여행
			command = new ThemeTravelCommand();
		} else if ("themeWrite".equals(type)) {
			command = new ThemeWriteCommand();
		} else if ("themeView".equals(type)) {
			command = new ThemeViewCommand();
		} else if ("themeDelete".equals(type)) {
			command = new ThemeDeleteCommand();
		} else if ("themeModifyForm".equals(type)) {
			command = new ThemeModifyFormCommand();
		} else if ("themeModify".equals(type)) {
			command = new ThemeModifyCommand();
		} else if ("themeSearch".equals(type)) {
			command = new ThemeSearchCommand();
		} else if ("courseTravel".equals(type)) {   //추천여행코스
			command = new CourseTravelCommand();
		} else if ("courseWrite".equals(type)) {
			command = new CourseWriteCommand();
		} else if ("courseView".equals(type)) {
			command = new CourseViewCommand();
		} else if ("courseDelete".equals(type)) {
			command = new CourseDeleteCommand();
		} else if ("courseModifyForm".equals(type)) {
			command = new CourseModifyFormCommand();
		} else if ("courseModify".equals(type)) {
			command = new CourseModifyCommand();
		} else if ("courseSearch".equals(type)) {
			command = new CourseSearchCommand();
		} else if ("reviewTravel".equals(type)) {	//여행후기
			command = new ReviewTravelCommand();
		} else if ("reviewWrite".equals(type)) {
			command = new ReviewWriteCommand();
		} else if ("reviewView".equals(type)) {
			command = new ReviewViewCommand();
		} else if ("reviewDelete".equals(type)) {
			command = new ReviewDeleteCommand();
		} else if ("reviewModifyForm".equals(type)) {
			command = new ReviewModifyFormCommand();
		} else if ("reviewModify".equals(type)) {
			command = new ReviewModifyCommand();
		} else if ("reviewSearch".equals(type)) {
			command = new ReviewSearchCommand();
		} else if ("zzimAdd".equals(type)) { //찜 추가
			command = new ZzimAddCommand();
		} else if ("zzimView".equals(type)) { 
			command = new ZzimViewCommand();
		} else if ("zzimDelete".equals(type)) { 
			command = new ZzimDeleteCommand();
		} else if ("hitTravle".equals(type)) { 
			command = new HitTravelCommand();
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