package com.mystudy.bbs.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.BbsVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Modify2Command implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNum = request.getParameter("boardNum");
		BbsVO vo = DAO.proSelectOne(boardNum);
			if(vo==null){
				System.out.print("글번호가 잘 못 입력되었습니다.");
				return "03modify.jsp";
			}
		request.setAttribute("vo", vo);
		return "03-2modify.jsp";
	}
}
