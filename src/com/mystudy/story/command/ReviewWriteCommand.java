package com.mystudy.story.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mystudy.story.dao.ReviewDAO;
import com.mystudy.story.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class ReviewWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//파일 저장 위치
		
		String path = "c:/MyStudy/temp";
		
		MultipartRequest mr = new MultipartRequest(
								request, path, (10 * 1024 * 1024),
								"UTF-8", new DefaultFileRenamePolicy());
		
		ReviewVO rvo = new ReviewVO();
		rvo.setId(mr.getParameter("id"));
		rvo.setTitle(mr.getParameter("title"));
		//rvo.setContent(mr.getParameter("content"));
		String content = mr.getParameter("content");
		rvo.setContent(content.replace("\r\n","<br>"));
		System.out.println("br 처리 변경");
		
		//첨부파일 데이터 처리
		if (mr.getFile("image1") != null) { //첨부파일 있으면
			rvo.setImage1(mr.getOriginalFileName("image1"));
		} else { //첨부파일 없으면
			rvo.setImage1("");
		}
		if (mr.getFile("image2") != null) { //첨부파일 있으면
			rvo.setImage2(mr.getOriginalFileName("image2"));
		} else { //첨부파일 없으면
			rvo.setImage2("");
		}
		if (mr.getFile("image3") != null) { //첨부파일 있으면
			rvo.setImage3(mr.getOriginalFileName("image3"));
		} else { //첨부파일 없으면
			rvo.setImage3("");
		}
		ReviewDAO.insertReview(rvo);
		
		
		
		return "/controller3?type=reviewTravel";
		
		
		
		
	
	}

}