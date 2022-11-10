package com.mystudy.bbs.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.MemberVO;

public class UpdateMemberCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
	 	String id = request.getParameter("id");
	 	
	 	String name = request.getParameter("name");
	 	String pwd = request.getParameter("pwd");
	 	String address = request.getParameter("address");
	 	String phone = request.getParameter("phone");
	 	String email = request.getParameter("email");
	 	
		/* MemberVO vo = DAO.loginId(id); */
	 	MemberVO vo = new MemberVO();
	 	vo.setId(id);
	 	vo.setName(name);
	 	vo.setPwd(pwd);
	 	vo.setAddress(address);
	 	vo.setPhone(phone);
	 	vo.setEmail(email);
	 	
	 	
	 	DAO.updateMember(vo);
	 	MemberVO rvo = DAO.loginId(id);
	 	
	 	HttpSession session = request.getSession(true);
	 	session.setAttribute("ch", rvo);
	 	
		return "mypage.jsp";
	}

}