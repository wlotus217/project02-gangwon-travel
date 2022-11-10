package com.mystudy.bbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.bbs.command.AllMemberCommand;
import com.mystudy.bbs.command.CheckProCommand;
import com.mystudy.bbs.command.CheckProListCommand;
import com.mystudy.bbs.command.Command;
import com.mystudy.bbs.command.DeclareListCommand;
import com.mystudy.bbs.command.DeleteCommand;
import com.mystudy.bbs.command.DeleteListCommand;
import com.mystudy.bbs.command.DeleteMemberListCommand;
import com.mystudy.bbs.command.DetailCommand;
import com.mystudy.bbs.command.EbookListCommand;
import com.mystudy.bbs.command.FindIdCommand;
import com.mystudy.bbs.command.FindPasswordCommand;
import com.mystudy.bbs.command.LoginCommand;
import com.mystudy.bbs.command.LogoutCommand;
import com.mystudy.bbs.command.MasterDeleteMemberListCommand;
import com.mystudy.bbs.command.MemberDetailCommand;
import com.mystudy.bbs.command.ModifyListCommand;
import com.mystudy.bbs.command.NewsDeleteCommand;
import com.mystudy.bbs.command.NewsDeleteListCommand;
import com.mystudy.bbs.command.NewsListCommand;
import com.mystudy.bbs.command.NewsModify2Command;
import com.mystudy.bbs.command.NewsModifyCommand;
import com.mystudy.bbs.command.NewsModifyListCommand;
import com.mystudy.bbs.command.NewsSearchCommand;
import com.mystudy.bbs.command.NewsSearchListCommand;
import com.mystudy.bbs.command.NewsWriteCommand;
import com.mystudy.bbs.command.NewsWriteListCommand;
import com.mystudy.bbs.command.ProListCommand;
import com.mystudy.bbs.command.SearchCommand;
import com.mystudy.bbs.command.UpdateMemberCommand;
import com.mystudy.bbs.command.WriteCommand;
import com.mystudy.bbs.command.WriteListCommand;
import com.mystudy.bbs.command.InsertMemberCommand;
import com.mystudy.bbs.command.Modify2Command;
import com.mystudy.bbs.command.ModifyCommand;
import com.mystudy.bbs.dao.DAO;
import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.vo.CheckProVO;

@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doGet() 실행-------------");
		String type = request.getParameter("type");
		System.out.println("> type : " + type);

		Command command = null;
		if ("insertIdCheck".equals(type)) {
			String id = request.getParameter("id");
			System.out.println("> keyword : -" + id + "-");
			System.out.println("> GetJsonMembersController doGet() 실행~");
			// 한글 깨짐 방지를 위한 문자타입(UTF-8) 처리
			response.setContentType("text/html; charset=UTF-8");

			// DB데이터 가져와서 JSON 문자열 만들고 출력
			int cnt = DAO.insertIdCheck(id);
			System.out.println("> cnt : -" + cnt + "-");
			// JSON 형식 문자열 만들기
			// {"list" : [{}, {}, ...., {}] }
			String data = null;

			if (cnt > 0) {
				data = "1";
			} else {
				data = "0";
			}
			System.out.println("> data : -" + data + "-");

			response.setContentType("application/x-json; charset=UTF-8");
			response.getWriter().print(data);

			return;

		} else if ("proList".equals(type)) {
			command = new ProListCommand();
		} else if ("write".equals(type)) {
			command = new WriteCommand();
		} else if ("writeList".equals(type)) {
			command = new WriteListCommand();
		} else if ("modify".equals(type)) {
			command = new ModifyCommand();
		} else if ("modify2".equals(type)) {
			command = new Modify2Command();
		} else if ("modifyList".equals(type)) {
			command = new ModifyListCommand();
		} else if ("delete".equals(type)) {
			command = new DeleteCommand();
		} else if ("deleteList".equals(type)) {
			command = new DeleteListCommand();
		} else if ("search".equals(type)) {
			command = new SearchCommand();
		} else if ("newsList".equals(type)) {// 다른 페이지 시작
			command = new NewsListCommand();
		} else if ("detail".equals(type)) {
			command = new DetailCommand();
		} else if ("newsWrite".equals(type)) {
			command = new NewsWriteCommand();
		} else if ("newsWriteList".equals(type)) {
			command = new NewsWriteListCommand();
		} else if ("newsModify".equals(type)) {
			command = new NewsModifyCommand();
		} else if ("newsModify2".equals(type)) {
			command = new NewsModify2Command();
		} else if ("newsModifyList".equals(type)) {
			command = new NewsModifyListCommand();
		} else if ("newsDelete".equals(type)) {
			command = new NewsDeleteCommand();
		} else if ("newsDeleteList".equals(type)) {
			command = new NewsDeleteListCommand();
		} else if ("ebookList".equals(type)) {// 다른 페이지 시작
			command = new EbookListCommand();
		} else if ("declareList".equals(type)) {// 다른 페이지 시작
			command = new DeclareListCommand();
		} else if ("checkPro".equals(type)) {// 홍보물신청 커맨드
			command = new CheckProCommand();
		} else if ("checkProList".equals(type)) {// 홍보물신청 커맨드
			command = new CheckProListCommand();
		} else if ("newsSearch".equals(type)) {// 소식 검색 커맨드
			command = new NewsSearchListCommand();
		} else if ("login".equals(type)) {// 로그인 커맨드
			command = new LoginCommand();
		} else if ("logout".equals(type)) {// 로그아웃 커맨드
			command = new LogoutCommand();
		} else if ("findId".equals(type)) {// 아이디 찾기 커맨드
			command = new FindIdCommand();
		} else if ("findPassword".equals(type)) {// 비밀번호 찾기 커맨드
			command = new FindPasswordCommand();
		} else if ("insertMember".equals(type)) {
			command = new InsertMemberCommand();
		} else if ("deleteMemberList".equals(type)) {
			command = new DeleteMemberListCommand();
		} else if ("updateMember".equals(type)) {
			command = new UpdateMemberCommand();
		} else if ("allMember".equals(type)) {// 마스터로그인시 사이드 네비 모든 회원 정보 확인하기
			command = new AllMemberCommand();
		} else if ("memberDetail".equals(type)) {// 마스터로그인시 사이드 네비 모든 회원 정보 확인하기
			command = new MemberDetailCommand();
		} else if ("masterDeleteMemberList".equals(type)) {// 마스터로그인시 사이드 네비 모든 회원 정보 확인하기
			command = new MasterDeleteMemberListCommand();
		}

		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand doPost() 실행-------------");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
