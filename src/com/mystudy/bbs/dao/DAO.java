package com.mystudy.bbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.bbs.mybatis.DBService;
import com.mystudy.bbs.vo.BbsVO;
import com.mystudy.bbs.vo.CheckProVO;
import com.mystudy.bbs.vo.CommentVO;
import com.mystudy.bbs.vo.MasterVO;
import com.mystudy.bbs.vo.MemberVO;

public class DAO {
	
	//게시글(BBS)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.totalCount");
		ss.close();
	
		return totalCount;
	}
	
	public static int insertIdCheck(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.insertIdCheck", id);
		ss.close();
		
		return totalCount;
	}
	
	public static int anGetTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.anTotalCount");
		ss.close();
		
		return totalCount;
	}
	
	public static int anSearchGetCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.anSearchCount");
		ss.close();
		
		return totalCount;
	}
	
	public static int anNewsSearchGetCount(String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.anNewsSearchCount", keyword);
		ss.close();
		
		return totalCount;
	}
	
	public static int getNewsTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.newsTotalCount");
		ss.close();
	
		return totalCount;
	}
	
	public static int getSearchTotalCount(String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.newsSearchTotalCount", keyword);
		ss.close();
	
		return totalCount;
	}
	
	public static int getMemberTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.memberTotalCount");
		ss.close();
	
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	//방법1
	public static List<BbsVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("BBS.list", map);
		ss.close();
		
		return list;
	}
	
	public static List<BbsVO> newsList2(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("BBS.newsPageList", map);
		ss.close();
		
		return list;
	}
	
	public static List<BbsVO> newsSearchPageList(String begin, String end, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("BBS.newsSearchPageList", map);
		ss.close();
		
		return list;
	}
	
	public static List<MemberVO> memberPageList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("BBS.memberPageList", map);
		ss.close();
		
		return list;
	}
	//방법2
	public static List<BbsVO> getList(Map<String, Integer> map) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("BBS.list", map);
		ss.close();
		
		return list;
	}
	
	public static List<BbsVO> eBookList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> list = ss.selectList("BBS.eBookList");
		ss.close();
		
		return list;
	}
	
	public static List<BbsVO> promotionList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> vo = ss.selectList("BBS.promotionList");
		ss.close();
		
		return vo;
	}
	
	public static List<BbsVO> newsList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> vo = ss.selectList("BBS.newsList");
		ss.close();
		
		return vo;
	}
	
	public static List<BbsVO> anList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> vo = ss.selectList("BBS.anList");
		ss.close();
		
		return vo;
	}
	
	//게시글 1개 조회(검색)
	public static BbsVO selectOne(String boardNum) {
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.ebookOne", boardNum);
		ss.close();
		return vo;
	}
	
	public static MemberVO memberSelectOne(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("BBS.memberOne", id);
		ss.close();
		return vo;
	}
	
	public static List<BbsVO> newsSearch(String keyword) {
		SqlSession ss = DBService.getFactory().openSession();
		List<BbsVO> vo = ss.selectList("BBS.newsSearchList");
		ss.close();
		return vo;
	}
	
	public static BbsVO selectOneInt(int boardNum) {
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.ebookOne", boardNum);
		ss.close();
		return vo;
	}
	
	public static BbsVO ebookSelectOne(String boardNum) {
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.ebookOne", boardNum);
		ss.close();
		return vo;
	}
	
	public static BbsVO proSelectOne(String boardNum) {
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.proOne", boardNum);
		ss.close();
		return vo;
	}
	
	public static BbsVO newsSelectOne(String boardNum) {
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.newsOne", boardNum);
		ss.close();
		return vo;
	}
	public static BbsVO naSelectOne(String boardNum, String title) {
		Map<String, String> map = new HashMap<>();
		map.put("boardNum", boardNum);
		map.put("title", title);
		
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.naOne", map);
		ss.close();
		return vo;
	}
	
	public static BbsVO titleSelectOne(String title) {
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.titleOne", title);
		ss.close();
		return vo;
	}
	
	public static BbsVO newsSelectOne2(String title) {
		SqlSession ss = DBService.getFactory().openSession();
		BbsVO vo = ss.selectOne("BBS.newsOne2", title);
		ss.close();
		return vo;
	}
	
	//로그인 구현
	//아이디정보로 회원정보 찾기
	public static MemberVO loginId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("BBS.loginId", id);
		ss.close();
		return vo;
	}
	public static MemberVO findId(String birth) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("BBS.findId", birth);
		ss.close();
		return vo;
	}
	public static MemberVO findPassword(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("BBS.findPassword", id);
		ss.close();
		return vo;
	}
	//마스터아이디
	public static MasterVO masterId(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MasterVO vo = ss.selectOne("BBS.masterId", id);
		ss.close();
		return vo;
	}
	
	//게시글 입력
	public static int insert(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true); //insert는 오토커밋 : true
		int result = ss.insert("BBS.ebookInsert", bvo);
		ss.close();
		return result;
	}
	
	public static int deliveryInsert(CheckProVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true); //insert는 오토커밋 : true
		int result = ss.insert("BBS.deliveryInsert", vo);
		ss.close();
		return result;
	}
	
	public static int newsInsert(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true); //insert는 오토커밋 : true
		int result = ss.insert("BBS.newsInsert", bvo);
		ss.close();
		return result;
	}
	
	public static int anInsert(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true); //insert는 오토커밋 : true
		int result = ss.insert("BBS.anInsert", bvo);
		ss.close();
		return result;
	}
	
	public static int proInsert(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true); //insert는 오토커밋 : true
		int result = ss.insert("BBS.proInsert", bvo);
		ss.close();
		return result;
	}
	
	public static int ebookInsert(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true); //insert는 오토커밋 : true
		int result = ss.insert("BBS.ebookInsert", bvo);
		ss.close();
		return result;
	}
	
	//게시글 수정
	public static int update(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("BBS.update", bvo);
		ss.close();
		return result;
	}
	
	public static int anUpdate(BbsVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("BBS.anUpdate", vo);
		ss.close();
		return result;
	}
	
	public static int newsUpdate(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("BBS.newsUpdate", bvo);
		ss.close();
		return result;
	}
	
	public static int proUpdate(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("BBS.proUpdate", bvo);
		ss.close();
		return result;
	}
	
	//e북 게시글 수정
	public static int eBookUpdate(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("BBS.eBookUpdate", bvo);
		ss.close();
		return result;
	}
	
	public static int updateMember(MemberVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("BBS.updateMember", vo);
		ss.close();
		return result;
	}
	
	//게시글 삭제
	public static void delete(BbsVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("BBS.delete", bvo);
		ss.close();
	}
	
	//=============== 댓글 관련 =================
	//댓글목록가져오기
	public static List<CommentVO> getCommList(int bbsIdx) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<CommentVO> list = ss.selectList("BBS.commList", bbsIdx);
		ss.close();
		return list;
	}
	
	//댓글작성하기
	public static int insertComm(CommentVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("BBS.insertComm", cvo);
		ss.close();
		return result;
	}
	
	//댓글삭제하기
	public static void deleteComm(CommentVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("BBS.deleteComm", cvo);
		ss.close();
	}
	
	//댓글하나만조회
	public static CommentVO commOne(int commentIdx) {
		SqlSession ss = DBService.getFactory().openSession();
		CommentVO vo = ss.selectOne("BBS.commOne", commentIdx);
		ss.close();
		return vo;
		}
	
	
	
}
