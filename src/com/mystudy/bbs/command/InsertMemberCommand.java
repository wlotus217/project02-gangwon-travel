package com.mystudy.bbs.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.vo.MemberVO;

public class InsertMemberCommand implements Command {

	@SuppressWarnings("null")
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		System.out.println("> name : -" + id + "-");
		System.out.println("> name : -" + pwd + "-");
		
		//단순 페이지 전환인지 DB데이터 조회처리를 해야하는지 결정
		String path;
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setBirth(birth);
		vo.setAddress(address);
		vo.setPhone(phone);
		vo.setEmail(email);
		SqlSession ss = DBService.getFactory().openSession(true);
		int cnt = ss.insert("BBS.insertMember", vo);
		ss.commit(); //명시적 커밋 처리
		System.out.println(">>>> 입력건수 cnt : " + cnt);
		path = "login.jsp?check=3";
			
		
		return path;
	}

}
