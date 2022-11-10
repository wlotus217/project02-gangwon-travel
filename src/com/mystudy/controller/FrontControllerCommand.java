package com.mystudy.controller;

import java.io.IOException;





import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.command.Command;
import com.mystudy.trip.command.cultureDeleteCommand;
import com.mystudy.trip.command.cultureListCommand;
import com.mystudy.trip.command.cultureSearchCommand;
import com.mystudy.trip.command.cultureUpdateCommand;
import com.mystudy.trip.command.cultureUpdateOkCommand;
import com.mystudy.trip.command.cultureUploadCommand;
import com.mystudy.trip.command.cultureViewCommand;
import com.mystudy.trip.command.educationDeleteCommand;
import com.mystudy.trip.command.educationDownCommand;
import com.mystudy.trip.command.educationListCommand;
import com.mystudy.trip.command.educationUploadCommand;
import com.mystudy.trip.command.experienceDeleteCommand;
import com.mystudy.trip.command.experienceListCommand;
import com.mystudy.trip.command.experienceSearchCommand;
import com.mystudy.trip.command.experienceUpdateCommand;
import com.mystudy.trip.command.experienceUpdateOkCommand;
import com.mystudy.trip.command.experienceUploadCommand;
import com.mystudy.trip.command.experienceViewCommand;
import com.mystudy.trip.command.festivalDeleteCommand;
import com.mystudy.trip.command.festivalListCommand;
import com.mystudy.trip.command.festivalUpdateCommand;
import com.mystudy.trip.command.festivalUpdateOkCommand;
import com.mystudy.trip.command.festivalUploadCommand;
import com.mystudy.trip.command.festivalViewCommand;
import com.mystudy.trip.command.hiddenDeleteCommand;
import com.mystudy.trip.command.hiddenListCommand;
import com.mystudy.trip.command.hiddenSearchCommand;
import com.mystudy.trip.command.hiddenUpdateCommand;
import com.mystudy.trip.command.hiddenUpdateOkCommand;
import com.mystudy.trip.command.hiddenViewCommand;
import com.mystudy.trip.command.hiddenWriteCommand;
import com.mystudy.trip.command.natureDeleteCommand;
import com.mystudy.trip.command.natureListCommand;
import com.mystudy.trip.command.natureSearchCommand;
import com.mystudy.trip.command.natureUpdateCommand;
import com.mystudy.trip.command.natureUpdateOkCommand;
import com.mystudy.trip.command.natureUploadCommand;
import com.mystudy.trip.command.natureViewCommand;


@WebServlet("/controller2")
public class FrontControllerCommand extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		Command command = null;
		if ("natureUpload".equals(type)) {
			command = new natureUploadCommand();
		} else if ("cultureUpload".equals(type)) {
			command = new cultureUploadCommand();
		} else if ("natureView".equals(type)) {
			command = new natureViewCommand();
		} else if ("cultureView".equals(type)) {
			command = new cultureViewCommand();
		} else if ("experienceUpload".equals(type)) {
			command = new experienceUploadCommand();
		} else if ("experienceView".equals(type)) {
			command = new experienceViewCommand();
		} else if ("festivalUpload".equals(type)) {
			command = new festivalUploadCommand();
		} else if ("festivalView".equals(type)) {
			command = new festivalViewCommand();
		} else if ("educationUpload".equals(type)) {
			command = new educationUploadCommand();
		} else if ("cultureDelete".equals(type)) {
			command = new cultureDeleteCommand();
		} else if ("experienceDelete".equals(type)) {
			command = new experienceDeleteCommand();
		} else if ("natureDelete".equals(type)) {
			command = new natureDeleteCommand();
		} else if ("festivalDelete".equals(type)) {
			command = new festivalDeleteCommand();
		} else if ("educationUpload".equals(type)) {
			command = new educationUploadCommand();
		}  else if ("educationDown".equals(type)) {
			command = new educationDownCommand();
		} else if ("cultureUpdate".equals(type)) {
			command = new cultureUpdateCommand();
		} else if ("cultureUpdateOk".equals(type)) {
			command = new cultureUpdateOkCommand();
		} else if ("experienceUpdate".equals(type)) {
			command = new experienceUpdateCommand();
		} else if ("experienceUpdateOk".equals(type)) {
			command = new experienceUpdateOkCommand();
		} else if ("natureUpdate".equals(type)) {
			command = new natureUpdateCommand();
		} else if ("natureUpdateOk".equals(type)) {
			command = new natureUpdateOkCommand();
		} else if ("festivalUpdate".equals(type)) {
			command = new festivalUpdateCommand();
		} else if ("festivalUpdateOk".equals(type)) {
			command = new festivalUpdateOkCommand();
		} else if ("educationDelete".equals(type)) {
			command = new educationDeleteCommand();
		} else if ("educationUpload".equals(type)) {
			command = new educationUploadCommand();
		} else if ("hiddenWrite".equals(type)) {
			command = new hiddenWriteCommand();
		} else if ("hiddenDelete".equals(type)) {
			command = new hiddenDeleteCommand();
		} else if ("hiddenView".equals(type)) {
			command = new hiddenViewCommand();
		} else if ("hiddenUpdate".equals(type)) {
			command = new hiddenUpdateCommand();
		} else if ("hiddenUpdateOk".equals(type)) {
			command = new hiddenUpdateOkCommand();
		} else if ("cultureSearch".equals(type)) {
			command = new cultureSearchCommand();
		} else if ("natureSearch".equals(type)) {
			command = new natureSearchCommand();
		} else if ("experienceSearch".equals(type)) {
			command = new experienceSearchCommand();
		} else if ("hiddenSearch".equals(type)) {
			command = new hiddenSearchCommand();
		} else if ("natureList".equals(type)) {
			command = new natureListCommand();
		} else if ("cultureList".equals(type)) {
			command = new cultureListCommand();
		} else if ("experienceList".equals(type)) {
			command = new experienceListCommand();
		} else if ("festivalList".equals(type)) {
			command = new festivalListCommand();
		} else if ("hiddenList".equals(type)) {
			command = new hiddenListCommand();
		} else if ("educationList".equals(type)) {
			command = new educationListCommand();
		} 
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}