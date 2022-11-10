package com.mystudy.info.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.info.mybatis.DBService;
import com.mystudy.info.vo.contestVO;
import com.mystudy.info.vo.infoVO;

public class contestDAO {
	
	//게시글(PICCONTEST)에 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("CONTEST.totalCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<contestVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<contestVO> list = ss.selectList("CONTEST.list", map);
		ss.close();
		return list;
	}

	
	//게시글 1개 조회(검색)
	public static contestVO selectOne(int picNum) {
		SqlSession ss = DBService.getFactory().openSession();
		contestVO vo = ss.selectOne("CONTEST.one", picNum);
		ss.close();
		return vo;
	}
	
	
	//게시글 입력
	public static int insert(contestVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("CONTEST.insert", cvo);
		ss.close();
		return result;
	}
	
	public static int getsearchTotalCount(String contesttitle) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("CONTEST.searchtotalCount", contesttitle);
		ss.close();
		return totalCount;
	}
	//게시글 제목으로 검색
	
	 /*public static List<contestVO> getContestList(String contesttitle) {
		 SqlSession ss = DBService.getFactory().openSession(); 
		 List<contestVO> list = ss.selectList("CONTEST.titlesearch", contesttitle); 
		 ss.close(); 
		 return list;
	 }*/
	
	 public static List<contestVO> getContestList(int begin, int end, String contesttitle) {
			Map<String, Object> map = new HashMap<>();
			map.put("begin", begin);
			map.put("end", end);
			map.put("contesttitle", contesttitle);
			
			SqlSession ss = DBService.getFactory().openSession();
			List<contestVO> list = ss.selectList("CONTEST.titlesearch", map);
			ss.close();
			return list;
		}
	
	public static int contestDelete(int picNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("CONTEST.contestdelete", picNum);
		ss.close();
		return result;
	}
	
	public static int contestinsert(contestVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("CONTEST.contestinsert", cvo);
		ss.close();
		return result;
	}
	
	public static int contestModify(contestVO cvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("CONTEST.contestmodify", cvo);
		ss.close();
		return result;
	}
	
}







