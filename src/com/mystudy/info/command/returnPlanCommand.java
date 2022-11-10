package com.mystudy.info.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.dao.planDAO;
import com.mystudy.info.vo.planVO;

public class returnPlanCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "controller4?type=planlist";
	}
}
