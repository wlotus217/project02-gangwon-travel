package com.mystudy.bbs.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.vo.MemberVO;

public class FindPasswordCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		
		System.out.println(name);
		System.out.println(id);
		
		MemberVO ch = DAO.findPassword(id);
		if(ch==null){
			return "searchPassword.jsp?check=1";
		} else if(!ch.getName().equalsIgnoreCase(name)){
			return "searchPassword.jsp?check=1";
		} else if(!ch.getPhone().equalsIgnoreCase(phone)){
			return "searchPassword.jsp?check=1";
		} else {
			request.setAttribute("findPassword", ch.getPwd());
		}
		return "searchPassword_ok.jsp";
			
		
	}
}
