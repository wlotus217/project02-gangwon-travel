package com.mystudy.bbs.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.CheckProVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CheckProListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		//파일 저장 위치
		String path = "c:/MyStudy/temp";
		
		MultipartRequest mr = new MultipartRequest (
				request, path, (10 * 1024 * 1024),
				"UTF-8", new DefaultFileRenamePolicy());
		
		//전달받은 데이터 처리
		CheckProVO vo = new CheckProVO();
		vo.setName(mr.getParameter("name"));
		vo.setPhone(mr.getParameter("phone"));
		vo.setAddress(mr.getParameter("address"));
		vo.setTitle(mr.getParameter("title"));
		vo.setNote(mr.getParameter("note"));
		
		System.out.println(">> vo : " + vo);
		
		//DB에 입력(저장) 처리
		int cnt = DAO.deliveryInsert(vo);
		System.out.println(">>>입력건수 : " + cnt);
			
		return "controller?type=proList";
	}
}
