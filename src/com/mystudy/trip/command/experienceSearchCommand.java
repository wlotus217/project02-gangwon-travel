package com.mystudy.trip.command;

import java.io.IOException;


import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.trip.common.Paging;
import com.mystudy.trip.dao.DAO;
import com.mystudy.trip.vo.ExperienceVO;

public class experienceSearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String search = request.getParameter("search");
		String searchKeyword = request.getParameter("searchKeyword");

		// 페이징 처리를 위한 객체(Paging) 생성
		Paging p = new Paging();

		// 1. 전체 게시물 수량 구하기
		p.setTotalRecord(DAO.experienceSearchTotalCount(search, searchKeyword));
		p.setTotalPage();

		// 2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}

		// ----------- 블록(block) 계산하기 --------------
		// 4. 블록 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getNumPerBlock() * p.getNumPerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getNumPerBlock() - 1);

		// 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}

		// ============================================
		// DB 데이터 가져오기
		// 시작번호(begin), 끝번호(end) 사용해서 게시글 조회
		List<ExperienceVO> searchList = DAO.experienceSearchList(String.valueOf(p.getBegin()), String.valueOf(p.getEnd()),
				search, searchKeyword);

		// ============================================
		// EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
		request.setAttribute("searchList", searchList);
		request.setAttribute("pvo", p);
		request.setAttribute("search", search);
		request.setAttribute("searchKeyword", searchKeyword);

		return "experienceSearch.jsp";
	}
}