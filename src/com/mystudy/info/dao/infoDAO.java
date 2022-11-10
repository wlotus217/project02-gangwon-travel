package com.mystudy.info.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.info.mybatis.DBService;
import com.mystudy.info.vo.contestVO;
import com.mystudy.info.vo.infoVO;

public class infoDAO {
	
	//게시글(infoVO)에 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("INFO.totalCount");
		ss.close();
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<infoVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<infoVO> list = ss.selectList("INFO.list", map);
		ss.close();
		return list;
	}
	
	
	
	//게시글 1개 조회(검색)
	public static infoVO selectOne(int infonum) {
		SqlSession ss = DBService.getFactory().openSession();
		infoVO vo = ss.selectOne("INFO.one", infonum);
		ss.close();
		return vo;
	}
	
	
	//게시글 입력
	public static int insert(infoVO ivo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("INFO.insert", ivo);
		ss.close();
		return result;
	}
	
	public static int getsearchTotalCount(String info) {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("INFO.searchtotalCount", info);
		ss.close();
		return totalCount;
	}
	
	public static List<infoVO> getInfoList(int begin, int end, String info) {
		Map<String, Object> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("info", info);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<infoVO> list = ss.selectList("INFO.titlesearch", map);
		ss.close();
		return list;
	}
}







