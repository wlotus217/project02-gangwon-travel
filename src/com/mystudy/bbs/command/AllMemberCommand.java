package com.mystudy.bbs.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.vo.MemberVO;
import com.mystudy.bbs.common.Paging_x;
import com.mystudy.bbs.dao.DAO;

public class AllMemberCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path;
		// 페이징 처리를 위한 객체(Paging) 생성
		Paging_x p = new Paging_x();

		// 1. 전체 게시물 수량 구하기
		p.setTotalRecord(DAO.getMemberTotalCount());
		p.setTotalPage();
		System.out.println("> 전체 회원 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());

		// 2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> current page : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());

		// 3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기

		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		// 3-1.(선택적) 끝번호(end)가 건수보다 많으면 데이터 건수와 동일하게 처리
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}

		System.out.println("> 시작번호 : " + p.getBegin());
		System.out.println("> 끝번호 : " + p.getEnd());

		// --------------- 블록(block) 계산하기 ---------------
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

		System.out.println("> beginPage : " + p.getBeginPage());
		System.out.println("> endPage : " + p.getEndPage());

		// ------------------------------
		// DB 데이터 가져오기
		// 시작번호(begin), 끝번호(end) 사용해서 게시글 조회
		List<MemberVO> list = DAO.memberPageList(p.getBegin(), p.getEnd());
		System.out.println(">> 현재페이지 글목록(list) : " + list);
		System.out.println(" ------------- ");

		// ===============================
		// EL, JSTL 사용을 위해 scope에 데이터 등록(page 영역)
		/* session.setAttribute("page", list); */
		request.setAttribute("list", list);
		request.setAttribute("pvo", p);
		// 1. DB연결하고 데이터 가져오기
		/*
		 * if (p.getNowPage() == 1) { List<BbsVO> vo = DAO.anList();
		 * System.out.print(vo); // 2.데이터를 응답할 페이지에 전달 request.setAttribute("vo", vo); }
		 */

		// 3. 페이지 전환 - 응답할 페이지(list.jsp)
		// request.getRequestDispatcher("list.jsp").forward(request, response);
		path = "allMember.jsp";

		return path;
	}

}
