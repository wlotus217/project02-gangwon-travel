package com.mystudy.info.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.info.dao.contestDAO;
import com.mystudy.info.vo.contestVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ContestInsertCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "C:/MyStudy/60_web/Project02/WebContent/imgs";
		MultipartRequest mr = new MultipartRequest(
				request, //요청객체
				path, //실제 파일을 저장할 경로
				10 * 1024 * 1024, //업로드 파일의 최대크기 지정(byte 단위)
				"UTF-8", //인코딩 형식
				new DefaultFileRenamePolicy() //동일파일명 있으면 이름 자동 변경 처리
				);
		
		String picName = mr.getOriginalFileName("picName");
		String picTitle = mr.getParameter("picTitle");
		String picContent = mr.getParameter("picContent");
		
		contestVO cvo = new contestVO();
		cvo.setPicTitle(picTitle);
		cvo.setPicName(picName);
		cvo.setPicContent(picContent);
		
		//DB에 입력(저장) 처리
		contestDAO.contestinsert(cvo);
		
		//화면 전환(목록페이지로 이동 - 첫페이지로 가기)
		return "controller4?type=contestlist";
	}

}
