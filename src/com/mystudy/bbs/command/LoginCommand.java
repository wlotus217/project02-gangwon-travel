package com.mystudy.bbs.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.vo.MasterVO;
import com.mystudy.bbs.vo.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



public class LoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		int check = 0;
		MemberVO ch = null;
		MasterVO ch2 = null;
		if("admin".equalsIgnoreCase(id)) {
			ch2 = DAO.masterId(id);
			if(!ch2.getPwd().equalsIgnoreCase(pwd)) {
				check = 1;
				System.out.println("비밀번호 오류");
				return "login.jsp?check="+check;
			} else {
				session.setAttribute("ch", ch2);	
				
				return "mainb.jsp";
			}
		} else {
			ch = DAO.loginId(id);			
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
			
		return "mainb.jsp";
	}
}
