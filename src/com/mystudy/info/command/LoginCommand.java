package com.mystudy.info.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.info.dao.loginDAO;
import com.mystudy.info.vo.MasterVO;
import com.mystudy.info.vo.MemberVO;

public class LoginCommand implements Command{
	
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("입력된 id : " + id + ", 입력된 비밀번호 : " + pwd);
		int check = 0;
		MemberVO ch = null;
		MasterVO ch2 = null;
		if("admin".equalsIgnoreCase(id)) {
			ch2 = loginDAO.MasterId(id);
			System.out.println(ch2.getPassword());
			if(!ch2.getPassword().equalsIgnoreCase(pwd)) {
				check = 1;
				System.out.println("비밀번호 오류");
				return "login.jsp?check="+check;
			} else {
				session.setAttribute("ch", ch2);	
				return "controller4?type=maingo";
			}
		} else {
			ch = loginDAO.loginId(id);			
		}
		
		if(ch==null){
			check = 1;
			System.out.println("아이디를 못찾음");
			return "login.jsp?check="+check;
		} else if(!ch.getPwd().equalsIgnoreCase(pwd)){
			check = 1;
			System.out.println("비밀번호 오류");
			return "login.jsp?check="+check; 
		}
		
		session.setAttribute("ch", ch);
			
		return "controller4?type=maingo";
	}
}
